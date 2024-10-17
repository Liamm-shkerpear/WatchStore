<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Edit Transport - SB Admin 2</title>
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
                <h1 class="h3 mb-4 text-gray-800">Edit Transport Method</h1>
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Transport Details</h6>
                    </div>
                    <div class="card-body">
                        <form action="${pageContext.request.contextPath}/editVoucher" method="post">
                            <input type="hidden" name="voucherID" value="${voucher.voucherId}">
                            <div class="form-group">
                                <label for="code">Code:</label>
                                <input type="text" hidden class="form-control" id="code" name="code" value="${voucher.code}" required>

                                <input type="text" disabled class="form-control" value="${voucher.code}" required>
                            </div>
                            <div class="form-group">
                                <label for="value">Value:</label>
                                <input type="number" class="form-control" id="value" name="value" value="${voucher.value}" required>
                            </div>
                            <div class="form-group">
                                <label for="typeSale">Type Sale:</label>
                                <select class="form-control" id="typeSale" name="typeSale">
                                    <option value="0" ${voucher.typeSale == false ? 'selected' : ''}>Fixed Amount</option>
                                    <option value="1" ${voucher.typeSale == true ? 'selected' : ''}>Percentage</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="status">Status:</label>
                                <select class="form-control" id="status" name="status">
                                    <option value="1" ${voucher.status == true ? 'selected' : ''}>Active</option>
                                    <option value="0" ${voucher.status == false ? 'selected' : ''}>Inactive</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="describeVoucher">Description:</label>
                                <textarea class="form-control" id="describeVoucher" name="describeVoucher" required>${voucher.describeVoucher}</textarea>
                            </div>
                            <div class="form-group">
                                <label for="maxSale">Max Sale:</label>
                                <input type="number" class="form-control" id="maxSale" name="maxSale" value="${voucher.maxSale}" required>
                            </div>
                            <div class="form-group">
                                <label for="startDate">Start Date:</label>
                                <input type="date" class="form-control" id="startDate" name="startDate" value="${voucher.startDate}" required>
                            </div>
                            <div class="form-group">
                                <label for="endDate">End Date:</label>
                                <input type="date" class="form-control" id="endDate" name="endDate" value="${voucher.endDate}" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Update Voucher</button>
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