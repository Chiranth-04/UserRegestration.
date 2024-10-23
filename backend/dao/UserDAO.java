package dao;

import model.User;
import java.sql.*;

public class UserDAO {

    // Register a new user
    public static boolean registerUser(User user) throws Exception {
        Connection conn = DatabaseConnection.initializeDatabase();
        String query = "INSERT INTO users (userId, name, email, password, dob) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setString(1, user.getUserId()); // Use user-provided user_id
        stmt.setString(2, user.getName());
        stmt.setString(3, user.getEmail());
        stmt.setString(4, user.getPassword());
        stmt.setDate(5, Date.valueOf(user.getDob())); // Ensure dob is in correct format
        int result = stmt.executeUpdate();
        stmt.close();
        conn.close();
        
        return result > 0;
    }

    // Validate user login
    public static User validateUser(String email, String password) throws Exception {
        Connection conn = DatabaseConnection.initializeDatabase();
        String query = "SELECT * FROM users WHERE email = ? AND password = ?";
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setString(1, email);
        stmt.setString(2, password);
        ResultSet rs = stmt.executeQuery();
        
        if (rs.next()) {
            return new User(
                rs.getString("userId"), 
                rs.getString("name"), 
                rs.getString("email"), 
                rs.getString("password"), 
                rs.getString("dob")
            );
        }
        conn.close();
        return null;
    }

    // Update user profile
    public void updateUserProfile(String userId, String name, String email, String dob) throws SQLException, ClassNotFoundException {
        String query = "UPDATE users SET name = ?, email = ?, dob = ? WHERE userId = ?";

        try (Connection conn = DatabaseConnection.initializeDatabase();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            // Set parameters for the SQL query
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, dob);
            stmt.setString(4, userId); // Correctly match the database column 'userId'

            // Execute the update and log the result
            int rowsUpdated = stmt.executeUpdate();
            System.out.println("Rows updated: " + rowsUpdated); // Log the number of rows updated

            // Ensure the update affects at least one row
            if (rowsUpdated == 0) {
                throw new SQLException("No rows updated. The userId might not exist.");
            }
        }
    }
    // Delete user
    public void deleteUser(String userId) throws SQLException, Exception {
        // SQL statement to delete the user
        String sql = "DELETE FROM users WHERE userId = ?";

        // Use try-with-resources to manage the connection and prepared statement
        try (Connection connection = DatabaseConnection.initializeDatabase();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            // Set the user ID parameter
            preparedStatement.setString(1, userId);

            // Execute the update
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            // Handle any SQL exceptions
            e.printStackTrace();
            throw e; // Rethrow the exception if needed
        }
    }

    // Get user by ID
    public User getUserById(String userId) throws Exception {
        User user = null;
        String query = "SELECT * FROM users WHERE userId = ?";
        Connection conn = DatabaseConnection.initializeDatabase();
        try (PreparedStatement statement = conn.prepareStatement(query)) {
            statement.setString(1, userId);
            ResultSet resultSet = statement.executeQuery();
            
            if (resultSet.next()) {
                user = new User(
                    resultSet.getString("userId"), 
                    resultSet.getString("name"), 
                    resultSet.getString("email"), 
                    resultSet.getString("password"), 
                    resultSet.getString("dob")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    // Check if user ID exists
    public static boolean isUserIdExists(String userId) throws Exception {
        Connection conn = DatabaseConnection.initializeDatabase();
        String query = "SELECT userId FROM users WHERE userId = ?";
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setString(1, userId);
        ResultSet rs = stmt.executeQuery();
        
        boolean exists = rs.next(); // Return true if userId already exists
        conn.close();
        return exists;
    }
    public void updateUserId(String currentUser , String newUserId) throws SQLException, ClassNotFoundException {
        String query = "UPDATE users SET userId = ? WHERE userId = ?";
        try (Connection conn = DatabaseConnection.initializeDatabase();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            // Set parameters for the SQL query
            stmt.setString(1, newUserId);
            stmt.setString(2, currentUser );

            // Execute the update
            int rowsUpdated = stmt.executeUpdate();
            System.out.println("Rows updated for userId change: " + rowsUpdated);

            // Ensure the update affects at least one row
            if (rowsUpdated == 0) {
                throw new SQLException("No rows updated. The current userId might not exist.");
            }
        }
    }
    
}
