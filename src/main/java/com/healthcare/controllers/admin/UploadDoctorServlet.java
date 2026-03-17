package com.healthcare.controllers.admin;

import com.healthcare.config.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.File;
import java.io.IOException;
import java.sql.*;

@WebServlet("/admin/doctors/upload")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024, // 1MB
        maxFileSize = 5 * 1024 * 1024,   // 5MB
        maxRequestSize = 10 * 1024 * 1024 // 10MB
)
public class UploadDoctorServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "images/doctors";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8"); // Handle UTF-8 characters

        // Get form fields
        String name = request.getParameter("name");
        String speciality = request.getParameter("speciality");
        String education = request.getParameter("education");
        int experience = 0;

        try {
            experience = Integer.parseInt(request.getParameter("experience"));
        } catch (NumberFormatException e) {
            // If experience is invalid, redirect with error
            response.sendRedirect(request.getContextPath() + "/admin/manageDoctors?error=InvalidExperience");
            return;
        }

        // Handle photo upload
        Part photoPart = request.getPart("photo");

        // Check if a file was uploaded
        if (photoPart == null || photoPart.getSize() == 0) {
            response.sendRedirect(request.getContextPath() + "/admin/manageDoctors?error=NoPhoto");
            return;
        }

        // Validate file type
        String contentType = photoPart.getContentType();
        if (!contentType.startsWith("image/")) {
            response.sendRedirect(request.getContextPath() + "/admin/manageDoctors?error=InvalidFileType");
            return;
        }

        // Generate unique file name
        String originalFileName = photoPart.getSubmittedFileName();
        String fileExtension = "";
        int dotIndex = originalFileName.lastIndexOf('.');
        if (dotIndex >= 0) {
            fileExtension = originalFileName.substring(dotIndex);
        }
        String fileName = System.currentTimeMillis() + fileExtension;

        // Save the file to the server
        String applicationPath = request.getServletContext().getRealPath("");
        String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdirs();

        String filePath = uploadPath + File.separator + fileName;
        photoPart.write(filePath);

        // Save data to database
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(
                     "INSERT INTO doctors (name, speciality, photo_path, experience, education) VALUES (?, ?, ?, ?, ?)")) {

            stmt.setString(1, name);
            stmt.setString(2, speciality);
            stmt.setString(3, fileName); // store only the file name
            stmt.setInt(4, experience);
            stmt.setString(5, education);

            stmt.executeUpdate();

            // Redirect to manage page with success
            response.sendRedirect(request.getContextPath() + "/admin/manageDoctors?success=DoctorAdded");

        } catch (SQLException e) {
            e.printStackTrace(); // Log for debugging
            response.sendRedirect(request.getContextPath() + "/admin/manageDoctors?error=DatabaseError");
        }
    }
}
