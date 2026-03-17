package com.healthcare.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(
                DBConfig.get("db.url"),
                DBConfig.get("db.username"),
                DBConfig.get("db.password")
        );
    }
}
