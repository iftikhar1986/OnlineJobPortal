<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page isELIgnored="false" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Jobs</title>
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
      <h4 class="mb-0"><i class="fas fa-plus-circle"></i> Post a Job</h4>
    </div>
    <div class="card-body">

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
 
      

      <!-- Post Job Form -->
      <form action="add_job" method="post">
        <!-- Job Title -->
        <div class="mb-3" >
          <label for="title" class="form-label"><i class="fas fa-briefcase"></i> Job Title</label>
          <input type="text" class="form-control" id="title" name="title" placeholder="Enter Job Title" required>
        </div>

        <!-- Location Dropdown -->
        <div class="mb-3">
          <label for="location" class="form-label"><i class="fas fa-map-marker-alt"></i> Location</label>
          <select class="form-select" id="location" name="location" required>
            <option selected disabled>Select Location</option>
            <option value="Qatar">Qatar</option>
            <option value="UAE">UAE</option>
            <option value="Saudia Arab">Saudia Arab</option>
            <option value="Oman">Oman</option>
            <!-- Add more locations as needed -->
          </select>
        </div>

        <!-- Category Dropdown -->
        <div class="mb-3">
          <label for="category" class="form-label"><i class="fas fa-list"></i> Category</label>
          <select class="form-select" id="category" name="category" required>
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
          <label for="status" class="form-label"><i class="fas fa-clipboard-check"></i> Status</label>
          <select class="form-select" id="status" name="status" required>
            <option selected disabled>Select Status</option>
            <option value="Active">Active</option>
            <option value="Closed">Closed</option>
          </select>
        </div>

        <!-- Description -->
        <div class="mb-3">
          <label for="description" class="form-label"><i class="fas fa-align-left"></i> Job Description</label>
          <textarea class="form-control" id="description" name="description" rows="5" placeholder="Enter job description" required></textarea>
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

<%@include file="all_components/footer.jsp" %>

</body>
</html>
