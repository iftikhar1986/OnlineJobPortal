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
    
    
	// Get all jobs for user
    public List<Job> getAllJobsForUser() {
        List<Job> jobList = new ArrayList<Job>();
        
        Job job = null;
        
        try {
        	
            String query = "SELECT * FROM job WHERE status=? order by id desc";

            PreparedStatement ps = this.conn.prepareStatement(query);
            
            ps.setString(1, "Active");
            
            
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
    

    // Update a job post
   
    public Job getJobById(int id) {        
        Job job = null;
        
        try {
        	
            String query = "SELECT * FROM job where id=?";

            PreparedStatement ps = this.conn.prepareStatement(query);
            ps.setInt(1,id );
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
            	job = new Job();
            	int ids = rs.getInt(1);
            	String title = rs.getString(2);
            	String description = rs.getString(3);
            	String category = rs.getString(4);
            	String status = rs.getString(5);
            	String location = rs.getString(6); // Correct index for location
            	Timestamp pdate = rs.getTimestamp(7); // Assuming pdate is stored as a timestamp

            	job.setId(ids);
            	job.setTitle(title);
            	job.setDescription(description);
            	job.setCategory(category);
            	job.setStatus(status);
            	job.setLocation(location);
            	job.setPdate(pdate);
            	
                
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return job;
    }
    
    
    
    public boolean updateJob(Job job) {
    	
    	 
     boolean isAdded = false;
		
		try {	
			
            String query = "UPDATE job set title=?, description=?, category=?, status=?, location=? where id=?";

			PreparedStatement ps = conn.prepareStatement(query);
			    ps.setString(1, job.getTitle());
	            ps.setString(2, job.getDescription());
	            ps.setString(3, job.getCategory());
	            ps.setString(4, job.getStatus());
	            ps.setString(5, job.getLocation());
	            ps.setInt(6, job.getId() );
	            
	           int i =  ps.executeUpdate();
	            
	            
	            if(i == 1) {
	            isAdded = true;
	            }
		
	}catch (Exception e) {
		
		e.printStackTrace();
		
	}
	    
        return isAdded;


    }
    

    // Delete a job post
    public boolean deleteJob(int id) {
        boolean isDeleted = false;
        try {
            String query = "DELETE FROM job WHERE id=?";

            PreparedStatement ps = this.conn.prepareStatement(query);
            ps.setInt(1, id);
            isDeleted = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isDeleted;
    }
    
    

    public List<Job> getJobsByLocationOrCategory(String category, String location) {
        List<Job> list = new ArrayList<Job>();
        Job j = null;

        try {
            String sql = "SELECT * FROM job WHERE category=? OR location=? ORDER BY id DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, category);
            ps.setString(2, location);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                j = new Job();
                j.setId(rs.getInt("id")); // Use column name for clarity
                j.setTitle(rs.getString("title"));
                j.setDescription(rs.getString("description"));
                j.setCategory(rs.getString("category"));
                j.setStatus(rs.getString("status"));

                j.setLocation(rs.getString("location"));
                j.setPdate(rs.getTimestamp("pdate")); // Use getTimestamp for compatibility
                list.add(j);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    
    
    public List<Job> getJobsByLocationAndCategory(String category, String location) {
        List<Job> list = new ArrayList<Job>();
        Job j = null;

        try {
            String sql = "SELECT * FROM job WHERE category=? AND location=? ORDER BY id DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, category);
            ps.setString(2, location);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                j = new Job();
                j.setId(rs.getInt("id")); // Use column name for clarity
                j.setTitle(rs.getString("title"));
                j.setDescription(rs.getString("description"));
                j.setCategory(rs.getString("category"));
                j.setStatus(rs.getString("status"));
                j.setLocation(rs.getString("location"));
              
                j.setPdate(rs.getTimestamp("pdate")); // Use getTimestamp for compatibility
                list.add(j);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
