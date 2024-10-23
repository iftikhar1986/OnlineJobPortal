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

<!-- Admin Page -->
<div class="container mt-5 mb-5 pb-5">
  <div class="row">
    <!-- Dashboard Overview -->
    <div class="col-md-3">
      <div class="card text-center text-light" style="background-color: #A75B5B; border-radius: 1rem;">
        <div class="card-body">
          <h5 class="card-title"><i class="fas fa-briefcase"></i> Total Jobs Posted</h5>
          <p class="card-text">120</p>
        </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="card text-center text-light" style="background-color: #4B0E0E; border-radius: 1rem;">
        <div class="card-body">
          <h5 class="card-title"><i class="fas fa-list"></i> Active Listings</h5>
          <p class="card-text">80</p>
        </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="card text-center text-light" style="background-color: #A75B5B; border-radius: 1rem;">
        <div class="card-body">
          <h5 class="card-title"><i class="fas fa-users"></i> Total Applicants</h5>
          <p class="card-text">300</p>
        </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="card text-center text-light" style="background-color: #4B0E0E; border-radius: 1rem;">
        <div class="card-body">
          <h5 class="card-title"><i class="fas fa-user"></i> Users Registered</h5>
          <p class="card-text">200</p>
        </div>
      </div>
    </div>
  </div>

  <!-- Job Management Table -->
  <div class="row mt-4">
    <div class="col-md-12">
      <div class="card shadow-lg">
        <div class="card-header text-white" style="background-color: #4B0E0E;">
          <i class="fas fa-tasks"></i> Job Management
        </div>
        <div class="card-body">
          <table class="table table-striped">
            <thead>
              <tr>
                <th scope="col"><i class="fas fa-briefcase"></i> Job Title</th>
                <th scope="col"><i class="fas fa-calendar-alt"></i> Posting Date</th>
                <th scope="col"><i class="fas fa-clipboard-check"></i> Status</th>
                <th scope="col"><i class="fas fa-cog"></i> Actions</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>Software Developer</td>
                <td>2024-10-10</td>
                <td>Active</td>
                <td>
                  <button class="btn btn-sm btn-primary"><i class="fas fa-edit"></i> Edit</button>
                  <button class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Delete</button>
                </td>
              </tr>
              <!-- More rows can go here -->
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>

  <!-- User Management Table -->
  <div class="row mt-4">
    <div class="col-md-12">
      <div class="card shadow-lg">
        <div class="card-header text-white" style="background-color: #A75B5B;">
          <i class="fas fa-users-cog"></i> User Management
        </div>
        <div class="card-body">
          <table class="table table-striped">
            <thead>
              <tr>
                <th scope="col"><i class="fas fa-user"></i> Name</th>
                <th scope="col"><i class="fas fa-user-tag"></i> Role</th>
                <th scope="col"><i class="fas fa-envelope"></i> Email</th>
                <th scope="col"><i class="fas fa-user-check"></i> Account Status</th>
                <th scope="col"><i class="fas fa-cog"></i> Actions</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>John Doe</td>
                <td>Freelancer</td>
                <td>john@example.com</td>
                <td>Active</td>
                <td>
                  <button class="btn btn-sm btn-warning"><i class="fas fa-ban"></i> Suspend</button>
                  <button class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Delete</button>
                </td>
              </tr>
              <!-- More rows can go here -->
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>





</body>

  <%@include file="all_components/footer.jsp" %>


</html>