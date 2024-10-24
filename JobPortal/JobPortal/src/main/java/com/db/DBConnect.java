package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {
	
    private static Connection conn;
    
    // Method to establish and return a connection to the database
    	    public static Connection getConnection() {
    	        if (conn == null) {
    	        	
    	        	
    	            try {
    	                // Load MySQL JDBC Driver
    	                Class.forName("com.mysql.cj.jdbc.Driver");
    	                
    	                
    	                // Establish connection
    	                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","123@root");
    	                System.out.println("Connection to database successful!");
    	                
    	                
    	            } catch (ClassNotFoundException e) {
    	                System.out.println("JDBC Driver not found!");
    	                e.printStackTrace();
    	            } catch (SQLException e) {
    	                System.out.println("Error connecting to the database!");
    	                e.printStackTrace();
    	            }
    	        }
    	        return conn;
    	    }
    
    


}
