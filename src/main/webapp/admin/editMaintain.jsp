<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Edit Maintenance - Admin Panel</title>
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
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

            <!-- Begin Page Content -->
            <div class="container-fluid">
                <h1 class="h3 mb-4 text-gray-800">Edit Maintenance</h1>
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Maintenance Details</h6>
                    </div>
                    <div class="card-body">
                        <form action="${pageContext.request.contextPath}/editMaintain" method="post">
                            <input type="hidden" name="maintenanceId" value="${maintenance.maintenanceId}">

                            <div class="form-group">
                                <label>Maintenance Name:</label>
                                <input type="text" name="maintenanceName" class="form-control" value="${maintenance.maintenanceName}" required>
                            </div>

                            <div class="form-group">
                                <label>Description:</label>
                                <textarea name="maintenanceDescription" class="form-control" required>${maintenance.maintenanceDescription}</textarea>
                            </div>

                            <div class="form-group">
                                <label>Date:</label>
                                <input type="date" name="maintenanceDate" class="form-control" value="${maintenance.maintenanceDate}" required>
                            </div>

                            <div class="form-group">
                                <label>Time:</label>
                                <input type="time" name="maintenanceTime" class="form-control" value="${maintenance.maintenanceTime}" required>
                            </div>

                            <div class="form-group">
                                <label>Status:</label>
                                <select name="maintenanceStatus" class="form-control">
                                    <option value="1" ${maintenance.maintenanceStatus ? 'selected' : ''}>Active</option>
                                    <option value="0" ${!maintenance.maintenanceStatus ? 'selected' : ''}>Inactive</option>
                                </select>
                            </div>

                            <h5 class="mt-4">Related Products</h5>
                            <ul class="list-group mb-3">
                                <c:forEach var="product" items="${maintenanceProductList}">
                                    <li class="list-group-item">
                                        <strong>${product.productName}</strong> - ${product.priceProduct} USD
                                        <br>
                                        <span>${product.describeProduct}</span>
                                    </li>
                                </c:forEach>
                            </ul>

                            <button type="submit" class="btn btn-primary">Update Maintenance</button>
                        </form>
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
