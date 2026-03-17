package com.healthcare.controllers.user;

import com.healthcare.config.DBConnection;
import com.healthcare.models.Photo;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/public/gallery")
public class ViewGalleryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<Photo> photos = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement("SELECT * FROM photos ORDER BY id DESC");
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Photo photo = new Photo();
                photo.setId(rs.getInt("id"));
                photo.setImageUrl(rs.getString("image_url"));
                photo.setTitle(rs.getString("title"));
                photos.add(photo);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            // Optional: send error to UI
        }

        // 2. Attach the list to the request object
        req.setAttribute("photos", photos);

        // 3. Forward to the JSP (which is inside WEB-INF)
        req.getRequestDispatcher("/WEB-INF/views/public/gallery.jsp").forward(req, resp);

    }
}
