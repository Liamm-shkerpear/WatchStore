<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vn">
<head>
  <meta charset="UTF-8">
  <title>Edit Product - Admin Panel</title>
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
        <h1 class="h3 mb-2 text-gray-800">Edit Product Details</h1>
        <div class="card shadow mb-4">
          <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Product Information</h6>
          </div>
          <div class="card-body">
            <form action="${pageContext.request.contextPath}/editProduct" method="post" enctype="multipart/form-data">
              <input type="hidden" name="productId" value="${product.productId}">
              <div class="form-group">
                <label for="productName">Product Name:</label>
                <input type="text" class="form-control" id="productName" name="productName" value="${product.productName}" required>
              </div>
              <div class="form-group">
                <label for="img">Main Image:</label>
                <input type="file" class="form-control-file" id="img" name="img">
                <img src="${product.img}" alt="${product.productName}" style="width: 100px; height: 100px;">
              </div>
              <div class="form-group">
                <label for="img1">Image 1:</label>
                <input type="file" class="form-control-file" id="img1" name="img1">
                <img src="${product.img1}" alt="${product.productName}" style="width: 100px; height: 100px;">
              </div>
              <div class="form-group">
                <label for="img2">Image 2:</label>
                <input type="file" class="form-control-file" id="img2" name="img2">
                <img src="${product.img2}" alt="${product.productName}" style="width: 100px; height: 100px;">
              </div>
              <div class="form-group">
                <label for="img3">Image 3:</label>
                <input type="file" class="form-control-file" id="img3" name="img3">
                <img src="${product.img3}" alt="${product.productName}" style="width: 100px; height: 100px;">
              </div>
              <div class="form-group">
                <label for="priceProduct">Price:</label>
                <input type="number" class="form-control" id="priceProduct" name="priceProduct" value="${product.priceProduct}" required>
              </div>
              <div class="form-group">
                <label for="typeProductId">Product Type:</label>
                <select class="form-control" id="typeProductId" name="typeProductId">
                  <c:forEach items="${typeProductList}" var="typeProduct">
                    <option value="${typeProduct.typeProductId}" ${product.typeProductId == typeProduct.typeProductId ? 'selected' : ''}>${typeProduct.typeProductName}</option>
                  </c:forEach>
                </select>
              </div>
              <div class="form-group">
                <label for="sizeId">Size:</label>
                <select class="form-control" id="sizeId" name="sizeId">
                  <c:forEach items="${sizeList}" var="size">
                    <option value="${size.sizeId}" ${product.sizeId == size.sizeId ? 'selected' : ''}>${size.sizeName}</option>
                  </c:forEach>
                </select>
              </div>
              <div class="form-group">
                <label for="trademarkId">Trademark:</label>
                <select class="form-control" id="trademarkId" name="trademarkId">
                  <c:forEach items="${trademarkList}" var="trademark">
                    <option value="${trademark.trademarkId}" ${product.trademarkId == trademark.trademarkId ? 'selected' : ''}>${trademark.trademarkName}</option>
                  </c:forEach>
                </select>
              </div>
              <div class="form-group">
                <label for="quantity">Quantity:</label>
                <input type="number" class="form-control" id="quantity" name="quantity" value="${product.quantity}" required>
              </div>
              <div class="form-group">
                <label for="editor">Description:</label>
                <textarea class="form-control" id="editor" name="describeProduct" required>${product.describeProduct}</textarea>
              </div>
              <div class="form-group">
                <label for="status">Status:</label>
                <select class="form-control" id="status" name="status">
                  <option value="true" ${product.status ? 'selected' : ''}>Active</option>
                  <option value="false" ${!product.status ? 'selected' : ''}>Inactive</option>
                </select>
              </div>
              <div class="form-group">
                <label for="discount">Discount:</label>
                <select class="form-control" id="discount" name="discountId">
                  <option value="0">No Discount</option>
                  <c:forEach items="${discountList}" var="discount">
                    <option value="${discount.discountId}" ${discountProduct.discountId == discount.discountId ? 'selected' : ''}>${discount.discountPercentage}</option>
                  </c:forEach>
                </select>
              </div>
              <button type="submit" class="btn btn-primary">Update Product</button>
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
