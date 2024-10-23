<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login In</title>
<%@include file="all_components/all_css.jsp" %>

</head>
<body>
<%@include file="all_components/navbar.jsp" %>

<!-- Login Page -->
<div class="container mt-5 mb-5">
  <div class="row justify-content-center">
    <div class="col-md-4">
      <div class="card shadow-lg" style="border-radius: 1rem; background: linear-gradient(135deg, #4B0E0E, #A75B5B);">
        <div class="card-body p-5">
          <h2 class="text-center text-white" style="font-weight: bold;">
            <i class="fas fa-user-circle fa-2x"></i> <!-- Login Icon -->
            <br>Login
          </h2>
<form action="login" method="POST">
            <div class="mb-4">
              <label for="email" class="form-label text-light">Email Address</label>
              <input type="email" name="email" class="form-control" id="email" placeholder="Enter your email" required>
            </div>
            <div class="mb-4">
              <label for="password" class="form-label text-light">Password</label>
              <input type="password" name="password" class="form-control" id="password" placeholder="Enter your password" required>
            </div>
            <div class="d-grid">
              <button type="submit" class="btn btn-light">Login</button>
            </div>
            <div class="mt-3 text-center">
              <a href="#" class="text-light">Forgot your password?</a>
            </div>
            <div class="mt-3 text-center">
              <p class="text-light">Don't have an account? <a href="signup.jsp" class="text-light" style="font-weight: bold;">Signup</a></p>
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