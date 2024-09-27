<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi-VN" data-website-id="1" data-main-object="website.page(4,)" data-add2cart-redirect="1">

<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta name="generator" content="Odoo" />
  <meta name="description" content="This is the homepage of the website" />

  <meta property="og:type" content="website" />
  <meta property="og:title" content="Home | DaNaLuxury" />
  <meta property="og:site_name" content="DaNaLuxury" />
  <meta property="og:url" content="https://danaluxury.odoo.com/" />
  <meta property="og:image" content="https://danaluxury.odoo.com/web/image/website/1/logo?unique=689cb1c" />
  <meta property="og:description" content="This is the homepage of the website" />

  <meta name="twitter:card" content="summary_large_image" />
  <meta name="twitter:title" content="Home | DaNaLuxury" />
  <meta name="twitter:image" content="https://danaluxury.odoo.com/web/image/website/1/logo/300x300?unique=689cb1c" />
  <meta name="twitter:description" content="This is the homepage of the website" />

  <link rel="canonical" href="https://danaluxury.odoo.com/" />

  <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin="" />
  <title>Home | DaNaLuxury</title>
  <link type="image/x-icon" rel="shortcut icon" href="/web/image/website/DaNaLuxury.ico" />
  <link rel="preload" href="/web/static/src/libs/fontawesome/fonts/fontawesome-webfont.woff2?v=4.7.0" as="font"
        crossorigin="" />
  <link type="text/css" rel="stylesheet" href="/web/assets/web.assets_frontend.min.css" />
  <script id="web.layout.odooscript" type="text/javascript">
    var odoo = {
      csrf_token: "f71186564dd778a3c6b849b802a10a10d29bad69o1762350078",
      debug: "",
    };
  </script>
  <script type="text/javascript">
    odoo.__session_info__ = { "is_admin": false, "is_system": false, "is_public": true, "is_website_user": true, "uid": null, "is_frontend": true, "profile_session": null, "profile_collectors": null, "profile_params": null, "show_effect": true, "currencies": { "23": { "symbol": "\u20ab", "position": "after", "digits": [69, 0] } }, "bundle_params": { "lang": "en_US", "website_id": 1 }, "test_mode": false, "websocket_worker_version": "18.0-2", "translationURL": "/website/translations", "cache_hashes": { "translations": "aeb8764cc38dcefb463d7785d3b693cdca5cfede" }, "geoip_country_code": "VN", "geoip_phone_code": 84, "lang_url_code": "vi" };
    if (!/(^|;\s)tz=/.test(document.cookie)) {
      const userTZ = Intl.DateTimeFormat().resolvedOptions().timeZone;
      document.cookie = `tz=${userTZ}; path=/`;
    }
  </script>
  <script type="text/javascript" defer="defer" src="/web/assets/web.assets_frontend_minimal.min.js"
          onerror="__odooAssetError=1"></script>
  <script type="text/javascript" defer="defer" data-src="/web/assets/web.assets_frontend_lazy.min.js"
          onerror="__odooAssetError=1"></script>
</head>
<body>
<%@ include file="header.jsp" %>
<div id="wrapper">
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
                <th>Consignee Name:</th>
                <td>${bill.userName}</td>
              </tr>
              <tr>
                <th>Consignee Phone:</th>
                <td>${bill.phone}</td>
              </tr>
              <tr>
                <th>Address:</th>
                <td>${bill.address}, ${bill.district}, ${bill.city}</td>
              </tr>
              <tr>
                <th>Status:</th>
                <td>${bill.statusBill}</td>
              </tr>
              <tr>
                <th>Voucher Code:</th>
                <td>
                  <c:choose>
                    <c:when test="${bill.voucherCode != null}">
                      ${bill.voucherCode}
                    </c:when>
                    <c:otherwise>
                      No voucher code provided
                    </c:otherwise>
                  </c:choose>
                </td>
              </tr>
              <tr>
                <th>Total Price:</th>
                <td><fmt:formatNumber value="${bill.totalPrice}" type="number" groupingUsed="true" /> đ</td>
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
    <%@ include file="footer.jsp"%>
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
