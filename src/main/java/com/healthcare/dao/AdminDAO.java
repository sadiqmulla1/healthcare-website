package com.healthcare.dao;

import com.healthcare.config.DBConnection;
import com.healthcare.models.Admin;
import java.sql.*;

public class AdminDAO {

    public Admin authenticate(String username, String password) {
        String query = "SELECT * FROM admins WHERE username = ? AND password = ?";

        // Use try-with-resources to ensure the connection and statement close automatically
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, username);
            ps.setString(2, password);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Admin admin = new Admin();
                    admin.setId(rs.getInt("id"));
                    admin.setUsername(rs.getString("username"));
                    return admin;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // In a real app, use a Logger
        }
        return null;
    }
}