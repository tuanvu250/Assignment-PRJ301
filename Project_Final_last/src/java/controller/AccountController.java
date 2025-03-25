/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import dto.RoleDTO;
import dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
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
import utils.PasswordUtils;

/**
 *
 * @author Dell
 */
@WebServlet(name = "AccountController", urlPatterns = {"/AccountController"})
public class AccountController extends HttpServlet {

    private static final String HOME_PAGE = "/home/home.jsp";
    private static final String LOGIN_PAGE = "/user/login.jsp";
    private static final String MANAGEUSER_PAGE = "/admin/manageUsers.jsp";
    private static final String ADMIN_PAGE = "/admin/dashboard.jsp";
    private static final String USERFORM = "/admin/userForm.jsp";
    private static UserDAO usdao = new UserDAO();

    protected String processViewAccount(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME_PAGE;
        HttpSession session = request.getSession();
        if (AuthUtils.checkIsAdmin(session)) {
            url = MANAGEUSER_PAGE;
            List<UserDTO> accounts = usdao.readAll();
            request.setAttribute("accounts", accounts);
        }
        return url;
    }

    protected String processSearchAccount(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME_PAGE;
        HttpSession session = request.getSession();
        if (AuthUtils.checkIsAdmin(session)) {
            url = MANAGEUSER_PAGE;
            String searchTerm = request.getParameter("searchTerm");
            if (searchTerm == null) {
                searchTerm = "";
            }
            List<UserDTO> accounts = usdao.readByUsNameTerm(searchTerm);
            request.setAttribute("accounts", accounts);
            request.setAttribute("searchTerm", searchTerm);
        }
        return url;
    }

    protected String processDeleteAccount(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME_PAGE;
        HttpSession session = request.getSession();
        if (AuthUtils.checkIsAdmin(session)) {
            url = MANAGEUSER_PAGE;
            String accountId = request.getParameter("accountId");
            if (accountId != null) {
                if (usdao.delete(accountId)) {
                    request.setAttribute("resultDelete", "Delete Successfully!");
                } else {
                    request.setAttribute("resultDelete", "Delete Failed!");
                }
                processViewAccount(request, response);
            }
        }
        return url;
    }

