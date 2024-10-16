<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Product - SB Admin 2</title>
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    <script src="https://cdn.ckeditor.com/4.20.2/standard/ckeditor.js"></script>

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
                <h1 class="h3 mb-2 text-gray-800">Add New Product</h1>
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Product Details</h6>
                    </div>
                    <div class="card-body">
                        <form action="${pageContext.request.contextPath}/addProduct" method="post" enctype="multipart/form-data">
                            <div class="row">
                                <div class="col-lg-6">
                                    <h2>Product Details</h2>
                                    <c:if test="${not empty errorMessage}">
                                        <div class="alert alert-danger mt-3">${errorMessage}</div>
                                    </c:if>
                                    <c:if test="${not empty successMessage}">
                                        <div class="alert alert-success mt-3">${successMessage}</div>
                                    </c:if>
                                    <div class="form-group">
                                        <label for="productName">Product Name</label>
                                        <input type="text" id="productName" name="productName" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="priceProduct">Price</label>
                                        <input type="number" id="priceProduct" name="priceProduct" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="productTypeId">Type</label>
                                        <select id="productTypeId" name="productTypeId" class="form-control">
                                            <c:forEach var="type" items="${listProductType}">
                                                <option value="${type.typeProductId}">${type.typeProductName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="sizeId">Size</label>
                                        <select id="sizeId" name="sizeId" class="form-control">
                                            <c:forEach var="size" items="${listSize}">
                                                <option value="${size.sizeId}">${size.sizeName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="trademarkId">Trademark</label>
                                        <select id="trademarkId" name="trademarkId" class="form-control">
                                            <c:forEach var="trademark" items="${listTrademark}">
                                                <option value="${trademark.trademarkId}">${trademark.trademarkName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="quantity">Quantity</label>
                                        <input type="number" id="quantity" name="quantity" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="discountId">Discount</label>
                                        <select id="discountId" name="discountId" class="form-control">
                                            <c:forEach var="discount" items="${listDiscount}">
                                                <option value="${discount.discountId}">Giảm ${discount.discountPercentage}%</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="editor">Description</label>
                                        <textarea id="editor" name="describeProduct" class="form-control"></textarea>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <h2>Product Images</h2>
                                    <div class="form-group">
                                        <label for="img">Main Image</label>
                                        <input type="file" id="img" name="img" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="img1">Additional Image 1</label>
                                        <input type="file" id="img1" name="img1" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label for="img2">Additional Image 2</label>
                                        <input type="file" id="img2" name="img2" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label for="img3">Additional Image 3</label>
                                        <input type="file" id="img3" name="img3" class="form-control">
                                    </div>
                                    <button type="submit" class="btn btn-primary">Add Product</button>
                                </div>
                            </div>
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
<script>
    CKEDITOR.replace('editor', {
        filebrowserUploadUrl: '/uploadImage',
        filebrowserUploadMethod: 'form'
    });
</script>
</body>
</html>
