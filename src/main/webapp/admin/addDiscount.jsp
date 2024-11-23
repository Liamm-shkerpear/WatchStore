<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Discount - Admin Panel</title>
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body id="page-top">
<div id="wrapper">
    <%@ include file="navbar.jsp" %>
    <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                <!-- Sidebar Toggle (Topbar) -->
                <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                    <i class="fa fa-bars"></i>
                </button>
            </nav>
            <!-- Begin Page Content -->
            <div class="container-fluid">
                <h1 class="h3 mb-4 text-gray-800">Add New Discount</h1>
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Discount Details</h6>
                    </div>
                    <div class="card-body">
                        <form action="${pageContext.request.contextPath}/addDiscount" method="post">
                            <div class="form-group">
                                <label>Discount Percentage (%):</label>
                                <input type="number" name="discountPercentage" class="form-control" placeholder="Enter discount percentage" required>
                            </div>
                            <div class="form-group">
                                <label>Start Date:</label>
                                <input type="date" name="startDate" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>End Date:</label>
                                <input type="date" name="endDate" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Status:</label>
                                <select name="status" class="form-control">
                                    <option value="1">Active</option>
                                    <option value="0">Inactive</option>
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
            <!-- /.container-fluid -->
        </div>
        <!-- End of Main Content -->
        <footer class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copywright text-center my-auto">
                    <span>Copyright &copy; Your Website 2020</span>
                </div>
            </div>
        </footer>
        <!-- End of Footer -->
    </div>
    <!-- End of Content Wrapper -->
</div>
<!-- End of Page Wrapper -->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>
<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript -->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
<!-- Custom scripts for all pages -->
<script src="js/sb-admin-2.min.js"></script>
</body>
</html>
