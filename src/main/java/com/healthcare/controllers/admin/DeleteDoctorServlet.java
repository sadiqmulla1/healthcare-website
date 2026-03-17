package com.healthcare.controllers.admin;

import com.healthcare.config.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.File;
import java.io.IOException;
import java.sql.*;

@WebServlet("/admin/doctors/delete")
public class DeleteDoctorServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "images/doctors";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get doctor ID from the form
        String idParam = request.getParameter("id");
        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/admin/manageDoctors.jsp?error=NoDoctorId");
            return;
        }

        int doctorId;
        try {
            doctorId = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/admin/manageDoctors.jsp?error=InvalidDoctorId");
            return;
        }

        String photoFileName = null;

        // First, get the photo filename from the database
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(
                     "SELECT photo_path FROM doctors WHERE id = ?")) {

            stmt.setInt(1, doctorId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                photoFileName = rs.getString("photo_path");
            } else {
                // Doctor not found
                response.sendRedirect(request.getContextPath() + "/admin/manageDoctors?error=DoctorNotFound");
                return;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/manageDoctors?error=DatabaseError");
            return;
        }

        // Delete doctor from database
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(
                     "DELETE FROM doctors WHERE id = ?")) {

            stmt.setInt(1, doctorId);
            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/manageDoctors?error=DatabaseError");
            return;
        }

        // Delete the photo file from server
        if (photoFileName != null) {
            String applicationPath = request.getServletContext().getRealPath("");
            String photoPath = applicationPath + File.separator + UPLOAD_DIR + File.separator + photoFileName;
            File photoFile = new File(photoPath);
            if (photoFile.exists()) {
                photoFile.delete();
            }
        }

        // Redirect to manageDoctors.jsp with success
        response.sendRedirect(request.getContextPath() + "/admin/manageDoctors?success=DoctorDeleted");
    }
}

