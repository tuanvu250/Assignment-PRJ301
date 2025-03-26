package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "LoadImageController", urlPatterns = {"/LoadImageController"})
public class LoadImageController extends HttpServlet {

    private String UPLOAD_DIRECTORY;

    @Override
    public void init() throws ServletException {
        // Lấy đường dẫn thực tế của thư mục lưu trữ ảnh trong dự án
        UPLOAD_DIRECTORY = getServletContext().getRealPath("/assets/img/img-users/");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String imageName = request.getParameter("image");

        if (imageName == null || imageName.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Image name is required");
            return;
        }

        File imageFile = new File(UPLOAD_DIRECTORY, imageName);
        if (!imageFile.exists()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Image not found");
            return;
        }

        // Set MIME type của ảnh
        String mimeType = getServletContext().getMimeType(imageFile.getName());
        if (mimeType == null) {
            mimeType = "application/octet-stream";
        }
        response.setContentType(mimeType);
        response.setContentLength((int) imageFile.length());

        // Cho phép CORS nếu cần thiết
        response.setHeader("Access-Control-Allow-Origin", "*");

        // Trả về ảnh
        try (FileInputStream fis = new FileInputStream(imageFile);
                OutputStream os = response.getOutputStream()) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = fis.read(buffer)) != -1) {
                os.write(buffer, 0, bytesRead);
            }
        }
    }
}
