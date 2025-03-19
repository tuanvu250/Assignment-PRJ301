package controller;

import dao.UserDAO;
import dto.UserDTO;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import services.VerifyRegister;
import utils.AuthUtils;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
@WebServlet(name = "ProfileController", urlPatterns = {"/ProfileController"})
public class ProfileController extends HttpServlet {

    private static final String UPLOAD_DIRECTORY = "D:/DOCUMENTFPT/PRJ/GITCM/Assignment-PRJ301/uploaded_images/";
    private static final String PROFILE_PAGE = "user/profile.jsp";
    private static final String HOME_PAGE = "home/home.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = PROFILE_PAGE;
        HttpSession session = request.getSession();
        String action = request.getParameter("action");

        try {
            if (action == null) {
                url = HOME_PAGE;
            } else {
                if (action.equals("updateImage")) {
                    url = updateProfileImage(request, response, session);
                } else if (action.equals("updateInfo")) {
                    url = updateUserInfo(request, response, session);
                }
            }
        } catch (Exception e) {
            log("ERROR: " + e.toString());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }
    }

    protected String updateProfileImage(HttpServletRequest request, HttpServletResponse response, HttpSession session)
            throws ServletException, IOException {
        UserDAO usDao = new UserDAO();
        UserDTO user = AuthUtils.getUser(session);
        String username = user.getUser_name();
        Part filePart = request.getPart("profileImage");

        if (filePart == null || filePart.getSize() == 0) {
            request.setAttribute("errorFile", "Error Upload File!");
            return PROFILE_PAGE;
        }

        // Lấy tên file gốc và kiểm tra phần mở rộng
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        if (!VerifyRegister.verifyImage(fileName)) {
            request.setAttribute("errorFile", "Invalid File Format! Only JPG, PNG, GIF, BMP, and WEBP allowed.");
            return PROFILE_PAGE;
        }

        // Thư mục lưu ảnh
        File uploadDir = new File(UPLOAD_DIRECTORY);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        // Lấy phần mở rộng file
        String fileExtension = fileName.substring(fileName.lastIndexOf(".")).toLowerCase();

        // Xóa ảnh cũ (nếu có)
        File[] existingFiles = uploadDir.listFiles((dir, name) -> name.startsWith(username + "_"));
        if (existingFiles != null) {
            for (File file : existingFiles) {
                file.delete();
            }
        }

        // Đặt tên file mới theo `username_timestamp.ext`
        String newFileName = username + "_" + System.currentTimeMillis() + fileExtension;
        String filePath = UPLOAD_DIRECTORY + newFileName;
        // lưu vào database;
        user.setImage(newFileName);
        usDao.update(user);
        // Lưu file mới
        try (InputStream is = filePart.getInputStream()) {
            if (uploadImage(is, filePath)) {
                request.setAttribute("uploadFile", "Upload Image Success!");
            } else {
                request.setAttribute("uploadFile", "Upload Image Failed!");
            }
        }
        session.setAttribute("imageUser", newFileName);
        return PROFILE_PAGE;
    }

    public boolean uploadImage(InputStream is, String path) {
        boolean check = false;
        try (FileOutputStream fops = new FileOutputStream(path)) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = is.read(buffer)) != -1) {
                fops.write(buffer, 0, bytesRead);
            }
            check = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    private String updateUserInfo(HttpServletRequest request, HttpServletResponse response, HttpSession session)
            throws ServletException, IOException {
        UserDAO userDao = new UserDAO();
        UserDTO user = AuthUtils.getUser(session);
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        user.setFull_name(fullname);
        user.setEmail(email);
        user.setPhone_number(phone);

        if (userDao.update(user)) {
            request.setAttribute("uploadProfile", "Update Profile Success!");
        } else {
            request.setAttribute("uploadProfile", "Update Profile Failed!");
        }

        return PROFILE_PAGE;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
