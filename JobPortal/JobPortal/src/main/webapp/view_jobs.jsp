

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.List" %>
<%@ page import="com.dao.JobDao" %>
<%@ page import="com.entity.Job" %>
<%@ page import="com.db.DBConnect" %>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Jobs</title>
<%@include file="all_components/all_css.jsp" %>

</head>
<body>
<%@include file="all_components/navbar.jsp" %>


<!-- View Jobs Section -->
<div class="container my-5">
  <h2 class="text-center mb-4" style="color: #4B0E0E;"><i class="fas fa-briefcase"></i> Available Jobs</h2>
  
  <!-- Jobs Table -->
  <div class="table-responsive">
    <table class="table table-hover align-middle table-bordered">
      <thead style="background-color: #4B0E0E; color: white;">
        <tr>
          <th scope="col"><i class="fas fa-briefcase"></i> Job Title</th>
          <th scope="col"><i class="fas fa-map-marker-alt"></i> Location</th>
          <th scope="col"><i class="fas fa-list"></i> Category</th>
          <th scope="col"><i class="fas fa-clipboard-check"></i> Status</th>
          <th scope="col"><i class="fas fa-align-left"></i> Description</th>
          <th scope="col"><i class="fas fa-calendar-alt"></i> Publish Date</th> <!-- New column for Publish Date -->
        </tr>
      </thead>
      <tbody>
        <% 
          JobDao dao = new JobDao(DBConnect.getConnection());
          List<Job> jobList = dao.getAllJobs(); // Assuming getAllJobs() fetches a list of jobs from the database
          
          if (jobList != null && !jobList.isEmpty()) {
            for (Job job : jobList) { 
        %>
        <tr>
          <td><%= job.getTitle() %></td>
          <td><%= job.getLocation() %></td>
          <td><%= job.getCategory() %></td>
          <td>
            <span class="badge <%= job.getStatus().equals("Active") ? "bg-success" : "bg-danger" %>">
              <%= job.getStatus() %>
            </span>
          </td>
          <td><%= job.getDescription() %></td>
          <td><fmt:formatDate value="<%= job.getPdate() %>" pattern="MMMM dd, yyyy" /></td> <!-- Format the publish date -->
        </tr>
        <% 
            } 
          } else {
        %>
        <tr>
          <td colspan="6" class="text-center">No jobs available at the moment</td>
        </tr>
        <% 
          }
        %>
      </tbody>
    </table>
  </div>
</div>

  
  
 
</div>

</body>

<%@include file="all_components/footer.jsp" %>

</html>
