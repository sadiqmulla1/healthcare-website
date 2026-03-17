package com.healthcare.controllers.admin;

import com.healthcare.config.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.sql.*;

@WebServlet("/admin/photos/upload")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,  // 1 MB
        maxFileSize = 5 * 1024 * 1024,    // 5 MB
        maxRequestSize = 10 * 1024 * 1024 // 10 MB
)
public class PhotoUploadServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "images/photo_gallery";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String title = request.getParameter("title");
        Part filePart = request.getPart("image");

        if (title == null || title.isEmpty() || filePart == null) {
            response.sendRedirect(request.getContextPath() + "admin/managePhotos?error=Missing+title+or+file");
            return;
        }

        // Get absolute path of the webapp
        String applicationPath = request.getServletContext().getRealPath("");
        String uploadPath = applicationPath + File.separator + UPLOAD_DIR;

        // Create upload directory if it doesn't exist
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        // Save the file
        String fileName = Path.of(filePart.getSubmittedFileName()).getFileName().toString(); // avoid path issues
        String filePath = uploadPath + File.separator + fileName;
        filePart.write(filePath);

        // Save record to DB
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement("INSERT INTO photos (image_url, title) VALUES (?, ?)")) {

            ps.setString(1, fileName); // store only the filename, not full path
            ps.setString(2, title);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Redirect back to manage photos page

        response.sendRedirect(request.getContextPath() + "/admin/managePhotos");
    }
}

