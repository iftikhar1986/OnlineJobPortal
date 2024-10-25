
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page isELIgnored="false" %>





<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark" style="background: linear-gradient(135deg, #4B0E0E, #A75B5B); box-shadow: 0 4px 30px rgba(0, 0, 0, 0.4);">
  <div class="container-fluid">
    <a class="navbar-brand" href="#" style="font-weight: bold; font-size: 2rem; letter-spacing: 2px; font-family: 'Georgia', serif;">Qatar Jobs</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp"><i class="fas fa-home"></i> Home</a>
        </li>
        
        <c:if test="${userobj.role eq 'admin' }">
        
         <li class="nav-item">
          <a class="nav-link" href="view_jobs.jsp"><i class="fas fa-briefcase"></i> View Jobs</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="add_job.jsp"><i class="fas fa-plus-circle"></i> Post a Job</a>
        </li>
        
        
        </c:if>
        
       
      </ul>

      <form class="d-flex">
        <ul class="navbar-nav mb-2 mb-lg-0">
        
        <c:if test="${not empty userobj }">
    <li class="nav-item">
    <a class="btn btn-light me-2" style="border-radius: 30px; transition: background-color 0.3s, transform 0.3s;" href="#">
        <i class="fas fa-user-shield"></i> Admin
    </a>
</li>
<li class="nav-item">
    <a class="btn btn-outline-light me-2" style="border-radius: 30px; transition: background-color 0.3s, transform 0.3s;" href="#">
        <i class="fas fa-sign-out-alt"></i> Logout
    </a>
</li>
    
</c:if>


    <c:if test="${ empty userobj }">
    <li class="nav-item">
            <a class="btn btn-light me-2" style="border-radius: 30px; transition: background-color 0.3s, transform 0.3s;" href="login.jsp"><i class="fas fa-sign-in-alt"></i> Login</a>
          </li>
          <li class="nav-item">
            <a class="btn btn-outline-light me-2" style="border-radius: 30px; transition: background-color 0.3s, transform 0.3s;" href="signup.jsp"><i class="fas fa-user-plus"></i> Signup</a>
          </li>
</c:if>
        
          
        </ul>
      </form>
    </div>
  </div>
</nav>



