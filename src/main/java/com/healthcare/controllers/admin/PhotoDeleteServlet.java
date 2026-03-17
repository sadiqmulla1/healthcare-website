package com.healthcare.controllers.admin;

import com.healthcare.config.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.File;
import java.io.IOException;
import java.sql.*;

@WebServlet("/admin/photos/delete")
public class PhotoDeleteServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "images/photo_gallery";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");
        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/admin/managePhotos");
            return;
        }

        int id = Integer.parseInt(idParam);

        // Database connection
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement psSelect = conn.prepareStatement("SELECT image_url FROM photos WHERE id = ?");
             PreparedStatement psDelete = conn.prepareStatement("DELETE FROM photos WHERE id = ?")) {

            // Step 1: Get filename from DB
            psSelect.setInt(1, id);
            ResultSet rs = psSelect.executeQuery();
            if (rs.next()) {
                String fileName = rs.getString("image_url");

                // Step 2: Delete file from server
                String applicationPath = request.getServletContext().getRealPath("");
                File file = new File(applicationPath + File.separator + UPLOAD_DIR + File.separator + fileName);
                if (file.exists()) {
                    file.delete();
                }
            }

            // Step 3: Delete record from DB
            psDelete.setInt(1, id);
            psDelete.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Redirect back to manage photos page
        response.sendRedirect(request.getContextPath() + "/admin/managePhotos");
    }
}
