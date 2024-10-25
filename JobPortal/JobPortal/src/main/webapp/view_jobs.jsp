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
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
</head>
<body>

<c:if test="${userobj.role ne 'admin' }">

<c:redirect url="login.jsp">


</c:redirect>

</c:if>
    <%@include file="all_components/navbar.jsp" %>

    <!-- View Jobs Section -->
    <div class="container my-5">
        <h2 class="text-center mb-4" style="color: #4B0E0E;"><i class="fas fa-briefcase"></i> Available Jobs</h2>
        
        
            <c:if test="${not empty sessionScope.message}">
    <div class="alert alert-success alert-dismissible fade show d-flex align-items-center" role="alert" 
         style="position: fixed; top: 20px; right: 20px; width: 300px; z-index: 1000; 
                box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.2); 
                border-left: 5px solid #28a745; background-color: #d4edda;">
        <i class="fas fa-check-circle" style="font-size: 24px; margin-right: 10px; color: #28a745;"></i>
        <span style="flex-grow: 1; font-size: 16px; font-weight: 500;">
            <c:out value="${sessionScope.message}"/>
        </span>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" 
                style="background: transparent; border: none; font-size: 24px;">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    <c:remove var="message" scope="session"/> <!-- Remove message after displaying -->
</c:if>

<!-- Fancy Error Alert using JSTL -->
<c:if test="${not empty sessionScope.errorMessage}">
    <div class="alert alert-danger alert-dismissible fade show shadow-lg p-3 mb-3 rounded" role="alert" 
         style="position: fixed; top: 80px; right: 20px; width: 300px; z-index: 1000; 
                box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.2); 
                border-left: 5px solid #dc3545; background-color: #f8d7da;">
        <div class="d-flex align-items-center">
            <i class="fas fa-exclamation-triangle fa-lg mr-2" style="color: #dc3545; font-size: 24px;"></i> 
            <span style="font-size: 16px; font-weight: 500;">
                <c:out value="${sessionScope.errorMessage}"/>
            </span>
        </div>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" 
                style="float: right;">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    <c:remove var="errorMessage" scope="session"/> <!-- Remove error message after displaying -->
</c:if>
            

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
                        <th scope="col"><i class="fas fa-calendar-alt"></i> Publish Date</th>
                        <th scope="col">Actions</th> <!-- Actions column with icons -->
                    </tr>
                </thead>
                <tbody>
                    <% 
                      JobDao dao = new JobDao(DBConnect.getConnection());
                      List<Job> jobList = dao.getAllJobs(); // Fetch job list from DB
                      
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
                        <td><fmt:formatDate value="<%= job.getPdate() %>" pattern="MMMM dd, yyyy" /></td>
                        <td>
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
                    </tr>
                    <% 
                          } 
                      } else {
                    %>
                    <tr>
                        <td colspan="7" class="text-center">No jobs available at the moment</td>
                    </tr>
                    <% 
                      }
                    %>
                </tbody>
            </table>
        </div>
    </div>

</body>

<%@include file="all_components/footer.jsp" %>

<script>
  $(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip(); 
  });
</script>


</html>
