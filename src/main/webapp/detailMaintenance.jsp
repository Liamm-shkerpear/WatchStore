<%@ page isELIgnored="false" %>
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
<!-- Header Section Begin -->
<%@ include file="header.jsp" %>
<!-- Header End -->

<!-- Maintenance Details Section Begin -->
<section class="profile-section">
  <div class="container">
    <div class="row">
      <div class="col-lg-8 offset-lg-2">
        <div class="profile-card text-center">
          <h3>Maintenance Details</h3>
          <div class="table-responsive">
            <table class="table table-bordered">
              <tbody>
              <tr>
                <th>Name</th>
                <td>${maintenance.maintenanceName}</td>
              </tr>
              <tr>
                <th>Description</th>
                <td>${maintenance.maintenanceDescription}</td>
              </tr>
              <tr>
                <th>Date</th>
                <td>${maintenance.maintenanceDate}</td>
              </tr>
              <tr>
                <th>Time</th>
                <td>${maintenance.maintenanceTime}</td>
              </tr>
              <tr>
                <th>Status</th>
                <td>
                  <c:choose>
                    <c:when test="${maintenance.maintenanceStatus}">Đã hoàn thành</c:when>
                    <c:otherwise>Đang bảo hành</c:otherwise>
                  </c:choose>
                </td>
              </tr>


              <tr>
                <th>Expected Return Date</th>
                <td>${maintenance.expectedReturnDate}</td>
              </tr>
              </tbody>
            </table>
          </div>
          <a href="editMaintain?maintenanceId=${maintenance.maintenanceId}" class="btn btn-primary mt-3">Edit Maintenance</a>
        </div>

        <!-- Shop Contact Information -->
        <div class="profile-info mt-4">
          <h5>Contact Information</h5>
          <table class="table table-bordered">
            <tbody>
            <tr>
              <th>Shop Name</th>
              <td>FPT Shop</td>
            </tr>
            <tr>
              <th>Phone</th>
              <td>0123.456.789</td>
            </tr>
            <tr>
              <th>Email</th>
              <td>fptshop@gmail.com</td>
            </tr>
            <tr>
              <th>Address</th>
              <td>Đà Nẵng</td>
            </tr>
            </tbody>
          </table>
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
      </div>
    </div>
  </div>
</section>
<!-- Maintenance Details Section End -->

<%@ include file="footer.jsp" %>
<!-- Js Plugins -->
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
