package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

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
	
	
	// Get all jobs
    public List<Job> getAllJobs() {
        List<Job> jobList = new ArrayList<Job>();
        
        Job job = null;
        
        try {
        	
            String query = "SELECT * FROM job order by id desc";

            PreparedStatement ps = this.conn.prepareStatement(query);
            
            
            ResultSet rs = ps.executeQuery();
            
            
            while (rs.next()) {
            	job = new Job();
            	
            	
            	int id = rs.getInt(1);
            	String title = rs.getString(2);
            	String description = rs.getString(3);
            	String category = rs.getString(4);
            	String status = rs.getString(5);
            	String location = rs.getString(6); // Correct index for location
            	Timestamp pdate = rs.getTimestamp(7); // Assuming pdate is stored as a timestamp

            	job.setId(id);
            	job.setTitle(title);
            	job.setDescription(description);
            	job.setCategory(category);
            	job.setStatus(status);
            	job.setLocation(location);
            	job.setPdate(pdate);
            	
                jobList.add(job);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return jobList;
    }
}
