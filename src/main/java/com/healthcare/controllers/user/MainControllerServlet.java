package com.healthcare.controllers.user;

import com.healthcare.config.DBConnection;
import com.healthcare.models.Doctor;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = {"", "/home", "/index"})
public class MainControllerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //Setting success_message for appointment booking after redirect from AppointmentServlet
        HttpSession session = request.getSession(false);

        if (session != null) {
            String successMessage = (String) session.getAttribute("success_message");

            if (successMessage != null) {
                request.setAttribute("success_message", successMessage);
                session.removeAttribute("success_message");
            }
        }

        //Fetching doctors from the database to display in the #doctors section
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
        request.getRequestDispatcher("/WEB-INF/views/public/index.jsp")
                .forward(request, response);


    }
}

