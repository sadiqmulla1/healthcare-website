package com.healthcare.controllers.admin;

import com.healthcare.config.DBConnection;
import com.healthcare.models.Appointment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/admin/home")
public class AdminAppointmentsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Appointment> appointments = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(
                     "SELECT id, patient_name, consultation_type, mobile, patient_type, created_at, completed " +
                             "FROM appointments ORDER BY created_at DESC")) {

            while (rs.next()) {
                Appointment appt = new Appointment();
                appt.setId(rs.getInt("id"));
                appt.setPatientName(rs.getString("patient_name"));
                appt.setConsultationType(rs.getString("consultation_type"));
                appt.setMobile(rs.getString("mobile"));
                appt.setPatientType(rs.getString("patient_type"));
                appt.setCreatedAt(rs.getTimestamp("created_at"));
                appt.setCompleted(rs.getBoolean("completed"));

                appointments.add(appt);

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        // Send appointments list to JSP
        request.setAttribute("appointments", appointments);
        request.getRequestDispatcher("/WEB-INF/views/admin/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String completeParam = request.getParameter("complete");
        String deleteParam = request.getParameter("delete");

        try (Connection conn = DBConnection.getConnection()) {

            if (completeParam != null) {
                int id = Integer.parseInt(completeParam);
                String sql = "UPDATE appointments SET completed = 1 WHERE id = ?";
                try (PreparedStatement ps = conn.prepareStatement(sql)) {
                    ps.setInt(1, id);
                    ps.executeUpdate();
                }
            }

            if (deleteParam != null) {
                int id = Integer.parseInt(deleteParam);
                String sql = "DELETE FROM appointments WHERE id = ?";
                try (PreparedStatement ps = conn.prepareStatement(sql)) {
                    ps.setInt(1, id);
                    ps.executeUpdate();
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Redirect to GET (POST/Redirect/GET pattern)
        response.sendRedirect(request.getContextPath() + "/admin/home");
    }
}
