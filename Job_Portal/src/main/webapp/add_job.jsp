


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


<div class="container mt-5 mb-5" style="max-width: 800px; padding-bottom: 40px;">
  <div class="card shadow-lg">
    <div class="card-header text-white" style="background-color: #4B0E0E;">
      <h4 class="mb-0"><i class="fas fa-plus-circle"></i> Post a Job</h4>
    </div>
    <div class="card-body">
      <!-- Post Job Form -->
      <form action="submit_job.jsp" method="post">
        <!-- Job Title -->
        <div class="mb-3">
          <label for="jobTitle" class="form-label"><i class="fas fa-briefcase"></i> Job Title</label>
          <input type="text" class="form-control" id="jobTitle" name="jobTitle" placeholder="Enter Job Title" required>
        </div>

        <!-- Location Dropdown -->
        <div class="mb-3">
          <label for="jobLocation" class="form-label"><i class="fas fa-map-marker-alt"></i> Location</label>
          <select class="form-select" id="jobLocation" name="jobLocation" required>
            <option selected disabled>Select Location</option>
            <option value="New York">New York</option>
            <option value="San Francisco">San Francisco</option>
            <option value="London">London</option>
            <option value="Sydney">Sydney</option>
            <!-- Add more locations as needed -->
          </select>
        </div>

        <!-- Category Dropdown -->
        <div class="mb-3">
          <label for="jobCategory" class="form-label"><i class="fas fa-list"></i> Category</label>
          <select class="form-select" id="jobCategory" name="jobCategory" required>
            <option selected disabled>Select Category</option>
            <option value="IT & Software">IT & Software</option>
            <option value="Marketing">Marketing</option>
            <option value="Finance">Finance</option>
            <option value="Engineering">Engineering</option>
            <!-- Add more categories as needed -->
          </select>
        </div>

        <!-- Status Dropdown -->
        <div class="mb-3">
          <label for="jobStatus" class="form-label"><i class="fas fa-clipboard-check"></i> Status</label>
          <select class="form-select" id="jobStatus" name="jobStatus" required>
            <option selected disabled>Select Status</option>
            <option value="Active">Active</option>
            <option value="Closed">Closed</option>
          </select>
        </div>

        <!-- Description -->
        <div class="mb-3">
          <label for="jobDescription" class="form-label"><i class="fas fa-align-left"></i> Job Description</label>
          <textarea class="form-control" id="jobDescription" name="jobDescription" rows="5" placeholder="Enter job description" required></textarea>
        </div>

        <!-- Submit Button -->
        <div class="d-grid gap-2">
          <button type="submit" class="btn btn-outline-light" style="background-color: #4B0E0E;">
            <i class="fas fa-save"></i> Post Job
          </button>
        </div>
      </form>
    </div>
  </div>
</div>







</body>

  <%@include file="all_components/footer.jsp" %>


</html>



