    protected String processAdd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME_PAGE;
        HttpSession session = request.getSession();
        boolean checkRegister = true;
        if (AuthUtils.checkIsAdmin(session)) {

            try {
                String username = request.getParameter("regUsername");
                String password = request.getParameter("regPassword");
                String cfPassword = request.getParameter("regCfPassword");
                String fullname = request.getParameter("regFullname");
                String email = request.getParameter("regEmail");
                String phone = request.getParameter("regPhone");
                String role = request.getParameter("regRole");
                int roleId = Integer.parseInt(role);;
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
                UserDTO newUser = new UserDTO(fullname, username, password, email, phone, roleId, "ACTIVE", token, null);
                UserDTO existUser = usdao.readByUsName(newUser.getUser_name());
                if (existUser != null) {
                    request.setAttribute("errorMessUsername", "User ID already exists. Please choose another one.");
                    checkRegister = false;
                }
                UserDTO existEmail = usdao.readByEmail(email);
                if (existEmail != null) {
                    request.setAttribute("errorMessEmail", "Email already in use. Please use another email address.");
                    checkRegister = false;
                }
                if (!checkRegister) {
                    url = USERFORM;
                    request.setAttribute("newUser", newUser);
                } else {
                    String hashPassword = PasswordUtils.hashPassword(newUser.getPassword());
                    newUser.setPassword(hashPassword);
                    if (usdao.create(newUser)) {
                        url = MANAGEUSER_PAGE;
                        request.setAttribute("add_editSuccess", "Add new Account successfully!");
                        processViewAccount(request, response);
                    } else {
                        url = USERFORM;
                        request.setAttribute("error_editAdd", "Registration failed. Please try again!");
                    }

                }
            } catch (Exception e) {
                log("ERROR: " + e.toString());
            }
        }
        return url;
    }

    protected String processEditpage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME_PAGE;
        HttpSession session = request.getSession();
        if (AuthUtils.checkIsAdmin(session)) {
            String accountId = request.getParameter("accountId");
            UserDTO us = usdao.readByUsName(accountId);
            if (us != null) {
                request.setAttribute("newUser", us);
                request.setAttribute("action", "update");
                url = USERFORM;
            } else {
                url = MANAGEUSER_PAGE;
                request.setAttribute("errorEditpage", "User not found!");
                processViewAccount(request, response);
            }
        }
        return url;
    }

    protected String processUpdate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME_PAGE;
        HttpSession session = request.getSession();
        boolean checkRegister = true;

        if (AuthUtils.checkIsAdmin(session)) {
            try {
                // Lấy username từ request nhưng không cho phép chỉnh sửa
                String username = request.getParameter("regUsername");

                // Không lấy password để đảm bảo admin không thể cập nhật mật khẩu
                UserDTO oldUser = usdao.readByUsName(username);
                if (oldUser == null) {
                    request.setAttribute("error_editAdd", "User not found!");
                    return MANAGEUSER_PAGE;
                }

                // Lấy các thông tin cần cập nhật
                String fullname = request.getParameter("regFullname");
                String email = request.getParameter("regEmail");
                String phone = request.getParameter("regPhone");
                String role = request.getParameter("regRole");

                // Xác định roleId mặc định
                int roleId = oldUser.getRole_id();

                // Kiểm tra các trường nhập vào
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

                // Kiểm tra role nếu có thay đổi
                if (!VerifyRegister.verifyRole(role)) {
                    checkRegister = false;
                    request.setAttribute("errorMessRole", "Role must be select one value!");
                } else {
                    roleId = Integer.parseInt(role);
                }

                // Kiểm tra email đã tồn tại chưa (trừ trường hợp trùng với email cũ)
                UserDTO existEmail = usdao.readByEmail(email);
                if (existEmail != null && !existEmail.getUser_name().equals(username)) {
                    request.setAttribute("errorMessEmail", "Email already in use. Please use another email address.");
                    checkRegister = false;
                }

                // Nếu có lỗi, quay lại trang cập nhật với dữ liệu đã nhập
                if (!checkRegister) {
                    url = USERFORM;
                    request.setAttribute("newUser", oldUser);
                    request.setAttribute("action", "update");
                } else {
                    // Cập nhật user với thông tin mới nhưng giữ nguyên username và password cũ
                    UserDTO updatedUser = new UserDTO(
                            fullname,
                            username,
                            oldUser.getPassword(),
                            email,
                            phone,
                            roleId,
                            oldUser.getStatus(),
                            oldUser.getToken(),
                            oldUser.getImage()
                    );

                    boolean result = usdao.update(updatedUser);

                    if (result) {
                        url = MANAGEUSER_PAGE;
                        request.setAttribute("add_editSuccess", "Update User successful!");
                        processViewAccount(request, response);
                    } else {
                        url = USERFORM;
                        request.setAttribute("error_editAdd", "Update failed. Please try again!");
                    }
                }
            } catch (Exception e) {
                log("ERROR: " + e.toString());
            }
        }
        return url;
    }

    protected String processCancel(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME_PAGE;
        HttpSession session = request.getSession();
        if (AuthUtils.checkIsAdmin(session)) {
            url = MANAGEUSER_PAGE;
            processSearchAccount(request, response);
        }
        return url;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String url = ADMIN_PAGE;
        try {
            String action = request.getParameter("action");
            if (action == null) {
                url = ADMIN_PAGE;
            } else {
                if (action.equals("manageAccount")) {
                    url = processViewAccount(request, response);
                } else if (action.equals("searchUser")) {
                    url = processSearchAccount(request, response);
                } else if (action.equals("delete")) {
                    url = processDeleteAccount(request, response);
                } else if (action.equals("cancel")) {
                    url = processCancel(request, response);
                } else if (action.equals("add")) {
                    url = processAdd(request, response);
                } else if (action.equals("editAccount")) {
                    url = processEditpage(request, response);
                } else if (action.equals("update")) {
                    url = processUpdate(request, response);
                }
            }
        } catch (Exception e) {
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
