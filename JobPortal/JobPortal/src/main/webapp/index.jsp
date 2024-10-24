
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.db.DBConnect" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Online Job Portal</title>
<%@include file="all_components/all_css.jsp" %>

</head>
<body>
<%@include file="all_components/navbar.jsp" %>



 <!-- Hero Section -->
  <section class="hero text-center" style="background: linear-gradient(135deg, #4B0E0E, #A75B5B); color: white; padding: 80px 0;">
    <div class="container">
      <h1 style="font-weight: bold; font-size: 3.5rem;">Find Your Dream Job</h1>
      <p style="font-size: 1.5rem; margin-bottom: 30px;">Connecting talent with opportunities</p>
      <input type="text" class="form-control w-50 mx-auto" placeholder="Search for jobs..." style="margin-top: 20px; border-radius: 30px;">
    </div>
  </section>

  <!-- Featured Jobs -->
  <section class="featured-jobs py-5">
    <div class="container">
      <h2 class="text-center mb-4" style="color: #4B0E0E; font-weight: bold; font-size: 2.5rem;">Featured Jobs</h2>
      <div class="row">
        <!-- Job Listing Example -->
        <div class="col-md-4">
          <div class="card mb-4" style="border-radius: 15px; border: 1px solid #4B0E0E; transition: transform 0.2s;">
            <div class="card-body">
              <h5 class="card-title">Software Developer</h5>
              <p class="card-text">Company XYZ - Remote</p>
              <a href="#" class="btn btn-success">Apply Now</a>
            </div>
          </div>
        </div>
        <!-- Repeat for more job listings -->
         <div class="col-md-4">
          <div class="card mb-4" style="border-radius: 15px; border: 1px solid #4B0E0E; transition: transform 0.2s;">
            <div class="card-body">
              <h5 class="card-title">Software Developer</h5>
              <p class="card-text">Company XYZ - Remote</p>
              <a href="#" class="btn btn-success">Apply Now</a>
            </div>
          </div>
        </div>
        <!-- Repeat for more job listings -->
         <div class="col-md-4">
          <div class="card mb-4" style="border-radius: 15px; border: 1px solid #4B0E0E; transition: transform 0.2s;">
            <div class="card-body">
              <h5 class="card-title">Software Developer</h5>
              <p class="card-text">Company XYZ - Remote</p>
              <a href="#" class="btn btn-success">Apply Now</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Categories Section -->
  <section class="categories py-5" style="background-color: #f8f9fa;">
    <div class="container">
      <h2 class="text-center mb-4" style="color: #4B0E0E; font-weight: bold; font-size: 2.5rem;">Job Categories</h2>
      <div class="row">
        <div class="col-md-3">
          <div class="card text-center" style="border-radius: 15px; border: 1px solid #4B0E0E; transition: transform 0.2s;">
            <div class="card-body">
              <h5 class="card-title">IT & Software</h5>
              <a href="#" class="btn btn-outline-success">View Jobs</a>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card text-center" style="border-radius: 15px; border: 1px solid #4B0E0E; transition: transform 0.2s;">
            <div class="card-body">
              <h5 class="card-title">Marketing</h5>
              <a href="#" class="btn btn-outline-success">View Jobs</a>
            </div>
          </div>
        </div>
        <!-- Repeat for more categories -->
        <div class="col-md-3">
          <div class="card text-center" style="border-radius: 15px; border: 1px solid #4B0E0E; transition: transform 0.2s;">
            <div class="card-body">
              <h5 class="card-title">Marketing</h5>
              <a href="#" class="btn btn-outline-success">View Jobs</a>
            </div>
          </div>
        </div>
        <!-- Repeat for more categories -->
        <div class="col-md-3">
          <div class="card text-center" style="border-radius: 15px; border: 1px solid #4B0E0E; transition: transform 0.2s;">
            <div class="card-body">
              <h5 class="card-title">Marketing</h5>
              <a href="#" class="btn btn-outline-success">View Jobs</a>
            </div>
          </div>
        </div>
        <!-- Repeat for more categories -->
      </div>
    </div>
  </section>

  
    <%@include file="all_components/footer.jsp" %>
  

</body>

</html>