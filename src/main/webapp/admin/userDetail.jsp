<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--UTF8--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>User Profile - SB Admin 2</title>
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <%@ include file="navbar.jsp" %>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                <!-- Sidebar Toggle (Topbar) -->
                <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                    <i class="fa fa-bars"></i>
                </button>
            </nav>
            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <h1 class="h3 mb-4 text-gray-800">User Profile</h1>

                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Detailed Information</h6>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-4">
                                <div class="text-center">
                                    <img class="img-profile rounded-circle mb-3" src="${user.avatar}" alt="Avatar" style="width: 140px; height: 140px;">
                                </div>
                                <h4>${user.name}</h4>
                                <p><i class="fas fa-envelope fa-fw"></i> ${user.email}</p>
                                <p><i class="fas fa-phone fa-fw"></i>
                                <c:choose>
                                    <c:when test="${user.phoneNumber != null}">
                                        ${user.phoneNumber}
                                    </c:when>
                                    <c:otherwise>
                                        N/A
                                    </c:otherwise>
                                </c:choose>
                                </p>
                            </div>
                            <div class="col-lg-8">
                                <table class="table table-bordered">
                                    <tr>
                                        <th>Date of Birth:</th>
                                        <td>${user.userDOB}</td>
                                    </tr>
                                    <tr>
                                        <th>Gender:</th>
                                        <td>${user.gender ? "Male" : "Female"}</td>
                                    </tr>
                                    <tr>
                                        <th>Address:</th>
                                        <td>
                                            <c:choose>
                                                <c:when test="${user.address != null}">
                                                    ${user.address}
                                                </c:when>
                                                <c:otherwise>
                                                    N/A
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Status:</th>
                                        <td>
<%--                                            Check ban--%>
                                            <c:choose>
                                                <c:when test="${user.ban}">
                                                    <span class="badge badge-danger">Banned</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:choose>
                                                        <c:when test="${user.status}">
                                                            <span class="badge badge-success">Active</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="badge badge-danger">Inactive</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Account Type:</th>
                                        <td>
                                            <c:choose>
                                                <c:when test="${user.typeAccountId == 2}">
                                                    <span class="badge badge-primary">Admin</span>
                                                </c:when>
                                                <c:when test="${user.typeAccountId == 3}">
                                                    <span class="badge badge-info">Employee</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge badge-warning">User</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
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

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Bootstrap core JavaScript-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="js/sb-admin-2.min.js"></script>

</body>

</html>
