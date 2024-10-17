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
    <style>
        .avatar {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            cursor: pointer;
        }

        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.5);
            padding-top: 60px;
        }

        .modal-content {
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 40%;
            border-radius: 10px;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
        .profile-info-data {
            text-align: left;
            margin-top: 20px;
        }
    </style>
</head>

<body class="">
<%@include file="header.jsp" %>

<div id="wrapwrap" class="o_portal">
    <main>
        <section class="wishlist-section py-5">
            <div class="container">
                <h2 class="text-center mb-4">Your Wishlist</h2>
                <c:if test="${empty wishlistItems}">
                    <p class="text-center">Your wishlist is currently empty.</p>
                </c:if>

                <c:forEach items="${wishlistItems}" var="item">
                    <div class="wishlist-summary border rounded p-3 mb-3">
                        <div class="row align-items-center">
                            <div class="col-md-1">
                                <!-- Assuming each item has an imageURL field -->
                                <img src="${item.img}" alt="${item.productName}" class="img-fluid rounded" style="max-width: 100px; max-height: 100px;" />
                            </div>
                            <div class="col-md-5">
                                <span><strong>Product:</strong> ${item.productName}</span><br>
                                <span><strong>Price:</strong> <fmt:formatNumber value="${item.priceProduct}" type="number" groupingUsed="true"/> ₫</span>
                            </div>
                            <div class="col-md-6 text-md-end">
                                <button class="btn btn-success" onclick="addToCart(${item.productId})">Add to Cart</button>
                                <a href="/detailProduct?id=${item.productId}" class="btn btn-primary">View Product</a>
                                <button class="btn btn-danger" onclick="removeFromWishlist(${item.productId})">Remove</button>
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
<script>
    function removeFromWishlist(productId) {
        $.ajax({
            url: "/removeWishlist",
            type: "GET",
            data: { productId: productId },
            success: function (data) {
                if (data === "true") {
                    alert("Product removed from wishlist successfully.");
                    location.reload();
                } else {
                    alert("Failed to remove product from wishlist.");
                }
            }
        });
    }

    function addToCart(id) {
        $.ajax({
            url: "/addItemToCart",
            type: "post",
            data: { productId: id, quantity: 1 },
            success: function (data) {
                alert("Added to cart successfully.");
                location.reload();
            },
        });
    }
</script>
</body>



</html>
