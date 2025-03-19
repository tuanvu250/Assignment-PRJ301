package controller;

import dao.UserDAO;
import dto.UserDTO;
import java.io.IOException;
import java.util.UUID;
import java.util.logging.Level;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import services.VerifyRegister;
import utils.AuthUtils;
import utils.EmailUtils;
import utils.PasswordUtils;

@WebServlet(name = "UserController", urlPatterns = {"/UserController"})
public class UserController extends HttpServlet {

    private static final String HOME_PAGE = "/home/home.jsp";
    private static final String LOGIN_PAGE = "/user/login.jsp";
    private static final String REGISTER_PAGE = "/user/register.jsp";
    private static UserDAO userDao = new UserDAO();
    private static final java.util.logging.Logger LOGGER = java.util.logging.Logger.getLogger(UserController.class.getName());

    protected String processLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME_PAGE;
        String user_name = request.getParameter("username");
        System.out.println(user_name);
        String password = request.getParameter("password");
        if (AuthUtils.verifyUser(user_name, password)) {
            url = HOME_PAGE;
            UserDTO user = AuthUtils.getUser(user_name);            
            request.getSession().setAttribute("user", user);
        } else {
            url = LOGIN_PAGE;
            request.setAttribute("errorLogin", "Incorrect UserName Or Password!");
        }
        return url;
    }

    protected String processLogout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME_PAGE;
        HttpSession session = request.getSession();
        if (AuthUtils.isLoggedIn(session)) {
            request.getSession().invalidate();
        }
        return url;
    }

    private boolean sendCongratulationsEmail(String email, String fullName, String userName) {
        try {
            return EmailUtils.sendRegistrationEmail(email, fullName, userName);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error sending congratulations email: {0}", e.getMessage());
            return false;
        }
    }

    protected String processRegister(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME_PAGE;
        boolean checkRegister = true;
        try {
            String username = request.getParameter("regUsername");
            String password = request.getParameter("regPassword");
            String cfPassword = request.getParameter("regCfPassword");
            String fullname = request.getParameter("regFullname");
            String email = request.getParameter("regEmail");
            String phone = request.getParameter("regPhone");
            if (!VerifyRegister.verifyUsername(username)) {
                checkRegister = false;
                request.setAttribute("errorMessUsername", "Sorry, this username is unavailable. Please try another one!");
            }
            if (!VerifyRegister.verifyPassword(password)) {
                checkRegister = false;
                request.setAttribute("errorMessPassword", "Password must be at least 8 characters long!");
            }
            if (!VerifyRegister.verifyConfirmPassword(password, cfPassword)) {
                checkRegister = false;
                request.setAttribute("errorMessCfPassword", "Passwords do not match. Please try again!");
            }
            if (!VerifyRegister.verifyFullname(fullname)) {
                checkRegister = false;
                request.setAttribute("errorMessFullname", "This field is required. Please input!");
            }
            if (!VerifyRegister.verifyEmail(email)) {
                checkRegister = false;
                request.setAttribute("errorMessEmail", "Invalid email format. Please enter a valid email address!");
            }
            if (!VerifyRegister.verifyPhoneNumber(phone)) {
                checkRegister = false;
                request.setAttribute("errorMessPhone", "Invalid phone number. Please enter a valid one!");
            }

            String token = UUID.randomUUID().toString();

            UserDTO newUser = new UserDTO(fullname, username, password, email, phone, 3, "ACTIVE", token, null);
            UserDTO existUser = userDao.readByUsName(newUser.getUser_name());
            if (existUser != null) {
                request.setAttribute("errorMessUsername", "User ID already exists. Please choose another one.");
                checkRegister = false;
            }
            UserDTO existEmail = userDao.readByEmail(email);
            if (existEmail != null) {
                request.setAttribute("errorMessEmail", "Email already in use. Please use another email address.");
                checkRegister = false;
            }
            if (!checkRegister) {
                url = REGISTER_PAGE;
                request.setAttribute("newUser", newUser);
            } else {
                String hashPassword = PasswordUtils.hashPassword(newUser.getPassword());
                newUser.setPassword(hashPassword);
                boolean result = userDao.create(newUser);
                if (result) {
                    boolean emailSent = sendCongratulationsEmail(newUser.getEmail(), newUser.getFull_name(), newUser.getUser_name());

                    if (emailSent) {
                        LOGGER.log(Level.INFO, "Congratulations email sent to {0}", email);
                        request.setAttribute("success", "Registration successful! Welcome email has been sent to your email address. You can now login.");
                    } else {
                        LOGGER.log(Level.WARNING, "Failed to send congratulations email to {0}", email);
                        request.setAttribute("success", "Registration successful! You can now login. (Note: Welcome email could not be sent)");
                    }
                } else {
                    url = REGISTER_PAGE;
                    request.setAttribute("errorRegister", "Registration failed. Please try again!");
                }
                // tự đăng nhập khi đăng ký thành công
                if (AuthUtils.verifyUser(newUser.getUser_name(), newUser.getPassword())) {
                    url = HOME_PAGE;
                    UserDTO user = AuthUtils.getUser(newUser.getUser_name());
                    request.getSession().setAttribute("user", user);
                }
            }
        } catch (Exception e) {
            log("ERROR: " + e.toString());
        }
        return url;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = HOME_PAGE;
        try {
            String action = request.getParameter("action");
            if (action == null) {
                url = HOME_PAGE;
            } else {
                if (action.equals("login")) {
                    url = processLogin(request, response);
                } else if (action.equals("logout")) {
                    url = processLogout(request, response);
                } else if (action.equals("register")) {
                    url = processRegister(request, response);
                }
            }
        } catch (Exception e) {
            log("ERROR: " + e.toString());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
            //response.sendRedirect(request.getContextPath() + url);
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
