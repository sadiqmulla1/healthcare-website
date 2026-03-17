package com.healthcare.controllers.admin;

import com.healthcare.config.DBConnection;
import com.healthcare.models.Photo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/admin/managePhotos")
public class ManagePhotosServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Photo> photos = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Load MySQL driver
            try (Connection conn = DBConnection.getConnection();
                 Statement stmt = conn.createStatement();
                 ResultSet rs = stmt.executeQuery("SELECT * FROM photos ORDER BY id DESC")) {

                while (rs.next()) {
                    Photo photo = new Photo();
                    photo.setId(rs.getInt("id"));
                    photo.setTitle(rs.getString("title"));
                    photo.setImageUrl(rs.getString("image_url"));
                    photos.add(photo);
                }
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        // Set photos list as request attribute
        request.setAttribute("photos", photos);

        // Forward to JSP
        request.getRequestDispatcher("/WEB-INF/views/admin/managePhotos.jsp")
                .forward(request, response);
    }

    // Allow POST to redirect to GET
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
