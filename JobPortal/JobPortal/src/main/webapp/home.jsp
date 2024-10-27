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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User</title>
    <%@include file="all_components/all_css.jsp" %>
    <style>
        .section-card {
            margin-bottom: 1.5rem;
        }
        .header-card, .table-card {
            border-radius: 1rem;
        }
        .card-body {
            padding: 1rem; 
        }
    </style>
</head>
<body>

<c:if test="${ empty userobj }">

<c:redirect url="login.jsp">


</c:redirect>

</c:if>
<%@include file="all_components/navbar.jsp" %>

<!-- Container for all sections with consistent spacing -->
<div class="container mt-4 mb-5">
  
  <!-- Welcome Section -->
  <div class="row section-card">
    <div class="col-md-12">
      <div class="card header-card shadow-lg text-center p-3" style="background-color: #4B0E0E;">
        <h2 class="text-white"><i class="fas fa-user"></i> Welcome, ${userobj.name}!</h2>
        <p class="text-white">Explore job opportunities, manage your profile, and track applications. Your dashboard helps you find the best jobs!</p>
      </div>
    </div>
  </div>

  <!-- Dashboard Overview Section -->
  <div class="row section-card">
    <div class="col-md-3">
      <div class="card header-card text-center text-light" style="background-color: #A75B5B;">
        <div class="card-body">
          <h5><i class="fas fa-briefcase"></i> Total Jobs Available</h5>
          <p>150</p>
        </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="card header-card text-center text-light" style="background-color: #4B0E0E;">
        <div class="card-body">
          <h5><i class="fas fa-check-circle"></i> Jobs Applied</h5>
          <p>30</p>
        </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="card header-card text-center text-light" style="background-color: #A75B5B;">
        <div class="card-body">
          <h5><i class="fas fa-calendar-alt"></i> Upcoming Interviews</h5>
          <p>5</p>
        </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="card header-card text-center text-light" style="background-color: #4B0E0E;">
        <div class="card-body">
          <h5><i class="fas fa-user-check"></i> Profile Status</h5>
          <p>Active</p>
        </div>
      </div>
    </div>
  </div>

  <!-- Job Search Section -->
  <div class="row section-card">
    <div class="col-md-12">
      <div class="card table-card shadow-lg p-3" style="background: linear-gradient(135deg, #A75B5B, #4B0E0E);">
        <h4 class="text-center text-white mb-3">🔍 Find Your Next Opportunity</h4>
        <form action="more_view.jsp" method="GET" class="d-flex justify-content-center">
          <div class="form-group mx-2" style="width: 250px;">
            <select name="location" class="form-control">
             
              <option selected disabled>Select Location</option>
            <option value="Qatar">Qatar</option>
            <option value="UAE">UAE</option>
            <option value="Saudia Arab">Saudia Arab</option>
            <option value="Oman">Oman</option>
              
            </select>
          </div>
          <div class="form-group mx-2" style="width: 250px;">
            <select name="category" class="form-control">
             <option selected disabled>Select Category</option>
            <option value="IT & Software">IT & Software</option>
            <option value="Marketing">Marketing</option>
            <option value="Finance">Finance</option>
            <option value="Engineering">Engineering</option>
            <!-- Add more categories as needed -->
            </select>
          </div>
          <button type="submit" class="btn btn-light text-dark mx-2"><i class="fas fa-search"></i> Search</button>
        </form>
      </div>
    </div>
  </div>
  

  <!-- Job Listings Section -->
  <div class="row section-card">
    <div class="col-md-12">
      <div class="card table-card shadow-lg">
        <div class="card-header text-white" style="background-color: #A75B5B;">
          <i class="fas fa-briefcase"></i> Job Listings
        </div>
        <div class="card-body">
          <table class="table table-striped">
            <thead>
              <tr>
                <th>Job Title</th>
                <th>Location</th>
                <th>Posting Date</th>
                <th>Status</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody>
            
            
  <%
  JobDao dao = new JobDao(DBConnect.getConnection());
  List<Job> jobList = dao.getAllJobsForUser(); // Fetch job list from DB

  
  if (jobList != null && !jobList.isEmpty()) {
      for (Job job : jobList) {
  
  %>
  
   <tr>
                <th><%= job.getTitle() %></th>
                                        <td><%= job.getLocation() %></td>
                
                        <td><fmt:formatDate value="<%= job.getPdate() %>" pattern="MMMM dd, yyyy" /></td>
<td>
                            <span class="badge <%= job.getStatus().equals("Active") ? "bg-success" : "bg-danger" %>">
                                <%= job.getStatus() %>
                            </span>
                        </td>  <td>
                            <!-- Edit button with pencil icon -->
                            <a href="edit_job.jsp?id=<%= job.getId() %>" class="btn btn-warning btn-sm" data-toggle="tooltip" title="Edit Job">
                                <i class="fas fa-edit"></i>
                            </a>
                            
                            <!-- Delete button with trash icon -->
                           <a href="DeleteJobServlet?jobId=<%= job.getId() %>" 
   class="btn btn-danger btn-sm" 
   data-toggle="tooltip" title="Delete Job" 
   onclick="return confirm('Are you sure you want to delete this job?');">
    <i class="fas fa-trash-alt"></i>
</a>
                           
                        </td>
                        
                                        
                                        
                                        <%}} %>
              </tr>
              <!-- Populate from servlet -->
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>

 <!-- User Profile Section -->
