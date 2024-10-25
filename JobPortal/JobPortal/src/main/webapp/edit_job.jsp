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

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Jobs</title>
    <%@include file="all_components/all_css.jsp" %>
</head>
<body>

<c:if test="${userobj.role ne 'admin' }">

<c:redirect url="login.jsp">


</c:redirect>

</c:if>
<%@include file="all_components/navbar.jsp" %>

<div class="container mt-5 mb-5" style="max-width: 800px; padding-bottom: 40px;">
    <div class="card shadow-lg">
        <div class="card-header text-white" style="background-color: #4B0E0E;">

            <% 
            String idParam = request.getParameter("id"); // Get the parameter without trailing space
            int id = -1; // Default value

            if (idParam != null) {
                try {
                    id = Integer.parseInt(idParam); // Parse the ID
                } catch (NumberFormatException e) {
                    // Handle the exception if ID is not a valid number
                    out.println("<script>alert('Invalid Job ID.'); window.history.back();</script>");
                }
            } else {
                out.println("<script>alert('Job ID is missing.'); window.history.back();</script>");
            }

            JobDao dao = new JobDao(DBConnect.getConnection());
            Job job = dao.getJobById(id);
            %>

            <h4 class="mb-0"><i class="fas fa-plus-circle"></i> Edit a Job</h4>
        </div>
        <div class="card-body">

            <!-- Post Job Form -->
            <form action="update_job" method="post"> <!-- Assuming your update action is here -->
            
            <input type="hidden" value="<%=job.getId() %>" name="jobId" />
            
                <!-- Job Title -->
                <div class="mb-3">
                    <label for="title" class="form-label"><i class="fas fa-briefcase"></i> Job Title</label>
                    <input type="text" class="form-control" id="title" name="title" value="<%= job != null ? job.getTitle() : "" %>" placeholder="Enter Job Title" required>
                </div>

                <!-- Location Dropdown -->
                <div class="mb-3">
                    <label for="location" class="form-label"><i class="fas fa-map-marker-alt"></i> Location</label>
                    <select class="form-select" id="location" name="location" required>
                        <option selected disabled>Select Location</option>
                        <option value="Qatar" <%= (job != null && job.getLocation().equals("Qatar")) ? "selected" : "" %>>Qatar</option>
                        <option value="UAE" <%= (job != null && job.getLocation().equals("UAE")) ? "selected" : "" %>>UAE</option>
                        <option value="Saudia Arab" <%= (job != null && job.getLocation().equals("Saudia Arab")) ? "selected" : "" %>>Saudia Arab</option>
                        <option value="Oman" <%= (job != null && job.getLocation().equals("Oman")) ? "selected" : "" %>>Oman</option>
                        <!-- Add more locations as needed -->
                    </select>
                </div>

                <!-- Category Dropdown -->
                <div class="mb-3">
                    <label for="category" class="form-label"><i class="fas fa-list"></i> Category</label>
                    <select class="form-select" id="category" name="category" required>
                        <option selected disabled>Select Category</option>
                        <option value="IT & Software" <%= (job != null && job.getCategory().equals("IT & Software")) ? "selected" : "" %>>IT & Software</option>
                        <option value="Marketing" <%= (job != null && job.getCategory().equals("Marketing")) ? "selected" : "" %>>Marketing</option>
                        <option value="Finance" <%= (job != null && job.getCategory().equals("Finance")) ? "selected" : "" %>>Finance</option>
                        <option value="Engineering" <%= (job != null && job.getCategory().equals("Engineering")) ? "selected" : "" %>>Engineering</option>
                        <!-- Add more categories as needed -->
                    </select>
                </div>

                <!-- Status Dropdown -->
                <div class="mb-3">
                    <label for="status" class="form-label"><i class="fas fa-clipboard-check"></i> Status</label>
                    <select class="form-select" id="status" name="status" required>
                        <option selected disabled>Select Status</option>
                        <option value="Active" <%= (job != null && job.getStatus().equals("Active")) ? "selected" : "" %>>Active</option>
                        <option value="Closed" <%= (job != null && job.getStatus().equals("Closed")) ? "selected" : "" %>>Closed</option>
                    </select>
                </div>

                <!-- Description -->
                <div class="mb-3">
                    <label for="description" class="form-label"><i class="fas fa-align-left"></i> Job Description</label>
                    <textarea class="form-control" id="description" name="description" rows="5" placeholder="Enter job description" required><%= job != null ? job.getDescription() : "" %></textarea>
                </div>

                <!-- Submit Button -->
                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-outline-light" style="background-color: #4B0E0E;">
                        <i class="fas fa-save"></i> Update Job
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<%@include file="all_components/footer.jsp" %>

</body>
</html>
