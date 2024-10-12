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
    <a class="o_skip_to_content btn btn-primary rounded-0 visually-hidden-focusable position-absolute start-0" href="#wrap">Bỏ qua để đến Nội dung</a>
    <%@ include file="header.jsp"%>
    <main>

        <div class="oe_website_login_container">
            <form action="${pageContext.request.contextPath}/register" class="oe_signup_form" role="form" method="post">
                <input type="hidden" name="csrf_token" value="eb64c39e92d443953d05c4ad858ddff1eea73a3eo1762350702">

                <div class="mb-3 field-login">
                    <label for="username">Họ và tên</label>
                    <input type="text" name="username" id="username" class="form-control form-control-sm" autofocus="autofocus" autocapitalize="off" required="required">
                </div>

                <div class="mb-3 field-login">
                    <label for="login">Email</label>
                    <input type="text" name="email" id="login" class="form-control form-control-sm" autofocus="autofocus" autocapitalize="off" required="required">
                </div>

                <div class="mb-3 field-password pt-2">
                    <label for="password">Mật khẩu</label>
                    <input type="password" name="password" id="password" class="form-control form-control-sm" required="required">
                </div>

                <div class="mb-3 field-confirm_password">
                    <label for="confirm-password">Xác nhận mật khẩu</label>
                    <input type="password" name="confirm-password" id="confirm-password" class="form-control form-control-sm" required="required">
                </div>

                <div class="mb-3 field-name">
                    <label for="phone">Số điện thoại</label>
                    <input type="text" name="phone" id="phone" class="form-control form-control-sm" required="required">
                </div>

                <div class="mb-3 field-name">
                    <label for="dob">Ngày sinh</label>
                    <input type="date" name="dob" id="dob" class="form-control form-control-sm" required="required">
                </div>

                <div class="mb-3 field-name">
                    <label for="gender">Giới tính</label>
                    <select name="gender" id="gender" class="form-control form-control-sm">
                        <option value="male">Nam</option>
                        <option value="female">Nữ</option>
                    </select>
                </div>


                <input type="hidden" name="redirect">
                <input type="hidden" name="token">
                <div class="text-center oe_login_buttons d-grid pt-3">
                    <button type="submit" class="btn btn-primary"> Đăng ký</button>
                    <a class="btn btn-link btn-sm" role="button" href="${pageContext.request.contextPath}/login">Bạn đã có tài khoản?</a>
                    <div class="o_login_auth"></div>
                </div>
            </form>
        </div>

        <div id="o_shared_blocks" class="oe_unremovable"></div>
        </main>
    <%@ include file="footer.jsp"%>
</div>


