package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dao.JobDao;
import com.db.DBConnect;

public class DeleteJobServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Retrieve jobId from request
        String jobIdParam = request.getParameter("jobId");

        // Check if jobId is null or empty
        if (jobIdParam == null || jobIdParam.isEmpty()) {
            request.getSession().setAttribute("errorMessage", "Job ID is missing.");
            response.sendRedirect("view_jobs.jsp");
            return;
        }

        try {
            // Parse jobId to integer
            int jobId = Integer.parseInt(jobIdParam);

            // Use JobDao to delete the job
            JobDao dao = new JobDao(DBConnect.getConnection());
            boolean isDeleted = dao.deleteJob(jobId); // Make sure you have a deleteJob method

            if (isDeleted) {
                request.getSession().setAttribute("message", "Job deleted successfully.");
            } else {
                request.getSession().setAttribute("errorMessage", "Job deletion failed.");
            }
        } catch (NumberFormatException e) {
            request.getSession().setAttribute("errorMessage", "Invalid Job ID format.");
        } catch (Exception e) {
            request.getSession().setAttribute("errorMessage", "An error occurred: " + e.getMessage());
        }

        // Redirect to the view jobs page
        response.sendRedirect("view_jobs.jsp");
    }
}
