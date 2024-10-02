<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Edit User Profile</title>
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
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
                <h1 class="h3 mb-4 text-gray-800">Edit User Profile</h1>
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Profile Information</h6>
                    </div>
                    <div class="card-body">
                        <form action="${pageContext.request.contextPath}/editUserInfo" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="userID" value="${userInfo.userID}">
                            <div class="form-group">
                                <label>Name:</label>
                                <input type="text" name="name" class="form-control" value="${userInfo.name}" required>
                            </div>
                            <div class="form-group">
                                <label>Email:</label>
                                <input type="email" name="email" class="form-control" value="${userInfo.email}" required>
                            </div>
                            <div class="form-group">
                                <label>Date of Birth:</label>
                                <input type="date" name="userDOB" class="form-control" value="${userInfo.userDOB}">
                            </div>
                            <div class="form-group">
                                <label>Phone Number:</label>
                                <input type="text" name="phoneNumber" class="form-control" value="${userInfo.phoneNumber}">
                            </div>
                            <div class="form-group">
                                <label>Gender:</label>
                                <select name="gender" class="form-control">
                                    <option value="1" ${userInfo.gender ? "selected" : ""}>Male</option>
                                    <option value="0" ${!userInfo.gender ? "selected" : ""}>Female</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Address:</label>
                                <input type="text" name="address" class="form-control" value="${userInfo.address}">
                            </div>
                            <div class="form-group">
                                <label>Status:</label>
                                <select name="status" class="form-control">
                                    <option value="1" ${userInfo.status ? "selected" : ""}>Active</option>
                                    <option value="0" ${!userInfo.status ? "selected" : ""}>Inactive</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Type of Account:</label>
                                <select name="typeAccountId" class="form-control">
                                    <c:forEach items="${typeAccountList}" var="type">
                                        <option value="${type.typeAccountId}" ${type.typeAccountId == userInfo.typeAccountId ? "selected" : ""}>${type.typeAccountName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Avatar:</label>
                                <input type="file" name="avatar" class="form-control-file">
                                <small>Current: <img src="${userInfo.avatar}" alt="Avatar" style="height: 50px;"></small>
                            </div>
                            <div class="form-group">
                                <label>Description:</label>
                                <textarea name="description" class="form-control" rows="4">${userInfo.description}</textarea>
                            </div>
                            <button type="submit" class="btn btn-primary">Save Changes</button>
                        </form>
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
