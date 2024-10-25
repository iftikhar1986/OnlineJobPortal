package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
}
