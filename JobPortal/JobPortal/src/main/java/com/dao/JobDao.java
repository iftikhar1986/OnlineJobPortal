package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.entity.Job;

public class JobDao {
	
	private Connection conn;

	public JobDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	
	
	
    // CREATE a new job

	public boolean addJob(Job job) {
		
		boolean isAdded = false;
		
		try {	
			
            String query = "INSERT INTO job(title, description, category, status, location) VALUES (?, ?, ?, ?, ?)";

			PreparedStatement ps = conn.prepareStatement(query);
			    ps.setString(1, job.getTitle());
	            ps.setString(2, job.getDescription());
	            ps.setString(3, job.getCategory());
	            ps.setString(4, job.getStatus());
	            ps.setString(5, job.getLocation());
	            
	            ps.executeUpdate();
	            isAdded = true;
		
	}catch (Exception e) {
		
		e.printStackTrace();
		
	}
	    
        return isAdded;


    }
}