<div class="o-main-components-container"><div class="o-overlay-container"></div><div></div><div class="o_notification_manager o_upload_progress_toast"></div><div class="o_notification_manager"></div><div class="position-absolute w-100 h-100 top-0 pe-none"><div class="d-flex flex-column container align-items-end"></div></div></div></body><div id="eJOY__extension_ai_adv_root" class="eJOY__extension_ai_adv_root_class"><div class="wrapperAiAssEjoy"><div class="containerSumEjoyIcon containerSumEjoyIconShow"><div class="viewIconEjoy gl-tooltip-ejoy gl-tooltip-ejoy-left" tooltip-data="eJOY AI Assistant"><div class="viewIconEjoyItem"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="26" viewBox="0 0 24 26" fill="none"><mask id="mask0_427_34" maskUnits="userSpaceOnUse" x="16" y="3" width="8" height="8" style="mask-type: luminance;"><path d="M24 3H16V11H24V3Z" fill="white"></path></mask><g mask="url(#mask0_427_34)"><path d="M23.8012 7.00309L21.0136 8.01539L20.0012 10.8031L18.9889 8.01539L16.2012 7.00309L18.9889 5.9908L20.0012 3.20309L21.0136 5.9908L23.8012 7.00309Z" fill="url(#paint0_linear_427_34)"></path></g><mask id="mask1_427_34" maskUnits="userSpaceOnUse" x="0" y="10" width="6" height="6" style="mask-type: luminance;"><path d="M6 10H0V16H6V10Z" fill="white"></path></mask><g mask="url(#mask1_427_34)"><path d="M5.8494 13.0023L3.7587 13.7616L2.9994 15.8523L2.2402 13.7616L0.149399 13.0023L2.2402 12.2431L2.9994 10.1523L3.7587 12.2431L5.8494 13.0023Z" fill="url(#paint1_linear_427_34)"></path></g><mask id="mask2_427_34" maskUnits="userSpaceOnUse" x="16" y="20" width="4" height="4" style="mask-type: luminance;"><path d="M20 20H16V24H20V20Z" fill="white"></path></mask><g mask="url(#mask2_427_34)"><path d="M19.8996 22.0016L18.5058 22.5077L17.9996 23.9016L17.4934 22.5077L16.0996 22.0016L17.4934 21.4954L17.9996 20.1016L18.5058 21.4954L19.8996 22.0016Z" fill="url(#paint2_linear_427_34)"></path></g><g filter="url(#filter0_d_427_34)"><path fill-rule="evenodd" clip-rule="evenodd" d="M11.8671 20.3327C14.8098 20.2537 16.4674 18.0538 16.368 15.5257C15.9553 11.8147 11.5502 10.6201 13.3135 5.666C9.7712 8.7188 7.228 12.6272 7.3363 15.408C7.3847 18.1053 8.9455 20.3327 11.8671 20.3327ZM14.5512 16.5696C15.0045 16.5696 15.3306 16.2001 15.3719 15.7489C15.4799 15.431 15.3719 13.9738 14.2947 13.0395C14.4695 14.2529 13.6329 15.261 13.7305 15.7489C13.7305 16.2022 14.0979 16.5696 14.5512 16.5696Z" fill="#1DA1F2"></path></g><defs><filter id="filter0_d_427_34" x="2.47583" y="0.80886" width="18.7535" height="24.381" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB"><feFlood flood-opacity="0" result="BackgroundImageFix"></feFlood><feColorMatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0" result="hardAlpha"></feColorMatrix><feOffset></feOffset><feGaussianBlur stdDeviation="2.42857"></feGaussianBlur><feColorMatrix type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.12 0"></feColorMatrix><feBlend mode="normal" in2="BackgroundImageFix" result="effect1_dropShadow_427_34"></feBlend><feBlend mode="normal" in="SourceGraphic" in2="effect1_dropShadow_427_34" result="shape"></feBlend></filter><linearGradient id="paint0_linear_427_34" x1="20.0012" y1="3.20309" x2="20.0012" y2="10.8031" gradientUnits="userSpaceOnUse"><stop stop-color="#1DA1F2"></stop><stop offset="1" stop-color="#6CD2FF"></stop></linearGradient><linearGradient id="paint1_linear_427_34" x1="2.9994" y1="10.1523" x2="2.9994" y2="15.8523" gradientUnits="userSpaceOnUse"><stop stop-color="#1DA1F2"></stop><stop offset="1" stop-color="#6CD2FF"></stop></linearGradient><linearGradient id="paint2_linear_427_34" x1="17.9996" y1="20.1016" x2="17.9996" y2="23.9016" gradientUnits="userSpaceOnUse"><stop stop-color="#1DA1F2"></stop><stop offset="1" stop-color="#6CD2FF"></stop></linearGradient></defs></svg></div><div class="moveIconEjoyAi"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" fill="none"><path fill-rule="evenodd" clip-rule="evenodd" d="M5.45139 0.667969C4.64931 0.667969 4 1.31727 4 2.11936C4 2.92144 4.64931 3.57075 5.45139 3.57075C6.25347 3.57075 6.90278 2.92144 6.90278 2.11936C6.90278 1.31727 6.25347 0.667969 5.45139 0.667969ZM4 8.00868C4 7.2066 4.64931 6.55729 5.45139 6.55729C6.25347 6.55729 6.90278 7.2066 6.90278 8.00868C6.90278 8.81076 6.25347 9.46007 5.45139 9.46007C4.64931 9.46007 4 8.81076 4 8.00868ZM4 13.8837C4 13.0816 4.64931 12.4323 5.45139 12.4323C6.25347 12.4323 6.90278 13.0816 6.90278 13.8837C6.90278 14.6858 6.25347 15.3351 5.45139 15.3351C4.64931 15.3351 4 14.6858 4 13.8837Z" fill="#666666"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M10.7854 0.667969C9.98329 0.667969 9.33398 1.31727 9.33398 2.11936C9.33398 2.92144 9.98329 3.57075 10.7854 3.57075C11.5875 3.57075 12.2368 2.92144 12.2368 2.11936C12.2368 1.31727 11.5875 0.667969 10.7854 0.667969ZM9.33398 8.00868C9.33398 7.2066 9.98329 6.55729 10.7854 6.55729C11.5875 6.55729 12.2368 7.2066 12.2368 8.00868C12.2368 8.81076 11.5875 9.46007 10.7854 9.46007C9.98329 9.46007 9.33398 8.81076 9.33398 8.00868ZM9.33398 13.8837C9.33398 13.0816 9.98329 12.4323 10.7854 12.4323C11.5875 12.4323 12.2368 13.0816 12.2368 13.8837C12.2368 14.6858 11.5875 15.3351 10.7854 15.3351C9.98329 15.3351 9.33398 14.6858 9.33398 13.8837Z" fill="#666666"></path></svg></div></div><div class="viewCloseIconEjoy"><svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12" fill="none"><circle cx="6" cy="6" r="6" fill="black" fill-opacity="0.25"></circle><path fill-rule="evenodd" clip-rule="evenodd" d="M8.71289 3.58672C8.87135 3.74518 8.87135 4.00209 8.71289 4.16054L6.72363 6.14981L8.71289 8.13907C8.87135 8.29752 8.87135 8.55444 8.71289 8.71289C8.55444 8.87135 8.29752 8.87135 8.13907 8.71289L6.14981 6.72363L4.16054 8.71289C4.00209 8.87135 3.74518 8.87135 3.58672 8.71289C3.42826 8.55443 3.42826 8.29752 3.58672 8.13907L5.57598 6.14981L3.58672 4.16054C3.42826 4.00209 3.42826 3.74518 3.58672 3.58672C3.74518 3.42826 4.00209 3.42826 4.16054 3.58672L6.14981 5.57598L8.13907 3.58672C8.29752 3.42826 8.55444 3.42826 8.71289 3.58672Z" fill="white"></path></svg></div></div><div class="eJOY__container "><div class="btnReportClose"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" fill="none"><path fill-rule="evenodd" clip-rule="evenodd" d="M14.0291 2.63758C14.3812 2.98971 14.3812 3.56062 14.0291 3.91275L9.6085 8.33333L14.0291 12.7539C14.3812 13.106 14.3812 13.677 14.0291 14.0291C13.677 14.3812 13.106 14.3812 12.7539 14.0291L8.33333 9.6085L3.91275 14.0291C3.56062 14.3812 2.98971 14.3812 2.63758 14.0291C2.28546 13.677 2.28546 13.106 2.63758 12.7539L7.05817 8.33333L2.63758 3.91275C2.28546 3.56062 2.28546 2.98971 2.63758 2.63758C2.98971 2.28546 3.56062 2.28546 3.91275 2.63758L8.33333 7.05817L12.7539 2.63758C13.106 2.28546 13.677 2.28546 14.0291 2.63758Z" fill="#B3B3B3"></path></svg></div></div></div></div><div id="eJOY__extension_root" class="eJOY__extension_root_class" style="all: unset;"></div></html>