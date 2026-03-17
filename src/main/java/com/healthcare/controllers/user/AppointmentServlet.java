package com.healthcare.controllers.user;

import com.healthcare.config.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;
import java.util.regex.Pattern;

@WebServlet("/appointments/book")
public class AppointmentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String patientName  = request.getParameter("patient_name");
        String consultation = request.getParameter("consultation_type");
        String mobile       = request.getParameter("mobile");
        String patientType  = request.getParameter("patient_type");

        // ---------- Validation ----------
        if (patientName == null || patientName.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Patient name is required.");
            return;
        }

        if (mobile == null || !Pattern.matches("^[6-9][0-9]{9}$", mobile.trim())) {
            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid mobile number. Provide a 10-digit number starting with 6–9."
            );
            return;
        }

        try (Connection conn = DBConnection.getConnection()) {

            // ---------- Check appointment in last 24 hours ----------
            String checkSql =
                    "SELECT COUNT(*) FROM appointments " +
                            "WHERE mobile = ? " +
                            "AND created_at >= (NOW() - INTERVAL 1 DAY)";

            try (PreparedStatement checkStmt = conn.prepareStatement(checkSql)) {
                checkStmt.setString(1, mobile.trim());

                ResultSet rs = checkStmt.executeQuery();
                rs.next();

                int count = rs.getInt(1);

                if (count > 0) {
                    HttpSession session = request.getSession();
                    session.setAttribute(
                            "success_message",
                            "You have already booked an appointment in the last 24 hours. " +
                                    "Please wait, our hospital team will contact you shortly."
                    );

                    response.sendRedirect(request.getContextPath() + "/home#appointment");
                    return;
                }
            }

            // ---------- Insert appointment ----------
            String insertSql =
                    "INSERT INTO appointments " +
                            "(patient_name, consultation_type, mobile, patient_type) " +
                            "VALUES (?, ?, ?, ?)";

            try (PreparedStatement stmt = conn.prepareStatement(insertSql)) {
                stmt.setString(1, patientName.trim());
                stmt.setString(2, consultation);
                stmt.setString(3, mobile.trim());
                stmt.setString(4, patientType);
                stmt.executeUpdate();
            }

        } catch (SQLException e) {
            throw new ServletException("Database error while saving appointment", e);
        }

        // ---------- Success message ----------
        HttpSession session = request.getSession();
        session.setAttribute(
                "success_message",
                "Your appointment request for a " + consultation +
                        " has been successfully submitted. " +
                        "Our hospital team will contact you shortly to confirm."
        );

        // ---------- Redirect ----------
        response.sendRedirect(request.getContextPath() + "/home#appointment");
    }
}
