<%-- THẻ này để bật EL trong JSP --%>
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



<div id="wrapwrap" class="  o_portal ">
    <a class="o_skip_to_content btn btn-primary rounded-0 visually-hidden-focusable position-absolute start-0"
       href="#wrap">Bỏ qua để đến Nội dung</a>
    <%@ include file="header.jsp"%>
    <main style="">


        <div class="o_portal container mt-3">
            <div class="d-flex justify-content-between align-items-center flex-wrap">
                <ol class="o_portal_submenu breadcrumb mb-0 flex-grow-1 px-0">
                    <li class="breadcrumb-item ms-1"><a href="${pageContext.request.contextPath}/my" aria-label="Trang chủ" title="Trang chủ"><i
                            class="fa fa-home"></i></a></li>
                    <li class="breadcrumb-item">Chi tiết</li>
                </ol>
            </div>
        </div>
        <div id="wrap" class="o_portal_wrap">
            <div class="container pt-3 pb-5">
                <img src="<%= user.getAvatar() %>" alt="Avatar" class="avatar" id="avatar">

                <form action="${pageContext.request.contextPath}/profile" method="post">
                    <div class="row o_portal_details">
                        <div class="col-lg-8">
                            <div class="row">
                                <input type="hidden" name="csrf_token"
                                       value="db2d95e13da50a796242d30f39aa1dbe03adb1d5o1762354390">
                                <div class="mb-3  col-xl-6">
                                    <label class="col-form-label" for="username">Họ và tên</label>
                                    <input id="username" type="text" name="name" class="form-control " value="<%= user.getName() %>">
                                </div>

                                <div class="mb-3  col-xl-6">
                                    <label class="col-form-label" for="userDOB">Ngày sinh</label>
                                    <input id="userDOB" type="date" name="userDOB" class="form-control " value="<%= user.getUserDOB() %>">
                                </div>

                                <div class="mb-3  col-xl-6" >
                                    <label class="col-form-label label-optional" for="gender">Giới tính</label>
                                    <select id="gender" name="gender" class="form-select ">
                                        <option value="male" <%= user.isGender() ? "selected" : "" %> >Nam</option>
                                        <option value="female" <%=!user.isGender() ? "selected" : ""%> >Nữ</option>
                                    </select>
                                </div>

                                <div class="clearfix"></div>

                                <div class="mb-3  col-xl-6">
                                    <label class="col-form-label" for="email">Email</label>
                                    <input id="email" type="email" name="email" class="form-control "
                                           value="<%= user.getEmail() %>" readonly>
                                </div>

                                <div class="mb-3  col-xl-6">
                                    <label class="col-form-label" for="phone">Điện thoại</label>
                                    <input id="phone" type="tel" name="phoneNumber" class="form-control" value="<%= user.getPhoneNumber() != null ? user.getPhoneNumber() : "" %>">
                                </div>



                                <div class="clearfix"></div>
                                <div class="mb-3  col-xl-6">
                                    <label class="col-form-label" for="address">Địa chỉ</label>
                                    <input id="address" type="text" name="address" class="form-control" value="<%= user.getAddress() != null ? user.getAddress() : "" %>">
                                </div>




                                <div class="col-12 d-none d-xl-block">
                                    <small class="form-text text-muted">
                                        Hãy cho chúng tôi biết một số thông tin thú vị về bản thân bạn để chúng tôi có
                                        thể phục vụ bạn tốt hơn nhé!
                                    </small>
                                </div>
                                <div class="row m-0 p-0">
                                    <label class="col-form-label" for="description">Mô tả</label>

                                    <textarea id="description" class="col-12 form-control" name="description" rows="3"><%= user.getDescription() != null ? user.getDescription() : "" %></textarea>
                                </div>
                                <input type="hidden" name="redirect">
                            </div>
                            <div class="clearfix text-end mb-5">
                                <a href="${pageContext.request.contextPath}/my" class="btn btn-light me-2">
                                    Huỷ bỏ
                                </a>
                                <button type="submit" class="btn btn-primary float-end">
                                    Lưu
                                </button>
                            </div>
                        </div>
                    </div>
                </form>

            </div>
        </div>

        <div id="o_shared_blocks" class="oe_unremovable"></div>
        <%@ include file="footer.jsp"%>
    </main>
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
<div id="avatarModal" class="modal">
    <div class="modal-content">
        <span class="close" id="closeModal">&times;</span>
        <h4>Change Avatar</h4>
        <form method="post" action="/change-avatar" enctype="multipart/form-data">
            <div class="form-group">
                <label for="avatarUpload">Upload New Avatar</label>
                <input type="file" class="form-control-file" id="avatarUpload" name="avatarFile">
            </div>
            <button type="submit" class="btn btn-primary">Upload</button>
        </form>
    </div>
</div>
<script>
    const avatar = document.getElementById('avatar');
    const avatarModal = document.getElementById('avatarModal');
    const closeModal = document.getElementById('closeModal');

    avatar.addEventListener('click', function () {
        avatarModal.style.display = 'block';
    });

    closeModal.addEventListener('click', function () {
        avatarModal.style.display = 'none';
    });

    window.onclick = function (event) {
        if (event.target === avatarModal) {
            avatarModal.style.display = 'none';
        }
    };
</script>
</body>

</html>