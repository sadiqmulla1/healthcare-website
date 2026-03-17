package com.healthcare.config;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;

@WebListener
public class DatabaseInitializer implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement()) {

            System.out.println("Checking/Creating tables...");

            // 1. Create Admins Table
            stmt.execute("CREATE TABLE IF NOT EXISTS admins (" +
                    "id INT AUTO_INCREMENT PRIMARY KEY, " +
                    "username VARCHAR(50) NOT NULL UNIQUE, " +
                    "password VARCHAR(255) NOT NULL)");

            // 2. Create Doctors Table
            stmt.execute("CREATE TABLE IF NOT EXISTS doctors (" +
                    "id INT AUTO_INCREMENT PRIMARY KEY, " +
                    "name VARCHAR(100) NOT NULL, " +
                    "speciality VARCHAR(100), " +
                    "photo_path VARCHAR(255), " +
                    "experience INT, " +
                    "education VARCHAR(255))");

            // 3. Create Photos Table
            stmt.execute("CREATE TABLE IF NOT EXISTS photos (" +
                    "id INT AUTO_INCREMENT PRIMARY KEY, " +
                    "title VARCHAR(100), " +
                    "image_url VARCHAR(255))");

            // 4. Create Appointments Table
            stmt.execute("CREATE TABLE IF NOT EXISTS appointments (" +
                    "id INT AUTO_INCREMENT PRIMARY KEY, " +
                    "patient_name VARCHAR(100) NOT NULL, " +
                    "consultation_type VARCHAR(50), " +
                    "mobile VARCHAR(15), " +
                    "patient_type VARCHAR(20), " +
                    "created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, " +
                    "completed BOOLEAN DEFAULT FALSE)");

            System.out.println("Database structure is ready.");
            seedData(stmt);

        } catch (Exception e) {
            System.err.println("Database Initialization Failed: " + e.getMessage());
        }
    }

    private void seedData(Statement stmt) throws Exception {
        // SEED ADMIN DATA
        try (ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM admins")) {
            if (rs.next() && rs.getInt(1) == 0) {
                System.out.println("Seeding initial admin account...");
                stmt.execute("INSERT INTO admins (username, password) VALUES ('admin', 'admin123')");
            }
        }

        // SEED DOCTOR DATA
        try (ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM doctors")) {
            if (rs.next() && rs.getInt(1) == 0) {
                System.out.println("Seeding initial doctor data...");
                stmt.execute("INSERT INTO doctors (name, speciality, photo_path, experience, education) VALUES " +
                        "('Dr. John Doe', 'Cardiologist', 'doc1.jpg', 12, 'MBBS, MD'), " +
                        "('Dr. Jane Smith', 'Diabetologist', 'doc2.jpg', 8, 'MBBS, MD (Endocrinology)')");
            }
        }

        // SEED GALLERY DATA
        try (ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM photos")) {
            if (rs.next() && rs.getInt(1) == 0) {
                System.out.println("Seeding gallery data...");
                stmt.execute("INSERT INTO photos (title, image_url) VALUES " +
                        "('Modern Lab', 'lab.jpg'), " +
                        "('Emergency Ward', 'ward.jpg')");
            }
        }
    }
}