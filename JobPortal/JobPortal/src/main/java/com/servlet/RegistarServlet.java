package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

 import com.dao.UserDao;
import com.db.DBConnect;
import com.entity.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RegistarServlet extends HttpServlet {


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		try {
			
			// Get form data
	        String name = request.getParameter("name");
	        String qualification = request.getParameter("qualification");
	        String email = request.getParameter("email");
	        String password = request.getParameter("password");
		
	        
		     // Establish database connection
		        UserDao dao = new UserDao(DBConnect.getConnection());
		        
		        
		        User user = new User(name,email,password,qualification,"User");
		        
		        boolean isUserAdded = dao.addUser(user);
		        
		        HttpSession session = request.getSession();

		        
			     // Redirect based on whether the job was added successfully or not
			        if (isUserAdded) {
			     
			        	 // Success message in session
		                session.setAttribute("message", "Registration successfully!");
		                
		           
			            // Redirect to add_job.jsp page 

		                response.sendRedirect("signup.jsp"); // Redirect to a page
		             
		                
			        } else {
			        

			        	// Error message in session
		                session.setAttribute("errorMessage", "Failed to User Registration.");
		                
				       

		                response.sendRedirect("signup.jsp");
	
		                
			        }
		        
		        
		        
		        
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
