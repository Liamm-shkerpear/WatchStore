<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.Product" %>
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
  <style>
    .product-card {
      margin-bottom: 20px;
    }
    .product-img {
      overflow: hidden;
    }
    .product-img img {
      width: 100%;
      /*height: auto;*/
      transition: transform 0.2s ease-in-out;
    }
    .product-img:hover img {
      transform: scale(1.1);
    }
    .features-table th, .features-table td {
      padding: 10px;
      border: 1px solid #e0e0e0;
    }
  </style>
</head>
<body>
<%@ include file="header.jsp"%>
<div class="container mt-5">
  <h2 class="mb-4 text-center">Product Comparison</h2>
  <div class="row justify-content-center">
    <c:forEach var="product" items="${products}" varStatus="status">
      <div class="col-md-6">
        <div class="card product-card">
          <div class="product-img">
            <img src="${product.img}" alt="${product.productName}">
          </div>
          <div class="card-body">
            <a href="/detailProduct?id=${product.productId}" class="card-title">${product.productName}</a>
            <p class="card-text"><strong>Price:</strong> <fmt:formatNumber value="${product.priceProduct}" type="currency" currencySymbol="₫" /></p>
            <p class="card-text"><strong>Description:</strong> ${product.describeProduct}</p>
          </div>
        </div>
      </div>
      <c:if test="${not status.last}">
        <div class="col-md-12 text-center my-4">
          <h4>VS</h4>
        </div>
      </c:if>
    </c:forEach>
  </div>
  <div class="row">
    <div class="col-12">
      <h3 class="mt-5 mb-3 text-center">Feature Comparison</h3>
      <table class="table features-table">
        <thead>
        <tr>
          <th>Feature</th>
          <c:forEach items="${products}" var="product">
            <th>${product.productName}</th>
          </c:forEach>
        </tr>
        </thead>
        <tbody>
        <tr>
          <th>Price</th>
          <c:forEach items="${products}" var="product">
            <td><fmt:formatNumber value="${product.priceProduct}" type="currency" currencySymbol="₫" /></td>
          </c:forEach>
        </tr>
        <tr>
          <th>Thương hiệu</th>
          <c:forEach items="${products}" var="product">
            <td>${product.trademarkName}</td>
          </c:forEach>
        </tr>
        <tr>
          <th>Loại sản phẩm</th>
          <c:forEach items="${products}" var="product">
            <td>${product.productTypeName}</td>
          </c:forEach>
        </tr>
        <tr>
          <th>Kích thước</th>
          <c:forEach items="${products}" var="product">
            <td>${product.sizeName}</td>
          </c:forEach>
        </tr>
        <tr>
          <th>Description</th>
          <c:forEach items="${products}" var="product">
            <td>${product.describeProduct}</td>
          </c:forEach>
        </tr>

        </tbody>
      </table>
    </div>
  </div>
</div>
<%@ include file="footer.jsp"%>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
