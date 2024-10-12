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
  <link rel="stylesheet" type="text/css" href="/assets/css/bootstrap.min.css">

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
<!-- Include header -->
<%@ include file="header.jsp" %>

<div class="container mt-5" style="margin-top: 120px !important;">
  <h2>Search Results for "<c:out value="${keyword}"/>"</h2>
  <div class="row">
    <c:if test="${empty listP}">
      <div class="col-12">
        <p class="text-center">No products found</p>
      </div>
    </c:if>
    <c:forEach var="product" items="${listP}">
      <div class="col-md-4 col-sm-6 mb-4">
        <div class="healthy-product card">
          <div class="healthy-product-img card-img-top">
            <img src="${product.img}" alt="${product.productName}" style="width: 100%; height: 255px; object-fit: cover;">

          </div>
          <div class="card-body">
            <span class="text-muted">${product.productTypeName}</span><br>
            <a href="/detailProduct?id=${product.productId}" class="stretched-link card-title">${product.productName}</a>
            <h6><fmt:formatNumber value="${product.priceProduct}" type="number" groupingUsed="true" /> ₫</h6>
          </div>
        </div>
      </div>
    </c:forEach>
  </div>
</div>

<!-- Include footer -->
<%@ include file="footer.jsp" %>

<script>
  function addToCart(id) {
    $.ajax({
      url: "/addItemToCart",
      type: "post",
      data: { productId: id, quantity: 1 },
      success: function (data) {
        alert("Added to cart successfully");
        location.reload();
      },
    });
  }
</script>
</body>
</html>

