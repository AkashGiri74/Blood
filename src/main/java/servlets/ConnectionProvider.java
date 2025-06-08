package servlets;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ConnectionProvider {

    // Logger to log errors
    private static final Logger logger = Logger.getLogger(ConnectionProvider.class.getName());

    public static Connection getConnection() throws SQLException {
        Connection connection = null;

        try {
            // Load PostgreSQL JDBC Driver
            Class.forName("org.postgresql.Driver");

            // Get connection to the database
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/blood", "postgres", "747288");
        } catch (SQLException e) {
            // Log the exact error message and stack trace
            logger.log(Level.SEVERE, "Database error occurred while connecting", e);
            throw new SQLException("Database connection error: " + e.getMessage(), e);
        } catch (ClassNotFoundException e) {
            // Log the ClassNotFoundException if the driver is not found
            logger.log(Level.SEVERE, "PostgreSQL JDBC Driver not found", e);
            throw new SQLException("JDBC Driver not found: " + e.getMessage(), e);
        }

        return connection;
    }
}
/*
 * 
 * 
 * package servlets;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ConnectionProvider {

    // Logger to log errors
    private static final Logger logger = Logger.getLogger(ConnectionProvider.class.getName());

    public static Connection getConnection() throws SQLException {
        Connection connection = null;

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Get connection to the database
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/blood", "root", "747288");
        } catch (SQLException e) {
            // Log the exact error message and stack trace
            logger.log(Level.SEVERE, "Database error occurred while connecting", e);
            throw new SQLException("Database connection error: " + e.getMessage(), e);
        } catch (ClassNotFoundException e) {
            // Log the ClassNotFoundException if the driver is not found
            logger.log(Level.SEVERE, "MySQL JDBC Driver not found", e);
            throw new SQLException("JDBC Driver not found: " + e.getMessage(), e);
        }
        
        return connection;
    }
}*/
