package com.healthcare.controllers.admin;

import com.healthcare.config.DBConnection;
import com.healthcare.models.Doctor;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/admin/manageDoctors")
public class ManageDoctorsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Doctor> doctors = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Ensure MySQL driver is loaded
            Connection conn = DBConnection.getConnection();

            String sql = "SELECT * FROM doctors ORDER BY id DESC";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Doctor doctor = new Doctor();
                doctor.setId(rs.getInt("id"));
                doctor.setName(rs.getString("name"));
                doctor.setSpeciality(rs.getString("speciality"));
                doctor.setPhotoPath(rs.getString("photo_path"));
                doctor.setExperience(rs.getInt("experience"));
                doctor.setEducation(rs.getString("education"));

                doctors.add(doctor);
            }

            rs.close();
            stmt.close();
            conn.close();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        // Set doctors list as request attribute
        request.setAttribute("doctors", doctors);

        // Forward to JSP
        request.getRequestDispatcher("/WEB-INF/views/admin/manageDoctors.jsp")
                .forward(request, response);
    }

    // If needed, allow POST to redirect to GET
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}

