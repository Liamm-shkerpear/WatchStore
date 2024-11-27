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

<body class="">
<%@include file="header.jsp" %>

<div id="wrapwrap" class="o_portal">
    <main>
        <section class="wishlist-section py-5">
            <div class="container">
                <h2 class="text-center mb-4">Your List Maintenance</h2>
                <c:if test="${empty maintenanceList}">
                    <p class="text-center">Your Maintenance List is Empty</p>
                </c:if>

                <c:forEach items="${maintenanceList}" var="item">
                    <div class="card mb-3">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-8">
                                    <span><strong>Tên phiếu bảo hành:</strong> ${item.maintenanceName}</span><br>
                                    <span><strong>Mô tả:</strong> ${item.maintenanceDescription}</span><br>
                                    <span><strong>Ngày khách hàng muốn nhận hàng:</strong> ${item.maintenanceDate}</span><br>
                                    <span><strong>Ngày trả sản phẩm dự kiến:</strong> ${item.expectedReturnDate}</span><br>
                                    <span><strong>Trạng thái:</strong>
                                        <c:if test="${item.cancel == false}">
                                            <c:if test="${item.maintenanceStatus}">
                                                Đã hoàn thành
                                            </c:if>
                                            <c:if test="${item.maintenanceStatus == false}">
                                                Sản phẩm đang được bảo hành
                                            </c:if>
                                        </c:if>
                                        <c:if test="${item.cancel}">
                                            Đơn bảo hành đã bị hủy
                                        </c:if>
                                    </span>
                                </div>
                                <div class="col-md-4 text-md-end">
                                    <a href="/detailMaintain?id=${item.maintenanceId}" class="btn btn-primary">View Detail</a>
                                    <c:if test="${item.maintenanceStatus == false && item.cancel == false}">
                                        <a href="/cancelMaintenance?id=${item.maintenanceId}" class="btn btn-danger">Cancel</a>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </section>
    </main>
    <%@include file="footer.jsp" %>
</div>

<!-- Optional JavaScript -->
<script src="/web/assets/web.assets_frontend_minimal.min.js" defer></script>
<script src="/web/assets/web.assets_frontend_lazy.min.js" data-src="" defer></script>
<!-- Additional Scripts if needed -->
<script src="/assets/js/bootstrap.min.js"></script>
<script src="/assets/js/owl.carousel.min.js"></script>
<script src="/assets/js/slick.min.js"></script>
<!-- fancybox -->
<script src="/assets/js/jquery.fancybox.min.js"></script>
<script src="/assets/js/custom.js"></script>
</body>


</html>
