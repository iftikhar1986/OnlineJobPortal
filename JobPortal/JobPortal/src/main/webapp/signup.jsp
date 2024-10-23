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
          <form>
            <div class="mb-3">
              <label for="fullName" class="form-label text-light">Full Name</label>
              <input type="text" class="form-control" id="fullName" placeholder="Enter your full name" required>
            </div>
            <div class="mb-3">
              <label for="qualification" class="form-label text-light">Qualification</label>
              <input type="text" class="form-control" id="qualification" placeholder="Enter your qualification" required>
            </div>
            <div class="mb-3">
              <label for="email" class="form-label text-light">Email Address</label>
              <input type="email" class="form-control" id="email" placeholder="Enter your email" required>
            </div>
            <div class="mb-3">
              <label for="password" class="form-label text-light">Password</label>
              <input type="password" class="form-control" id="password" placeholder="Enter your password" required>
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