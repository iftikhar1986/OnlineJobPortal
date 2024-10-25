
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page isELIgnored="false" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Signup </title>
<%@include file="all_components/all_css.jsp" %>

</head>
<body>
<%@include file="all_components/navbar.jsp" %>

<!-- Registration Page -->
<div class="container mt-5 mb-5">
  <div class="row justify-content-center">
    <div class="col-md-5">
      <div class="card shadow-lg" style="border-radius: 1rem; background: linear-gradient(135deg, #4B0E0E, #A75B5B);">
        <div class="card-body p-4">
          <h2 class="text-center text-white" style="font-weight: bold;">
            <i class="fas fa-user-plus fa-2x"></i> <!-- Registration Icon -->
            <br>Register
          </h2>
          
                  
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
          <form action="register" method="post">
            <div class="mb-3">
              <label for="name" class="form-label text-light">Full Name</label>
              <input name="name" type="text" class="form-control" id="name" placeholder="Enter your full name" required>
            </div>
            <div class="mb-3">
              <label for="qualification" class="form-label text-light">Qualification</label>
              <input name="qualification" type="text" class="form-control" id="qualification" placeholder="Enter your qualification" required>
            </div>
            <div class="mb-3">
              <label for="email" class="form-label text-light">Email Address</label>
              <input name="email" type="email" class="form-control" id="email" placeholder="Enter your email" required>
            </div>
            <div class="mb-3">
              <label for="password" class="form-label text-light">Password</label>
              <input name="password" type="password" class="form-control" id="password" placeholder="Enter your password" required>
            </div>
            <div class="d-grid mb-4">
              <button type="submit" class="btn btn-light">Register</button>
            </div>
            <div class="text-center">
              <p class="text-light">Already have an account? <a href="login.jsp" class="text-light" style="font-weight: bold;">Login</a></p>
            </div>
          </form> <!-- End of form -->
        </div>
      </div>
    </div>
  </div>
</div>








</body>

  <%@include file="all_components/footer.jsp" %>


</html>