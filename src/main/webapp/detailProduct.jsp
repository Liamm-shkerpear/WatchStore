<%@ page import="Model.Cart" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.Product" %>
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



<div id="wrapwrap" class="   ">
  <a class="o_skip_to_content btn btn-primary rounded-0 visually-hidden-focusable position-absolute start-0"
     href="#wrap">Bỏ qua để đến Nội dung</a>
  <%@ include file="header.jsp"%>
  <main style="padding-top: 57.6px;">

    <div itemscope="itemscope" itemtype="http://schema.org/Product" id="wrap"
         class="js_sale o_wsale_product_page ecom-zoomable zoomodoo-next" data-ecom-zoom-auto="1">
      <div class="oe_structure oe_empty oe_structure_not_nearest" id="oe_structure_website_sale_product_1"
           data-editor-message="THẢ KHỐI DỰNG TẠI ĐÂY ĐỂ CHÚNG KHẢ DỤNG TRÊN TẤT CẢ SẢN PHẨM"></div>
      <section id="product_detail" class="oe_website_sale container my-3 my-lg-4" data-view-track="1">
        <div class="row align-items-center">
          <div class="col d-flex align-items-center order-1 order-lg-0">
            <ol class="o_wsale_breadcrumb breadcrumb p-0 mb-4 m-lg-0">
              <li class="o_not_editable breadcrumb-item d-none d-lg-inline-block">
                <a href="${pageContext.request.contextPath}/store">
                  <i class="oi oi-chevron-left d-lg-none me-1" role="presentation"></i>All
                  Products
                </a>
              </li>
              <li class="o_not_editable breadcrumb-item d-lg-none">
                <a class="py-2 py-lg-0" href="${pageContext.request.contextPath}/store">
                  <i class="oi oi-chevron-left me-1" role="presentation"></i>All Products
                </a>
              </li>
              <li class="breadcrumb-item d-none d-lg-inline-block active">
                <span>${product.productName}</span>
              </li>
            </ol>
          </div>
          <div class="col-lg-4 d-flex align-items-center">
            <div class="d-flex justify-content-between w-100">
              <form method="get"
                    class="o_searchbar_form s_searchbar_input o_wsale_products_searchbar_form me-auto flex-grow-1 mb-4 mb-lg-0"
                    action="${pageContext.request.contextPath}/store" data-snippet="s_searchbar_input">
                <div role="search" class="input-group me-sm-2">
                  <input type="search" name="search"
                         class="search-query form-control oe_search_box border-0 text-bg-light border-0 bg-light"
                         placeholder="Tìm kiếm..." data-search-type="products" data-limit="5"
                         data-display-image="true" data-display-description="true"
                         data-display-extra-link="true" data-display-detail="true"
                         data-order-by="name asc" autocomplete="off">
                  <button type="submit" aria-label="Tìm kiếm" title="Tìm kiếm"
                          class="btn oe_search_button btn btn-light">
                    <i class="oi oi-search"></i>
                  </button>
                </div>

                <input name="order" type="hidden" class="o_search_order_by" value="name asc">


              </form>
              <div class="o_pricelist_dropdown dropdown d-none">

                <a role="button" href="#" data-bs-toggle="dropdown"
                   class="dropdown-toggle btn btn-light">
                  -
                </a>
                <div class="dropdown-menu" role="menu">
                </div>

              </div>
            </div>
          </div>
        </div>
        <div class="row" id="product_detail_main" data-name="Product Page" data-image_width="50_pc"
             data-image_layout="carousel">
          <div class="col-lg-6 mt-lg-4 o_wsale_product_images position-relative" data-image-amount="1">
            <div id="o-carousel-product" data-bs-ride="true"
                 class="carousel slide position-sticky mb-3 overflow-hidden"
                 data-name="Băng chuyền sản phẩm" style="top: 5px;">
              <div
                      class="o_carousel_product_outer carousel-outer position-relative d-flex align-items-center w-100 overflow-hidden">
                <div class="carousel-inner h-100">
                  <div class="carousel-item h-100 text-center active"
                       style="min-height: 636.4px;">
                    <div class="position-relative d-inline-flex overflow-hidden m-auto w-100">
                      <span class="o_ribbon o_ribbon_right z-1" style=""></span>
                      <div name="o_img_with_max_suggested_width"
                           class="d-flex align-items-start justify-content-center w-100 oe_unmovable">
                        <img src="${product.img}"
                             class="img img-fluid oe_unmovable product_detail_img w-100"
                             alt="${product.productName}" loading="lazy"></div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div id="product_details" class="col-lg-6 mt-md-4">
            <h1 itemprop="name">
              ${product.productName}
            </h1>
            <%
              if (user != null) {
            %>
            <c:choose>
              <c:when test="${checkWishlist}">
                <span>
                  <i class="fa fa-heart me-2"></i>
                  Đã thêm vào danh sách yêu thích</span>
              </c:when>
              <c:otherwise>
                  <span onclick="addWishList(${product.productId})"
                        class="btn btn-sm btn-light">
                    <i class="fa fa-heart me-2"></i>
                    Thêm vào danh sách yêu thích
                  </span>
              </c:otherwise>
            </c:choose>
            <%
              }
            %>
            <span itemprop="url"
                  style="display:none;">${pageContext.request.contextPath}/detailProduct?id=${product.productId}</span>
            <span itemprop="image"
                  style="display:none;">https://danaluxury.odoo.com/web/image/product.template/2/image_1920?unique=b17c945</span>

            <form action="/shop/cart/update" method="POST" disabled>
              <input type="hidden" name="csrf_token"
                     value="1c72a877573e9398fc2b97afb1500c716125fb44o1762358240">
              <div class="js_product js_main_product mb-3">
                <div>
                  <div itemprop="offers" itemscope="itemscope" itemtype="http://schema.org/Offer"
                       class="product_price mt-2 mb-3 d-inline-block">
                    <h3 class="css_editable_mode_hidden">
                                                <span class="oe_price" style="white-space: nowrap;"
                                                      data-oe-type="monetary"
                                                      data-oe-expression="combination_info['price']">
                                                  <span
                                                        class="oe_currency_value">
                                                    <c:choose>

                                                      <c:when test="${product.priceAfterDiscount != 0}">
                                                        <del>
                                                          <fmt:formatNumber value="${product.priceProduct}" type="number" groupingUsed="true" /> ₫
                                                        </del>
                                                        <span class="text-danger text ml16">
                                                          Sale: <fmt:formatNumber value="${product.priceAfterDiscount}" type="number" groupingUsed="true" /> ₫
                                                        </span>
                                                      </c:when>
                                                      <c:otherwise>
                                                          <fmt:formatNumber value="${product.priceProduct}" type="number" groupingUsed="true" /> ₫
                                                      </c:otherwise>
                                                    </c:choose>

                                                  </span>
                                                </span>
                      <span itemprop="price" style="display:none;">${price.priceProduct}</span>
                      <span itemprop="priceCurrency" style="display:none;">VND</span>
                      <span style="text-decoration: line-through; white-space: nowrap;"
                            itemprop="listPrice"
                            class="text-danger oe_default_price ms-1 h5 d-none"
                            data-oe-type="monetary"
                            data-oe-expression="combination_info['list_price']"><span
                              class="oe_currency_value">${price.priceProduct}</span>&nbsp;₫</span>
                    </h3>
                    <h3 class="css_non_editable_mode_hidden decimal_precision"
                        data-precision="0">
                      <span><span class="oe_currency_value">${price.priceProduct}</span>&nbsp;₫</span>
                    </h3>
                  </div>
                  <div id="product_unavailable" class="d-none">
                    <h3 class="fst-italic">Không có sẵn để bán</h3>
                  </div>
                  <div class="mb-10">
                    <h5><span>Sản phẩm còn lại: ${product.quantity}</span></h5>
                  </div>
                </div>

                <input type="hidden" class="product_id" name="product_id" value="${product.productId}" title="">
                <input type="hidden" class="product_template_id" name="product_template_id"
                       value="${product.productId}" title="">
                <ul class="list-unstyled js_add_cart_variants mb-0 flex-column list-unstyled"
                    data-attribute_exclusions="{&quot;exclusions&quot;: {}, &quot;archived_combinations&quot;: [], &quot;parent_exclusions&quot;: {}, &quot;parent_combination&quot;: [], &quot;parent_product_name&quot;: null, &quot;mapped_attribute_names&quot;: {}}">
                </ul>

                <p class="css_not_available_msg alert alert-warning">Kết hợp này không tồn tại.</p>
                <div id="o_wsale_cta_wrapper" class="d-flex flex-wrap align-items-center">
                  <c:choose>
                    <c:when test="${product.quantity > 0}">
                      <div contenteditable="false"
                           class="css_quantity input-group d-inline-flex me-2 mb-2 align-middle">
                        <a class="btn btn-link js_add_cart_json" aria-label="Xóa một"
                           title="Xóa một" href="#">
                          <i class="fa fa-minus"></i>
                        </a>
                        <input type="text" class="form-control quantity text-center" data-min="1"
                               name="add_qty" value="1" title="" data-max="${product.quantity}" id="quantity">
                        <a class="btn btn-link float_left js_add_cart_json" aria-label="Thêm"
                           title="Thêm" href="#">
                          <i class="fa fa-plus"></i>
                        </a>
                      </div>
                      <div id="add_to_cart_wrap"
                           class="d-inline-flex align-items-center mb-2 me-auto">
                        <a data-animation-selector=".o_wsale_product_images" role="button"
                           id="add_to_cart" href="#" onclick="addCart(${product.productId}, false)"
                           class="btn btn-primary js_check_product a-submit flex-grow-1">
                          <i class="fa fa-shopping-cart me-2"></i>
                          Thêm vào giỏ hàng
                        </a>
                        &nbsp;&nbsp;
                        <a data-animation-selector=".o_wsale_product_images" role="button"
                           id="buy_now" href="#" onclick="addCart(${product.productId}, true)"
                           class="btn btn-primary js_check_product flex-grow-1">
                          <i class="fa fa-shopping-cart me-2"></i>
                          Mua ngay
                        </a>
                      </div>
                      <div id="product_option_block" class="d-flex flex-wrap w-100"></div>
                    </c:when>
                    <c:otherwise>
                      <button type="button" class="button" disabled>Sản phẩm hết hàng</button>
                    </c:otherwise>
                  </c:choose>
                </div>
              </div>
            </form>
            <div id="contact_us_wrapper" class="d-none oe_structure oe_structure_solo ">
              <section class="s_text_block" data-snippet="s_text_block" data-name="Text">
                <div class="container">
                  <a class="btn btn-primary btn_cta" href="/contactus">
                    Liên hệ với chúng tôi
                  </a>
                </div>
              </section>
            </div>
            <div class="o_product_tags o_field_tags d-flex flex-wrap align-items-center gap-2 mb-4">
            </div>
            <div id="product_attributes_simple">
              <table class="table table-sm text-muted d-none">
              </table>
            </div>
            <div id="o_product_terms_and_share"
                 class="d-flex justify-content-between flex-column flex-md-row align-items-md-end gap-3 mb-3">
              <p class="text-muted mb-0">
                <a href="/terms" class="text-muted"><u>Điều khoản và điều kiện</u></a><br>
                Hoàn tiền trong 30 ngày<br>
                Giao hàng: Từ 2-3 ngày làm việc
              </p>
              <div data-snippet="s_share" data-name="Share"
                   class="s_share text-start o_no_link_popover">
                <h4 class="s_share_title d-none o_default_snippet_text">Chia sẻ</h4>
                <a href="https://www.facebook.com/sharer/sharer.php?u={url}" target="_blank"
                   aria-label="Facebook" class="s_share_facebook">
                  <i class="fa fa-facebook rounded shadow-sm"></i>
                </a>
                <a href="https://twitter.com/intent/tweet?text={title}&amp;url={url}"
                   target="_blank" aria-label="X" class="s_share_twitter">
                  <i class="fa fa-twitter rounded shadow-sm"></i>
                </a>
                <a href="https://www.linkedin.com/sharing/share-offsite/?url={url}" target="_blank"
                   aria-label="LinkedIn" class="s_share_linkedin">
                  <i class="fa fa-linkedin rounded shadow-sm"></i>
                </a>
                <a href="https://wa.me/?text={title}" target="_blank" aria-label="WhatsApp"
                   class="s_share_whatsapp">
                  <i class="fa fa-whatsapp rounded shadow-sm"></i>
                </a>
                <a href="https://pinterest.com/pin/create/button/?url={url}&amp;media={media}&amp;description={title}"
                   target="_blank" aria-label="Pinterest" class="s_share_pinterest">
                  <i class="fa fa-pinterest rounded shadow-sm"></i>
                </a>
                <a href="mailto:?body={url}&amp;subject={title}" aria-label="Email"
                   class="s_share_email">
                  <i class="fa fa-envelope rounded shadow-sm"></i>
                </a>
              </div>
            </div>
          </div>
        </div>
      </section>

      <section class="container mt-4">
        <h3>So sánh với sản phẩm khác</h3>
        <form action="${pageContext.request.contextPath}/compareProduct" method="GET">
          <input hidden name="productId1" value="${product.productId}">
          <select name="productId2" class="form-control mb-3">
            <c:forEach var="otherProduct" items="${allProducts}">
              <c:if test="${otherProduct.productId != product.productId}">
                <option value="${otherProduct.productId}">${otherProduct.productName}</option>
              </c:if>
            </c:forEach>
          </select>
          <button type="submit" class="btn btn-primary">Compare</button>
        </form>
      </section>

      <section class="gap">
        <div class="container">
          <div class="information">
            <h3>Description</h3>
            <div class="border-bar"></div>
            <p>${product.describeProduct}</p>
          </div>

          <div class="row mt-70">
            <div class="col-lg-7">
              <div class="information">
                <h3>Reviews</h3>
                <div class="border-bar"></div>
              </div>
              <ul class="reviews list-unstyled">
                <c:forEach var="review" items="${listReview}">
                  <li>
                    <div class="review-avatar">
                      <img alt="Review avatar" src="${review.avatar}" class="img-fluid rounded-circle" style="max-height: 50px;">
                    </div>
                    <div class="review-content">
                      <h6>${review.name} - <small class="text-muted"><fmt:formatDate value="${review.createdDate}" pattern="dd MMM yyyy" /></small></h6>

                      <div class="star mt-2">
                        <c:forEach begin="1" end="5" var="i">
                          <i class="fa${i <= review.starQuantity ? 's' : 'r'} fa-star" style="color: ${i <= review.starQuantity ? '#f5b301' : '#ddd'};"></i>
                        </c:forEach>
                      </div>
                        <%-- Delete review link for admins or eligible users --%>
                      <c:if test="${user != null && user.getTypeAccountId() == 2}">
                        <a href="${pageContext.request.contextPath}/deleteReview?id=${review.reviewId}&redirectLink=detailProduct?id=${product.productId}" class="text-danger">Delete</a>
                      </c:if>
                      <p>${review.content}</p>
                    </div>
                  </li>
                </c:forEach>
              </ul>
            </div>
            <div class="col-lg-5">
              <c:choose>
                <c:when test="${checkUser}">
                  <c:if test="${!checkReview}">
                    <div class="information">
                      <h3>Leave Your Review</h3>
                      <div class="border-bar"></div>
                      <form action="/addReview" method="post" class="add-review">
                        <input type="hidden" name="productId" value="${product.productId}">
                        <div class="star-rating">
                          <c:forEach begin="1" end="5" var="i">
                            <input type="radio" id="star${i}" name="starQuantity" value="${i}" />
                            <label for="star${i}" title="${i} stars"><i class="fa-solid fa-star"></i></label>
                          </c:forEach>
                        </div>
                        <textarea class="form-control mt-3" name="content" placeholder="Add Review"></textarea>
                        <button type="submit" class="btn btn-primary mt-3">Add Review</button>
                      </form>
                    </div>
                  </c:if>
                  <c:if test="${checkReview}">
                    <div class="information">
                      <h3>Your Review</h3>
                      <div class="border-bar"></div>
                      <p>You have already reviewed this product.</p>
                    </div>
                  </c:if>
                </c:when>
                <c:otherwise>
                  <div class="information">
                    <h3>Leave Your Review</h3>
                    <div class="border-bar"></div>
                    <p>You need to purchase the product to be able to rate it.</p>
                  </div>
                </c:otherwise>
              </c:choose>
            </div>
          </div>
        </div>
      </section>
      <div class="oe_structure oe_empty oe_structure_not_nearest mt16"
           id="oe_structure_website_sale_product_2"
           data-editor-message="THẢ KHỐI DỰNG TẠI ĐÂY ĐỂ CHÚNG KHẢ DỤNG TRÊN TẤT CẢ SẢN PHẨM"></div>
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
<script>
  function addCart(id, type) {
    $.ajax({
      url: "/addItemToCart",
      type: "POST",
      data: {
        productId: id,
        quantity: $("#quantity").val(),
        type: type
      },
      success: function (data) {
        if (type) {
          alert("Thêm sản phẩm vào giỏ hàng thành công, vui lòng thanh toán!");
          window.location.href = "/cart";
        } else {
          alert("Sản phẩm đã được thêm vào giỏ hàng.");
          location.reload();
        }

      }
    });
  }

  function addWishList(id) {
    $.ajax({
      url: "/addWishlist",
      type: "GET",
      data: {
        productID: id
      },
      success: function (data) {
        if (data === "true") {
          alert("Add to wishlist success");
          location.reload();
        } else {
          alert("Add to wishlist fail");
        }
      }
    });
  }
</script>
</body>
</html>