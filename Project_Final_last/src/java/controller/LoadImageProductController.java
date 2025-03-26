package controller;

import dao.ShoesImageDAO;
import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "LoadImageProductController", urlPatterns = {"/LoadImageProductController"})
public class LoadImageProductController extends HttpServlet {

    private static final String STATUS_FILE = "/WEB-INF/images_loaded.txt"; // File đánh dấu đã chạy

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String realPath = getServletContext().getRealPath(STATUS_FILE);
        File statusFile = new File(realPath);

        // Nếu file đã tồn tại => Ảnh đã được load trước đó => Không chạy lại
        if (statusFile.exists()) {
            response.getWriter().println("⚠ Ảnh đã được load trước đó! Không chạy lại.");
            return;
        }

        // Bắt đầu load ảnh nếu chưa từng chạy
        String uploadPath = getServletContext().getRealPath("/assets/img/img-products/");
        File folder = new File(uploadPath);

        if (!folder.exists() || !folder.isDirectory()) {
            response.getWriter().println("⚠ Thư mục ảnh không tồn tại!");
            return;
        }

        File[] imageFiles = folder.listFiles();
        if (imageFiles == null || imageFiles.length == 0) {
            response.getWriter().println("⚠ Không có ảnh nào để tải lên!");
            return;
        }

        int count = 0;
        for (File file : imageFiles) {
            if (file.isFile() && (file.getName().endsWith(".jpg") || file.getName().endsWith(".png"))) {
                String fileName = file.getName().replace(".jpg", "").replace(".png", "");

                // File có dạng SP001_CL001_1
                String[] parts = fileName.split("_");
                if (parts.length < 2) continue; // Bỏ qua file sai định dạng

                String shoesId = parts[0]; // SP001
                int imageOrder;

                try {
                    imageOrder = Integer.parseInt(parts[parts.length - 1]); // Lấy phần cuối làm imageOrder
                } catch (NumberFormatException e) {
                    continue;
                }

                String imageUrl = "assets/img/img-products/" + file.getName();
                try {
                    if (ShoesImageDAO.insertImage(shoesId, imageUrl, imageOrder)) {
                        count++;
                    }
                } catch (Exception e) {
                    response.getWriter().println("❌ Lỗi khi chèn ảnh: " + file.getName() + " - " + e.getMessage());
                }
            }
        }

        // Sau khi tải ảnh thành công, tạo file đánh dấu nếu có ít nhất 1 ảnh được tải
        if (count > 0) {
            try {
                if (statusFile.createNewFile()) {
                    response.getWriter().println("✅ Đã tải " + count + " ảnh lên database!");
                } else {
                    response.getWriter().println("⚠ Không thể tạo file trạng thái, nhưng ảnh đã được tải lên.");
                }
            } catch (IOException e) {
                response.getWriter().println("❌ Lỗi khi tạo file trạng thái: " + e.getMessage());
            }
        } else {
            response.getWriter().println("⚠ Không có ảnh hợp lệ để tải lên.");
        }
    }
}
