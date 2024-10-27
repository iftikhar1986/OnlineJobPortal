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
    <title>Job Listings</title>
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
        .job-table {
            width: 100%;
            border-collapse: collapse;
        }
        .job-table th, .job-table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        .job-table th {
            background-color: #A75B5B;
            color: white;
        }
        .job-table tr:hover {
            background-color: #f1f1f1;
        }
        .job-status {
            border-radius: 12px;
            padding: 5px 10px;
            color: white;
        }
        .no-jobs-message {
            text-align: center;
            color: #A75B5B;
            font-weight: bold;
            font-size: 1.2em;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<c:if test="${ empty userobj }">

<c:redirect url="login.jsp">


</c:redirect>

</c:if>


<%@include file="all_components/navbar.jsp" %>

<!-- Container for job listings and filters -->
<div class="container mt-4 mb-5">
  
  <!-- Job Filter Section -->
  <div class="row section-card">
    <div class="col-md-12">
      <div class="card table-card shadow-lg p-3" style="background: linear-gradient(135deg, #A75B5B, #4B0E0E);">
        <h4 class="text-center text-white mb-3">🔍 Search for Jobs</h4>
        <form action="more_view.jsp" method="GET" class="d-flex justify-content-center">
          <div class="form-group mx-2" style="width: 200px;">
            <select name="location" class="form-control">
              <option selected disabled>Select Location</option>
              <option value="Qatar">Qatar</option>
              <option value="UAE">UAE</option>
              <option value="Saudi Arabia">Saudi Arabia</option>
              <option value="Oman">Oman</option>
            </select>
          </div>
          <div class="form-group mx-2" style="width: 200px;">
            <select name="category" class="form-control">
              <option selected disabled>Select Category</option>
              <option value="IT & Software">IT & Software</option>
              <option value="Marketing">Marketing</option>
              <option value="Finance">Finance</option>
              <option value="Engineering">Engineering</option>
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
          <%
              String loc = request.getParameter("location");
              String cat = request.getParameter("category");
              String msg = "";
              JobDao dao = new JobDao(DBConnect.getConnection());
              List<Job> jobList = null;

              if ("lo".equals(loc) && "ca".equals(cat)) {
                  msg = "Job Not Available";
              } else if ("lo".equals(loc) || "ca".equals(cat)) {
                  jobList = dao.getJobsByLocationOrCategory(cat, loc);
              } else {
                  jobList = dao.getJobsByLocationAndCategory(cat, loc);
              }

              if (jobList == null || jobList.isEmpty()) {
          %>
          <h4 class="no-jobs-message">Currently, there are no job listings available matching your criteria. Please check back later or try a different search.</h4>
          <%
              } else {
          %>
          <table class="job-table">
            <thead>
              <tr>
                <th>Job Title</th>
                <th>Location</th>
                <th>Posted Date</th>
                <th>Status</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody>
              <%
                  for (Job job : jobList) {
              %>
              <tr> 
                <td><%= job.getTitle() %></td>
                <td><%= job.getLocation() %></td>
                <td><fmt:formatDate value="<%= job.getPdate() %>" pattern="MMMM dd, yyyy" /></td>
                <td>
                  <span class="job-status <%= job.getStatus().equals("Active") ? "bg-success" : "bg-danger" %>">
                    <%= job.getStatus() %>
                  </span>
                </td>
                <td>
                  <a href="edit_job.jsp?id=<%= job.getId() %>" class="btn btn-warning btn-sm" title="Edit Job">
                    <i class="fas fa-edit"></i>
                  </a>
                  <a href="DeleteJobServlet?jobId=<%= job.getId() %>" 
                     class="btn btn-danger btn-sm" 
                     title="Delete Job" 
                     onclick="return confirm('Are you sure you want to delete this job?');">
                    <i class="fas fa-trash-alt"></i>
                  </a>
                </td>
              </tr>
              <%
                  }
              %>
            </tbody>
          </table>
          <%
              }
          %>
        </div>
      </div>
    </div>
  </div>
</div>
<%@include file="all_components/footer.jsp" %>
</body>
</html>
