<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <section class="maintenance-section py-5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="card-body">
                                <h3 class="card-title">Add Maintenance</h3>

                                <!-- Maintenance Form Begin -->
                                <form action="/maintenance" method="post" class="my-4">
                                    <div class="form-group mb-3">
                                        <label for="maintenanceName">Maintenance Name</label>
                                        <input type="text" class="form-control" id="maintenanceName" placeholder="Enter maintenance name" required name="maintenanceName">
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="maintenanceDescription">Description</label>
                                        <textarea class="form-control" id="maintenanceDescription" placeholder="Enter description" required name="maintenanceDescription"></textarea>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="maintenanceDate">Date</label>
                                        <input type="date" class="form-control" id="maintenanceDate" required name="maintenanceDate" onchange="updateTimeOptions()">
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="maintenanceTime">Time Slot</label>
                                        <select class="form-control" id="maintenanceTime" required name="maintenanceTime">
                                            <!-- Time options will be updated based on the selected day -->
                                        </select>
                                    </div>
                                    <input type="hidden" class="form-control" id="userId" value="<%=user.getUserID()%>" required name="userId">
                                    <div class="form-group mb-3">
                                        <label for="productIds">Select Products</label>
                                        <select multiple class="form-control" id="productIds" name="productIds" required>
                                            <c:forEach var="product" items="${productList}">
                                                <option value="${product.productId}">${product.productName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <button type="submit" class="btn btn-primary btn-block">Add Maintenance</button>
                                </form>
                                <!-- Maintenance Form End -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
    <%@include file="footer.jsp" %>
</div>
<!-- Js Plugins -->
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<script>
    function updateTimeOptions() {
        const dateInput = document.getElementById('maintenanceDate').value;
        const maintenanceTime = document.getElementById('maintenanceTime');
        maintenanceTime.innerHTML = ''; // Clear existing options

        if (!dateInput) return; // Exit if no date is selected

        const date = new Date(dateInput);
        const dayOfWeek = date.getDay(); // Sunday - Saturday : 0 - 6

        let timeSlots = [];

        // Define time slots based on the day of the week
        switch (dayOfWeek) {
            case 1: // Monday
                timeSlots = ['07:00 - 10:00', '10:00 - 13:00'];
                break;
            case 2: // Tuesday
                timeSlots = ['09:00 - 12:00', '14:00 - 17:00'];
                break;
            case 3: // Wednesday
                timeSlots = ['08:00 - 11:00', '15:00 - 18:00'];
                break;
            case 4: // Thursday
                timeSlots = ['07:00 - 10:00', '13:00 - 16:00'];
                break;
            case 5: // Friday
                timeSlots = ['09:00 - 12:00', '13:00 - 16:00'];
                break;
            case 6: // Saturday
                timeSlots = ['10:00 - 13:00', '14:00 - 17:00'];
                break;
            case 0: // Sunday
                timeSlots = ['12:00 - 15:00'];
                break;
        }

        // Populate the maintenanceTime select with available time slots
        timeSlots.forEach(slot => {
            const option = document.createElement('option');
            option.value = slot;
            option.textContent = slot;
            maintenanceTime.appendChild(option);
        });
    }
</script>

</body>
</html>
