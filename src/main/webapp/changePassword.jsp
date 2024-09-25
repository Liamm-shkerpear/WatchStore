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



<div id="wrapwrap" class="  o_portal ">
    <a class="o_skip_to_content btn btn-primary rounded-0 visually-hidden-focusable position-absolute start-0"
       href="#wrap">Bỏ qua để đến Nội dung</a>
    <%@include file="header.jsp"%>
    <main style="">


        <div id="wrap" class="o_portal_wrap">
            <div class="container pt-3 pb-5">
                <div class="o_portal_security_body w-md-75 w-lg-50 pb-5">
                    <div class="d-flex gap-2 my-3">
                        <a href="${pageContext.request.contextPath}/my" title="Quay lại" class="btn btn-light px-2"><i
                                class="oi oi-chevron-left"></i></a>
                        <h3 class="my-0">Bảo mật & Tài khoản</h3>
                    </div>
                    <section name="portal_change_password">
                        <h4>Thay đổi Mật khẩu</h4>
                        <form action="${pageContext.request.contextPath}/change-password" method="post" class="oe_reset_password_form">
                            <input type="hidden" name="csrf_token"
                                   value="66e1cc6ccd44d18d06dc174f29fa3b00ab647020o1762356655">
                            <input type="hidden" name="op" value="password">
                            <div class="mb-3">
                                <label for="current">Mật khẩu:</label>
                                <input type="password" id="current" name="oldPassword" autocomplete="current-password"
                                       required="required" class="form-control form-control-sm ">
                                <div class="invalid-feedback">

                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="newPassword">Mật khẩu mới:</label>
                                <input type="password" id="newPassword" name="newPassword" autocomplete="new-password"
                                       required="required" class="form-control form-control-sm ">
                                <div class="invalid-feedback">

                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="confirmPassword">Xác nhận mật khẩu mới:</label>
                                <input type="password" id="confirmPassword" name="confirmPassword" autocomplete="new-password"
                                       required="required" class="form-control form-control-sm ">
                                <div class="invalid-feedback">

                                </div>
                            </div>
                            <button type="submit" class="btn btn-light">Thay đổi Mật khẩu</button>
                        </form>
                    </section>

                    <section name="portal_deactivate_account">
                        <h4>Xoá tài khoản</h4>
                        <button class="btn btn-light" data-bs-toggle="modal"
                                data-bs-target="#portal_deactivate_account_modal">
                            Xoá tài khoản
                        </button>
                        <div id="portal_deactivate_account_modal" tabindex="-1" role="dialog" class="modal ">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header bg-danger">
                                        <h5 class="modal-title">Bạn có chắc chắn muốn thực hiện việc này không?</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                    </div>
                                    <form action="${pageContext.request.contextPath}/delete-account" method="post" class="modal-body"
                                          id="portal_deactivate_account_form">
                                        <div>

                                            <p class="text-muted">
                                                Vô hiệu hóa tài khoản của bạn để ngăn chặn mọi hoạt động đăng nhập
                                                tiếp theo.<br>
                                                <b>
                                                    <i class="fa fa-exclamation-triangle text-danger"></i>
                                                    Bạn không thể hoàn tác hành động này.
                                                </b>
                                            </p>
                                            <hr>
                                            <%
                                                if (user != null && user.getIdGoogle() == null) {
                                            %>
                                                <p>1. Nhập mật khẩu của bạn để xác thực bạn sở hữu tài khoản này</p>
                                                <input name="password" type="password" required="1"
                                                       placeholder="Mật khẩu" class="form-control ">
                                                <hr>
                                                <p>
                                                    2. Xác nhận bạn muốn xoá tài khoản của mình bằng cách
                                                    sao chép email của bạn (<%= user.getEmail() %>).
                                                </p>
                                            <%
                                                } else {
                                            %>
                                                Xác nhận bạn muốn xoá tài khoản của mình bằng cách
                                                sao chép email của bạn (<%= user.getEmail() %>).
                                            <%
                                                }
                                            %>

                                            <input name="email" type="email" required="1" class="form-control" placeholder="Email">

                                        </div>
                                        <input type="hidden" name="csrf_token"
                                               value="66e1cc6ccd44d18d06dc174f29fa3b00ab647020o1762356655">
                                    </form>
                                    <div class="modal-footer justify-content-start">
                                        <input type="submit" class="btn btn-danger"
                                               form="portal_deactivate_account_form" value="Delete Account">
                                        <button type="button" class="btn" data-bs-dismiss="modal">
                                            Hủy
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
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