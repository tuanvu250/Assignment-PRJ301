/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import static com.sun.xml.internal.ws.spi.db.BindingContextFactory.LOGGER;
import dao.OtpDAO;
import dao.UserDAO;
import dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import java.util.logging.Level;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import services.VerifyRegister;
import utils.EmailUtils;
import utils.PasswordUtils;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "ForgotPassController", urlPatterns = {"/ForgotPassController"})
public class ForgotPassController extends HttpServlet {

    protected static final String FORGOT = "/user/forgotPass.jsp";
    protected static final String OTP = "/user/verifyOTP.jsp";
    protected static final String RESET = "/user/resetPass.jsp";
    protected static final UserDAO dao = new UserDAO();
    protected static final OtpDAO otpDAO = new OtpDAO();

    private boolean sendCongratulationsEmail(String email, String fullName, String otp) {
        try {
            return EmailUtils.sendOTPEmail(email, fullName, otp);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error sending congratulations email: {0}", e.getMessage());
            return false;
        }
    }

    protected String processCheckEmail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = FORGOT;
        String email = request.getParameter("email");
        UserDTO user = dao.readByEmail(email);
        if (user == null) {
            request.setAttribute("errorEmail", "This email don't have account.");
        } else {
            url = OTP;
            String otp = String.format("%06d", new Random().nextInt(999999));
            request.setAttribute("username", user.getUser_name());
            otpDAO.saveOTP(user.getUser_name(), otp);
            boolean checkSend = sendCongratulationsEmail(email, user.getFull_name(), otp);

        }
        return url;
    }

    protected String processCheckOTP(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = OTP;
        String otp = request.getParameter("otp");
        String username = request.getParameter("username");
        boolean check = otpDAO.verifyOTP(username, otp);
        if (check) {
            request.setAttribute("username", username);
            otpDAO.deleteOTP(username);
            url = RESET;
        } else {
            request.setAttribute("username", username);
            request.setAttribute("errorOTP", "This OTP is wrong. Please try again!");

        }
        return url;
    }

    protected String processSendAgain(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = OTP;
        String username = request.getParameter("username");
        otpDAO.deleteOTP(username);
        UserDTO user = dao.readByUsName(username);
        String otp = String.format("%06d", new Random().nextInt(999999));
        request.setAttribute("username", username);
        otpDAO.saveOTP(user.getUser_name(), otp);
        boolean checkSend = sendCongratulationsEmail(user.getEmail(), user.getFull_name(), otp);
        return url;
    }

    protected String processResetPass(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = RESET;
        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");
        String username = request.getParameter("username");
        UserDTO user = dao.readByUsName(username);
        if (!VerifyRegister.verifyPassword(password1)) {
            request.setAttribute("errorPass", "Password must be at least 8 characters!");
        } else {
            if (password1.equals(password2)) {
                String hashedNewPassword = PasswordUtils.hashPassword(password2);
                System.out.println("OK Hash");
                user.setPassword(hashedNewPassword);
                System.out.println("OK Set");
                if (dao.update(user)) {
                    System.out.println("Success");
                    request.setAttribute("changeSuccess", "Reset Password successful!");
                } else {
                    request.setAttribute("changeFailed", "Reset Password failed!");
                }
            } else {
                request.setAttribute("errorReset", "Confirm password incorrect.");
            }
        }
        return url;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = FORGOT;
        try {
            String action = request.getParameter("action");
            if (action != null) {
                if (action.equals("submitEmail")) {
                    url = processCheckEmail(request, response);
                } else if (action.equals("submitOTP")) {
                    url = processCheckOTP(request, response);
                } else if (action.equals("sendAgain")) {
                    url = processSendAgain(request, response);
                } else if (action.equals("resetPass")) {
                    url = processResetPass(request, response);
                }
            }
        } catch (Exception e) {
            log("ERROR: " + e.toString());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
