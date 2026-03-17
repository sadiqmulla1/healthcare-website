package com.healthcare.config;

import java.io.InputStream;
import java.util.Properties;

public class DBConfig {

    private static final Properties props = new Properties();

    static {
        try (InputStream is = DBConfig.class
                .getClassLoader()
                .getResourceAsStream("application.properties")) {

            if (is == null) {
                throw new RuntimeException("application.properties not found");
            }

            props.load(is);

            Class.forName(props.getProperty("db.driver"));

        } catch (Exception e) {
            throw new RuntimeException("Failed to load DB config", e);
        }
    }

    public static String get(String key) {
        return props.getProperty(key);
    }
}
