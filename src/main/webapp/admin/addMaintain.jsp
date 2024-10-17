<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Add Maintenance - Admin Panel</title>
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body id="page-top">
<div id="wrapper">
  <%@ include file="navbar.jsp" %>
  <div id="content-wrapper" class="d-flex flex-column">
    <div id="content">
      <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
          <i class="fa fa-bars"></i>
        </button>
      </nav>
      <div class="container-fluid">
        <h1 class="h3 mb-4 text-gray-800">Add New Maintenance</h1>
        <div class="card shadow mb-4">
          <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Maintenance Details</h6>
          </div>
          <div class="card-body">
            <form action="${pageContext.request.contextPath}/addMaintain" method="post">
              <div class="form-group">
                <label>Maintenance Name:</label>
                <input type="text" name="maintenanceName" class="form-control" placeholder="Enter maintenance name" required>
              </div>
              <div class="form-group">
                <label>Description:</label>
                <textarea name="maintenanceDescription" class="form-control" placeholder="Describe the maintenance" required></textarea>
              </div>
              <div class="form-group">
                <label>Date:</label>
                <input type="date" name="maintenanceDate" class="form-control" required>
              </div>
              <div class="form-group">
                <label>Time:</label>
                <input type="time" name="maintenanceTime" class="form-control" required>
              </div>
              <div class="form-group">
                <label>User:</label>
                <select name="userId" class="form-control">
                  <c:forEach var="user" items="${userList}">
                    <option value="${user.userID}">${user.userID}. ${user.name}</option>
                  </c:forEach>
                </select>
              </div>
              <div class="form-group">
                <label for="productIds">Select Products</label>
                <select multiple class="form-control" id="productIds" name="productIds">
                  <c:forEach var="product" items="${productList}">
                    <option value="${product.productId}">${product.productName}</option>
                  </c:forEach>
                </select>
              </div>
              <div class="form-group">
                <label>Status:</label>
                <select name="maintenanceStatus" class="form-control">
                  <option value="true">Active</option>
                  <option value="false">Inactive</option>
                </select>
              </div>
              <button type="submit" class="btn btn-primary">Submit</button>
            </form>
            <c:if test="${not empty errorMessage}">
              <div class="alert alert-danger" role="alert">${errorMessage}</div>
            </c:if>
            <c:if test="${not empty successMessage}">
              <div class="alert alert-success" role="alert">${successMessage}</div>
            </c:if>
          </div>
        </div>
      </div>
    </div>
    <footer class="sticky-footer bg-white">
      <div class="container my-auto">
        <div class="copywright text-center my-auto">
          <span>Copyright &copy; Your Website 2020</span>
        </div>
      </div>
    </footer>
  </div>
</div>
<a class="scroll-to-top rounded" href="#page-top">
  <i class="fas fa-angle-up"></i>
</a>
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="js/sb-admin-2.min.js"></script>
</body>
</html>
