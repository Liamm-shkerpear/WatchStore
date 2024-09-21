<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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



<div id="wrapwrap" class="   ">
    <a class="o_skip_to_content btn btn-primary rounded-0 visually-hidden-focusable position-absolute start-0"
       href="#wrap">Bỏ qua để đến Nội dung</a>
    <%@ include file="header.jsp"%>
    <main>

        <div class="oe_website_login_container">
            <owl-component name="web.user_switch"></owl-component>
            <form role="form" method="post"
                  class="oe_login_form" action="${pageContext.request.contextPath}/login">
                <input type="hidden" name="csrf_token" value="69869b278cc94c0869ba37052f4488ec8f632ac8o1762350641">


                <div class="mb-3 field-login">
                    <label for="login" class="form-label d-flex justify-content-between">Email</label>
                    <input type="text" placeholder="Email" name="email" id="login" class="form-control"
                           required="required" autocapitalize="off" autocomplete="username">
                </div>

                <div class="mb-3">
                    <label for="password" class="form-label d-flex justify-content-between">Mật khẩu
                        <a class="btn btn-link btn-sm" tabindex="1" href="${pageContext.request.contextPath}/forgotPassword">Đặt lại mật
                            khẩu</a></label>
                    <input type="password" placeholder="Mật khẩu" name="password" id="password" class="form-control"
                           required="required" autocomplete="current-password" maxlength="4096">
                </div>


                <div class="oe_login_buttons text-center gap-1 d-grid mb-1 pt-3">
                    <button type="submit" class="btn btn-primary">Đăng nhập</button>
                    <div class="o_login_auth"></div>
                </div>
                <p class="mt-2 text-center">
                    <a class="btn btn-link btn-sm" href="${pageContext.request.contextPath}/register">Bạn chưa có tài khoản?</a>
                </p>
                <div class="social-login--facebooks">
                    <p class="a-center">
                        hoặc đăng nhập bằng
                    </p>
                    <%--                                <a href="/auth/google" class="social-login--facebook" ><img width="129px" height="37px" alt="facebook-login-button" src="//bizweb.dktcdn.net/assets/admin/images/login/fb-btn.svg"></a>--%>
                    <a href="${pageContext.request.contextPath}/auth/google" class="social-login--google"><img width="129px" height="37px" alt="google-login-button" src="//bizweb.dktcdn.net/assets/admin/images/login/gp-btn.svg"></a>
                </div>
                <input type="hidden" name="type" value="password">
                <input type="hidden" name="redirect">
            </form>
        </div>

        <div id="o_shared_blocks" class="oe_unremovable"></div>

    </main>
    <%@ include file="footer.jsp"%>
</div>


<div class="o-main-components-container">
    <div class="o-overlay-container"></div>
    <div></div>
    <div class="o_notification_manager o_upload_progress_toast"></div>
    <div class="o_notification_manager"></div>
    <div class="position-absolute w-100 h-100 top-0 pe-none">
        <div class="d-flex flex-column container align-items-end"></div>
    </div>
</div>
</body>

</html>