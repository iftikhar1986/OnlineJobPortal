package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.JobDao;
import com.db.DBConnect;
import com.entity.Job;


public class AddPostServlet extends HttpServlet {
       
  

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		try {
			
	        // Retrieve form data from the request
			
	        String title = request.getParameter("title");
	        String description = request.getParameter("description");
	        String category = request.getParameter("category");
	        String status = request.getParameter("status");
	        String location = request.getParameter("location");
	        
	        

	     // Create a Job object
	        Job job = new Job();
	        
	        
	    

	        
	     // Set job details using setter methods
	        job.setTitle(title);
	        job.setDescription(description);
	        job.setCategory(category);
	        job.setStatus(status);
	        job.setLocation(location);
	        
	        
	     

	        // Getting the session object
	        HttpSession session = request.getSession();
	        
	       

	        
	        
	     // Establish database connection
	        JobDao jobDao = new JobDao(DBConnect.getConnection());
	        
	        
	  

	        
	        
	     // Call the DAO method to add the job
	        boolean isJobAdded = jobDao.addJob(job);
	        
	        
	   

	        
	     // Redirect based on whether the job was added successfully or not
	        if (isJobAdded) {
	        	
	        	
		       

	        	 // Success message in session
                session.setAttribute("message", "Job post added successfully!");
                
                
    	        

                
	            // Redirect to add_job.jsp page 

                response.sendRedirect("add_job.jsp"); // Redirect to a page
                
    	    


                
	        } else {
	        	
	        	
		       

	        	// Error message in session
                session.setAttribute("errorMessage", "Failed to add job post.");
                
		       

                response.sendRedirect("add_job.jsp");
                
		      

                
                
	        }
			
		}catch(Exception e) {
			
	        

            e.printStackTrace();

		}
		
	}

}