<div class="row section-card">
    <div class="col-md-12">
        <div class="card table-card shadow-lg">
            <div class="card-header text-white" style="background-color: #4B0E0E;">
                <i class="fas fa-user-circle"></i> User Profile
            </div>
            <div class="card-body">
                <h5 class="mb-4">Profile Details</h5>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <p><strong>Name:</strong> John Doe</p>
                    </div>
                    <div class="col-md-6 mb-3">
                        <p><strong>Email:</strong> johndoe@example.com</p>
                    </div>
                    <div class="col-md-6 mb-3">
                        <p><strong>Qualification:</strong> B.Sc in Computer Science</p>
                    </div>
                    <div class="col-md-6 mb-3">
                        <p><strong>Account Status:</strong> Active</p>
                    </div>
                </div>
                <div class="text-center">
                    <a href="edit_profile.jsp" class="btn btn-primary"><i class="fas fa-edit"></i> Edit Profile</a>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- User Profile Section -->
<div class="row section-card justify-content-center">
    <div class="col-md-8">
        <div class="card table-card shadow-lg">
            <div class="card-header text-white" style="background-color: #4B0E0E;">
                <i class="fas fa-user-circle"></i> User Profile
            </div>
            <div class="card-body">
                <h5 class="mb-4 text-center">Profile Details</h5>
                <form action="updateProfileServlet" method="POST">
                    <div class="form-group">
                        <label for="profileName"><strong>Name:</strong></label>
                        <input type="text" class="form-control" id="profileName" name="name" value="John Doe" required>
                    </div>
                    <div class="form-group">
                        <label for="profileEmail"><strong>Email:</strong></label>
                        <input type="email" class="form-control" id="profileEmail" name="email" value="johndoe@example.com" required>
                    </div>
                    <div class="form-group">
                        <label for="profileQualification"><strong>Qualification:</strong></label>
                        <input type="text" class="form-control" id="profileQualification" name="qualification" value="B.Sc in Computer Science" required>
                    </div>
                    <div class="form-group">
                        <label for="profileStatus"><strong>Account Status:</strong></label>
                        <select class="form-control" id="profileStatus" name="status">
                            <option value="Active" selected>Active</option>
                            <option value="Inactive">Inactive</option>
                        </select>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-success">Save Changes</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

 

</div>

<%@include file="all_components/footer.jsp" %>
</body>
</html>
