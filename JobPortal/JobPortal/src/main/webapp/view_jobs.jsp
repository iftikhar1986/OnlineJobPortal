<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
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
        <!-- Job Row Example -->
        <tr>
          <td>Software Engineer</td>
          <td>New York</td>
          <td>IT & Software</td>
          <td><span class="badge bg-success">Active</span></td>
          <td>Looking for an experienced Software Engineer with Java & Spring Boot skills.</td>
          <td>October 10, 2023</td> <!-- Sample Publish Date -->
        </tr>
        
        <tr>
          <td>Marketing Specialist</td>
          <td>London</td>
          <td>Marketing</td>
          <td><span class="badge bg-danger">Closed</span></td>
          <td>Marketing expert needed for an international project.</td>
          <td>September 25, 2023</td> <!-- Sample Publish Date -->
        </tr>

        <!-- Add more job rows as needed -->
      </tbody>
    </table>
  </div>
</div>

</body>

<%@include file="all_components/footer.jsp" %>

</html>
