package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDao {

    private Connection conn;

    public UserDao(Connection conn) {
        this.conn = conn;
    }

    // CREATE a new User
    public boolean addUser(User user) {
        boolean isAdded = false;

        try {    
            String query = "INSERT INTO user (name, qualification, email, password,role) VALUES (?, ?, ?, ?,?)";

            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, user.getName());
            ps.setString(2, user.getQualification());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPassword());
            ps.setString(5, "user");

            int rowsAffected = ps.executeUpdate();
            isAdded = rowsAffected > 0;
        
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return isAdded;
    }
    
    
    public User login(String email, String password) {
    	
    	User user = null;
    	
    	try {
            String query = "SELECT * FROM user WHERE email = ? AND password = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt(1));
                user.setName(rs.getString(2));
                user.setQualification(rs.getString(3));
                user.setEmail(rs.getString(4));
                user.setPassword(rs.getString(5)); // Normally, you wouldn't store the password
                user.setRole(rs.getString(6)); // Assuming you have a role field
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user; // Returns the user object if found, else null
    }
}
