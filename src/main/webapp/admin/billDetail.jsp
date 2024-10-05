<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Bill Details - Admin Panel</title>
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
                <h1 class="h3 mb-4 text-gray-800">Bill Details</h1>
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Details for Bill #${bill.billId}</h6>
                    </div>
                    <div class="card-body">
                        <h5 class="mb-3">Bill Information</h5>
                        <table class="table table-bordered">
                            <tr>
                                <th>Bill ID:</th>
                                <td>${bill.billId}</td>
                            </tr>
                            <tr>
                                <th>Date Created:</th>
                                <td><fmt:formatDate value="${bill.createdDate}" pattern="MM-dd-yyyy" /></td>
                            </tr>
                            <tr>
                                <th>Consignee name:</th>
                                <td>${bill.userName}</td>
                            </tr>
                            <tr>
                                <th>Consignee phone:</th>
                                <td>${bill.phone}</td>
                            </tr>
                            <tr>
                                <th>Address:</th>
                                <td>
                                    ${bill.address} - ${bill.district} - ${bill.city}
                                </td>
                            </tr>
                            <tr>
                                <th>Status:</th>
                                <td>${bill.statusBill}</td>
                            </tr>
                            <tr>
                                <th>Voucher Code:</th>
                                <td>
                                    <c:if test="${bill.voucherCode != null}">
                                        ${bill.voucherCode}
                                    </c:if>
                                    <c:if test="${bill.voucherCode == null}">
                                        No voucher code provided
                                    </c:if>
                                </td>
                            </tr>
                            <tr>
                                <th>Total Price:</th>
                                <td>
                                    <fmt:formatNumber value="${bill.totalPrice}" type="number" groupingUsed="true" /> đ
                                </td>
                            </tr>

                        </table>
                        <h5 class="mt-4 mb-3">Items in Bill</h5>
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th>Product ID</th>
                                <th>Product Name</th>
                                <th>Quantity</th>
                                <th>Price</th>
                                <th>Discount Percentage</th>
                                <th>Price After Discount</th>
                                <th>Created Date</th>
<%--                                <th>Updated Date</th>--%>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${billDetailList}" var="detail">
                                <tr>
                                    <td>${detail.product.productId}</td>
                                    <td><a href="/detailProduct?id=${detail.product.productId}">${detail.product.productName}</a></td>
                                    <td>${detail.quantity}</td>
                                    <td><fmt:formatNumber value="${detail.product.priceProduct}" type="number" groupingUsed="true" /> đ</td>
                                    <td>${detail.discount.discountPercentage} %</td>
                                    <td><fmt:formatNumber value="${detail.product.priceAfterDiscount}" type="number" groupingUsed="true" /> đ</td>
                                    <td><fmt:formatDate value="${bill.createdDate}" pattern="MM-dd-yyyy" /></td>
<%--                                    <td><fmt:formatDate value="${bill.updatedDate}" pattern="MM-dd-yyyy" /></td>--%>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
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
