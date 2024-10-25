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
  <%@ include file="header.jsp"%>

  <main>


    <div id="wrap" class="o_portal_wrap">
      <div class="container pt-3 pb-5">
        <div class="wrapper col-12 d-flex flex-wrap justify-content-between align-items-center">
          <h3 class="my-3">Tài khoản của tôi</h3>
          <button class="btn py-0 d-flex align-items-center gap-2 d-lg-none ms-auto"
                  data-bs-toggle="offcanvas" data-bs-target="#accountOffCanvas">
            <img class="o_avatar rounded" alt="Liên hệ"
                 src="data:image/png;base64,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"
                 loading="lazy" style="">
          </button>
        </div>
        <div class="row justify-content-between">
          <div class="o_portal_content col-12 col-lg-8 mb-5">

            <div class="o_portal_my_home">
              <div class="oe_structure" id="oe_structure_portal_my_home_1"></div>
              <div class="o_portal_docs row g-2">
                <div class="o_portal_category row g-2 mt-3" id="portal_alert_category">
                  <div class="o_portal_index_card d-none col-12 order-0">
                    <a href="/my/invoices?filterby=overdue_invoices"
                       title="Hoá đơn cần thanh toán"
                       class="d-flex gap-2 gap-md-3 py-3 pe-2 px-md-3 h-100 rounded text-decoration-none alert alert-primary align-items-center">
                      <div class="alert-link">
                        <div class="mt-0 mb-1 fs-5 fw-normal lh-1 d-flex gap-2">

                                                        <span class="fw-bold"
                                                              data-placeholder_count="overdue_invoice_count">0</span>
                          <span>Hoá đơn cần thanh toán</span>
                        </div>
                        <div class="opacity-75">

                        </div>
                      </div>
                      <button
                              onclick="event.preventDefault(); window.location.href='/my/invoices/overdue'"
                              class="btn btn-secondary ms-auto">
                        Thanh toán ngay
                      </button>
                    </a>
                  </div>
                  <div class="o_portal_index_card d-none col-12 order-0">
                    <a href="/my/quotes" title="Báo giá cần xem xét"
                       class="d-flex gap-2 gap-md-3 py-3 pe-2 px-md-3 h-100 rounded text-decoration-none alert alert-primary align-items-center">
                      <div class="alert-link">
                        <div class="mt-0 mb-1 fs-5 fw-normal lh-1 d-flex gap-2">

                                                        <span class="fw-bold"
                                                              data-placeholder_count="quotation_count">0</span>
                          <span>Báo giá cần xem xét</span>
                        </div>
                        <div class="opacity-75">

                        </div>
                      </div>
                    </a>
                  </div>
                  <div class="o_portal_index_card d-none col-12 order-0">
                    <a href="/my/signatures" title="Tài liệu cần ký"
                       class="d-flex gap-2 gap-md-3 py-3 pe-2 px-md-3 h-100 rounded text-decoration-none alert alert-primary align-items-center">
                      <div class="alert-link">
                        <div class="mt-0 mb-1 fs-5 fw-normal lh-1 d-flex gap-2">

                                                        <span class="fw-bold"
                                                              data-placeholder_count="to_sign_count">0</span>
                          <span>Tài liệu cần ký</span>
                        </div>
                        <div class="opacity-75">

                        </div>
                      </div>
                    </a>
                  </div>
                </div>
                <div class="o_portal_category row g-2 mt-3" id="portal_client_category">
                  <div class="o_portal_index_card d-none col-md-6 order-2">
                    <a href="/my/appointments" title="Lịch hẹn"
                       class="d-flex gap-2 gap-md-3 py-3 pe-2 px-md-3 h-100 rounded text-decoration-none bg-100">
                      <div class="o_portal_icon d-block align-self-start">
                        <img src="/appointment/static/src/img/calendar.svg" loading="lazy"
                             data-lazy-loading-initial-min-height=""
                             style="min-height: 1px;">
                      </div>
                      <div class="">
                        <div class="mt-0 mb-1 fs-5 fw-normal lh-1 d-flex gap-2">

                                                        <span class="d-none"
                                                              data-placeholder_count="appointment_count">0</span>
                          <span>Lịch hẹn</span>
                        </div>
                        <div class="opacity-75">
                          Theo dõi, lên lịch lại hoặc hủy các lịch hẹn của bạn
                        </div>
                      </div>
                    </a>
                  </div>
                  <div class="o_portal_index_card col-md-6 order-2">
                    <a href="${pageContext.request.contextPath}/orderHistory" title="Đơn hàng của bạn"
                       class="d-flex gap-2 gap-md-3 py-3 pe-2 px-md-3 h-100 rounded text-decoration-none bg-100">
                      <div class="o_portal_icon d-block align-self-start">
                        <img src="${pageContext.request.contextPath}/account/static/src/img/bag.svg" loading="lazy" style="">
                      </div>
                      <div class="">
                        <div class="mt-0 mb-1 fs-5 fw-normal lh-1 d-flex gap-2">

                                                        <span class="d-none"
                                                              data-placeholder_count="order_count">0</span>
                          <span>Đơn hàng của bạn</span>
                        </div>
                        <div class="opacity-75">
                          Theo dõi, xem hoặc thanh toán đơn hàng của bạn
                        </div>
                      </div>
                    </a>
                  </div>
                  <div class="o_portal_index_card col-md-6 order-2">
                    <a href="${pageContext.request.contextPath}/wishlist" title="Danh sách sản phẩm yêu thích"
                       class="d-flex gap-2 gap-md-3 py-3 pe-2 px-md-3 h-100 rounded text-decoration-none bg-100">
                      <div class="o_portal_icon d-block align-self-start">
                        <img src="/account/static/src/img/Bill.svg" loading="lazy" style="">
                      </div>
                      <div class="">
                        <div class="mt-0 mb-1 fs-5 fw-normal lh-1 d-flex gap-2">

                                                        <span class="d-none"
                                                              data-placeholder_count="invoice_count">0</span>
                          <span>Danh sách sản phẩm yêu thích</span>
                        </div>
                        <div class="opacity-75">
                          Theo dõi danh sách các sản phẩm yêu thích của bạn
                        </div>
                      </div>
                    </a>
                  </div>
                  <div class="o_portal_index_card col-md-6 order-2">
                    <a href="/maintain" title="Danh sách bảo hành"
                       class="d-flex gap-2 gap-md-3 py-3 pe-2 px-md-3 h-100 rounded text-decoration-none bg-100">
                      <div class="o_portal_icon d-block align-self-start">
                        <img src="${pageContext.request.contextPath}/account/static/src/img/rfq.svg" loading="lazy"
                             data-lazy-loading-initial-min-height=""
                             style="min-height: 1px;">
                      </div>
                      <div class="">
                        <div class="mt-0 mb-1 fs-5 fw-normal lh-1 d-flex gap-2">

                                                        <span class="d-none"
                                                              data-placeholder_count="sign_count">0</span>
                          <span>Danh sách bảo hành</span>
                        </div>
                        <div class="opacity-75">
                          Theo dõi các phiếu bảo hành của bạn
                        </div>
                      </div>
                    </a>
                  </div>
                </div>
                <div class="o_portal_category row g-2 mt-3" id="portal_service_category">
                  <div class="o_portal_index_card d-none col-md-6 order-2">
                    <a href="/my/projects" title="Dự án"
                       class="d-flex gap-2 gap-md-3 py-3 pe-2 px-md-3 h-100 rounded text-decoration-none bg-100">
                      <div class="o_portal_icon d-block align-self-start">
                        <img src="/web/static/img/folder.svg" loading="lazy"
                             data-lazy-loading-initial-min-height=""
                             style="min-height: 1px;">
                      </div>
                      <div class="">
                        <div class="mt-0 mb-1 fs-5 fw-normal lh-1 d-flex gap-2">

                                                        <span class="d-none"
                                                              data-placeholder_count="project_count">0</span>
                          <span>Dự án</span>
                        </div>
                        <div class="opacity-75">
                          Theo dõi sự phát triển của dự án
                        </div>
                      </div>
                    </a>
                  </div>

                </div>
                <div class="o_portal_category row g-2 mt-3" id="portal_vendor_category">


                </div>
                <div class="o_portal_category row g-2 mt-3" id="portal_common_category">
                  <div class="o_portal_index_card col-md-6 order-2">
                    <a href="${pageContext.request.contextPath}/change-password" title="Thay đổi mật khẩu"
                       class="d-flex gap-2 gap-md-3 py-3 pe-2 px-md-3 h-100 rounded text-decoration-none bg-100">
                      <div class="o_portal_icon d-block align-self-start">
                        <img src="/account/static/src/img/portal-connection.svg"
                             loading="lazy" style="">
                      </div>
                      <div class="">
                        <div class="mt-0 mb-1 fs-5 fw-normal lh-1 ">

                          <span>Thay đổi mật khẩu</span>
                        </div>
                        <div class="opacity-75">
                          Thay đổi mật khẩu của bạn
                        </div>
                      </div>
                    </a>
                  </div>
                </div>

                <div class="o_portal_index_card d-none col-md-6 order-2">
                  <a href="/knowledge/home" title="Kiến thức"
                     class="d-flex gap-2 gap-md-3 py-3 pe-2 px-md-3 h-100 rounded text-decoration-none bg-100">
                    <div class="o_portal_icon d-block align-self-start">
                      <img src="/knowledge/static/src/img/Books.svg" loading="lazy"
                           data-lazy-loading-initial-min-height="" style="min-height: 1px;">
                    </div>
                    <div class="">
                      <div class="mt-0 mb-1 fs-5 fw-normal lh-1 d-flex gap-2">

                                                    <span class="d-none"
                                                          data-placeholder_count="knowledge_count">0</span>
                        <span>Kiến thức</span>
                      </div>
                      <div class="opacity-75">
                        Tìm tất cả các bài viết được chia sẻ với bạn
                      </div>
                    </div>
                  </a>
                </div>
              </div>
            </div>
            <div class="oe_structure" id="oe_structure_portal_my_home_2"></div>

          </div>
          <div class="d-none d-lg-flex justify-content-end col-lg-4">
            <div class="mt-3 mw-100">
              <div class="d-flex justify-content-start align-items-start gap-3 mb-4">
                <img class="o_portal_contact_img rounded o_object_fit_cover" alt="Liên hệ"
                     width="50"
                     src="<%= user.getAvatar() %>"
                     loading="lazy" style="">
                <div class="d-flex flex-column justify-content-center">
                  <h5 class="mb-0"><%= user.getName() %></h5>

                </div>
              </div>
              <div class="o_portal_my_details">
                <div>
                  <address class="o_portal_address mb-0">
                    <div class="gap-2" itemscope="itemscope"
                         itemtype="http://schema.org/PostalAddress">

                      <div class="d-flex align-items-baseline gap-1"><i
                              class="fa fa-envelope fa-fw" role="img" aria-label="Email"
                              title="Email"></i> <span class="text-break w-100"
                                                       itemprop="email"><%= user.getEmail() %></span></div>
                    </div>
                  </address>
                </div>
              </div>
              <a role="button" href="${pageContext.request.contextPath}/profile" class="btn btn-link p-0 mt-3"><i
                      class="fa fa-pencil"></i> Chỉnh sửa thông tin</a>
            </div>
          </div>
          <div class="offcanvas offcanvas-start d-lg-none" id="accountOffCanvas">
            <div class="offcanvas-header justify-content-end">
              <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"
                      aria-label="Đóng"></button>
            </div>
            <div class="offcanvas-body">
              <div class="d-flex justify-content-start align-items-start gap-3 mb-4">
                <img class="o_portal_contact_img rounded o_object_fit_cover" alt="Liên hệ"
                     width="50"
                     src="<%= user.getAvatar() %>"
                     loading="lazy" style="">
                <div class="d-flex flex-column justify-content-center">
                  <h5 class="mb-0"><%= user.getName() %></h5>

                </div>
              </div>
              <div class="o_portal_my_details">
                <div>
                  <address class="o_portal_address mb-0">
                    <div class="gap-2" itemscope="itemscope"
                         itemtype="http://schema.org/PostalAddress">

                      <div class="d-flex align-items-baseline gap-1"><i
                              class="fa fa-envelope fa-fw" role="img" aria-label="Email"
                              title="Email"></i> <span class="text-break w-100"
                                                       itemprop="email"><%= user.getEmail() %></span></div>
                    </div>
                  </address>
                </div>
              </div>
              <a role="button" href="${pageContext.request.contextPath}/profile" class="btn btn-link p-0 mt-3"><i
                      class="fa fa-pencil"></i> Chỉnh sửa thông tin</a>
            </div>
          </div>
        </div>
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
</body>
</html>