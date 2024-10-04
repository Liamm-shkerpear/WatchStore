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
    <%
        ArrayList<CartProducts> cartItems = (ArrayList<CartProducts>) session.getAttribute("cart");
        if(listCartH == null){
            listCartH = new ArrayList<CartProducts>();
        }
        int totalPrice = 0;
        for (CartProducts c : listCartH) {
            if (c.getProduct().getPriceAfterDiscount() != 0) {
                totalPrice += c.getProduct().getPriceAfterDiscount() * c.getQuantity();
            } else {
                totalPrice += c.getProduct().getPriceProduct() * c.getQuantity();
            }
        }
    %>
    <main>

        <div id="wrap">
            <div class="oe_website_sale o_website_sale_checkout container py-2">
                <div class="row position-relative  mb32">
                    <div class="col-12">

                        <div
                                class="o_wizard d-flex flex-wrap justify-content-between justify-content-md-start my-3 my-sm-4">
                            <div
                                    class="d-flex flex-column flex-md-row align-items-end align-items-md-start justify-content-center">

                                    <span class=" d-none d-md-flex no-decoration">
                                        <div class="d-flex align-items-center o_wizard_step_active fw-bold">
                                            <p class="o_wizard_steplabel text-center mb-0">
                                                Xem lại đơn hàng
                                            </p>
                                            <span
                                                    class="fa fa-angle-right d-inline-block align-middle mx-sm-3 text-muted fs-5"></span>
                                        </div>
                                    </span>
                                <span class="o_disabled d-none d-md-flex no-decoration">
                                        <div class="d-flex align-items-center text-muted">
                                            <p class="o_wizard_steplabel text-center mb-0">
                                                Giao hàng
                                            </p>
                                            <span
                                                    class="fa fa-angle-right d-inline-block align-middle mx-sm-3 text-muted fs-5"></span>
                                        </div>
                                    </span>
                                <span class="o_disabled d-none d-md-flex no-decoration">
                                        <div class="d-flex align-items-center text-muted">
                                            <p class="o_wizard_steplabel text-center mb-0">
                                                Thanh toán
                                            </p>
                                        </div>
                                    </span>

                                <div class="d-flex d-md-none flex-column align-items-start">
                                    <div class="dropdown">
                                        <a class="dropdown-toggle fw-bold" role="button" data-bs-toggle="dropdown"
                                           aria-expanded="false" title="Bước">
                                            Xem lại đơn hàng
                                        </a>
                                        <ul class="dropdown-menu">
                                            <li>
                                                    <span class="dropdown-item fw-bold" title="Xem lại đơn hàng">Xem lại
                                                        đơn hàng</span>
                                            </li>
                                            <li>
                                                    <span class="dropdown-item text-muted o_disabled"
                                                          title="Giao hàng">Giao hàng</span>
                                            </li>
                                            <li>
                                                    <span class="dropdown-item text-muted o_disabled"
                                                          title="Thanh toán">Thanh toán</span>
                                            </li>
                                        </ul>
                                    </div>
                                    <span class="d-inline-block d-md-none text-muted">
                                            Tiếp theo: Giao hàng
                                        </span>
                                </div>
                            </div>
                            <div class="o_wizard_circle_progress progress d-md-none position-relative rounded-circle ms-3 bg-transparent"
                                 style="--rightProgress:120.0deg; --leftProgress:0deg;">
                                    <span
                                            class="o_wizard_circle_progress_left position-absolute start-0 top-0 z-1 overflow-hidden w-50 h-100 ">
                                        <span
                                                class="progress-bar position-absolute start-100 top-0 w-100 h-100 border border-5 border-start-0 border-primary bg-transparent"></span>
                                    </span>
                                <span
                                        class="o_wizard_circle_progress_right position-absolute top-0 end-0 z-1 overflow-hidden w-50 h-100">
                                        <span
                                                class="progress-bar position-absolute top-0 end-100 w-100 h-100 border border-5 border-end-0 border-primary bg-transparent"></span>
                                    </span>
                                <p class="mx-auto fw-bold">
                                    1
                                    của
                                    3
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="offset-xl-1 col-lg-5 col-xl-4 order-2" id="o_cart_summary">
                        <div class="o_total_card card sticky-lg-top">
                            <div class="card-body p-0 p-lg-4">
                                <div id="cart_total">
                                    <table class="table mb-0">
                                        <tbody>
                                        <tr id="order_total_untaxed" class="border-top">
                                            <td id="cart_total_subtotal"
                                                class="border-0 pb-2 ps-0 pt-0 text-start text-muted"
                                                colspan="2">
                                                Thành tiền
                                            </td>
                                            <td class="text-end border-0 pb-2 pe-0 pt-0">
                                                        <span class="monetary_field" style="white-space: nowrap;"><span
                                                                class="oe_currency_value" id="totalPriceOriginal"><fmt:formatNumber value="<%= totalPrice %>" type="number" groupingUsed="true"/></span>&nbsp;₫</span>
                                            </td>
                                        </tr>
                                        <tr id="order_total_taxes">
                                            <td colspan="2" class="text-muted border-0 ps-0 pt-0 pb-3">Phí vận chuyển</td>
                                            <td class="text-end border-0 pe-0 pt-0 pb-3">
                                                        <span class="monetary_field" style="white-space: nowrap;"><span
                                                                class="oe_currency_value" id="ship_fee" >0</span>&nbsp;₫</span>
                                            </td>
                                        </tr>
                                        <tr id="order_total_voucher">
                                            <td colspan="2" class="text-muted border-0 ps-0 pt-0 pb-3">Giảm giá</td>
                                            <td class="text-end border-0 pe-0 pt-0 pb-3">
                                                        <span class="monetary_field" style="white-space: nowrap;"><span
                                                                class="oe_currency_value" id="discount-value">0</span>&nbsp;₫</span>
                                            </td>
                                        </tr>
                                        <tr id="order_total" class="border-top">
                                            <td colspan="2" class="border-0 ps-0 pt-3"><strong>Tổng</strong>
                                            </td>
                                            <td class="text-end border-0 px-0 pt-3">
                                                <strong class="monetary_field text-end p-0"><span
                                                        class="oe_currency_value" id="total-price"><fmt:formatNumber value="<%= totalPrice %>" type="number" groupingUsed="true"/> </span>&nbsp;₫</strong>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3" class="text-end text-xl-end border-0 p-0">
                                                        <span>
                                                            <div class="coupon_form">

                                                                <div>
                                                                    <input type="hidden" name="csrf_token"
                                                                           value="3bec5bf6c361b728e86687c4923d0244ee0b4e41o1762361473">
                                                                    <div class="input-group w-100 my-2">
                                                                        <input id="voucherCode" name="promo" class="form-control"
                                                                               type="text" placeholder="Mã giảm giá...">
                                                                        <a href="#" role="button" onclick="applyVoucher()"
                                                                           class="btn btn-secondary a-submit ps-2">Áp
                                                                            dụng</a>
                                                                    </div>
                                                                </form>
                                                              <span id="voucher-message" style="color: #FFD700;"></span>
                                                            </div>
                                                        </span>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>

                                <form name="o_payment_express_checkout_form" class="container" data-amount="110.0"
                                      data-minor-amount="110" data-currency-id="23" data-currency-name="vnd"
                                      data-merchant-name="DaNaLuxury" data-partner-id="9"
                                      data-payment-method-unknown-id="149"
                                      data-access-token="7c84e501-ea7e-4a4d-a0e1-1e8f6305c78c"
                                      data-transaction-route="/shop/payment/transaction/2"
                                      data-shipping-address-update-route="/shop/express/shipping_address_change"
                                      data-express-checkout-route="/shop/express_checkout"
                                      data-landing-route="/shop/payment/validate">
                                </form>


                                <div class=" d-flex flex-column pt-4">
                                    <a role="button" name="website_sale_main_button" class=" btn btn-primary  w-100"
                                       href="${pageContext.request.contextPath}/checkout">
                                        Check-out
                                        <i class="fa fa-angle-right ms-2 fw-light"></i>
                                    </a>
                                    <div
                                            class="position-relative d-flex w-100 justify-content-center align-items-center my-2 opacity-75">
                                        <hr class="w-100">
                                        <span class="px-3">hoặc</span>
                                        <hr class="w-100">
                                    </div>
                                    <a class="text-center" href="${pageContext.request.contextPath}/store">
                                        <i class="fa fa-angle-left me-2 fw-light"></i>
                                        Tiếp tục mua hàng
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="oe_cart col-12 col-lg-7">


                        <div class="col">
                            <h3 class="mb-4">Tổng quan đơn hàng</h3>
                            <c:forEach items="<%= cartItems%>" var="item">

                                <div id="cart_products" class="js_cart_lines d-flex flex-column mb32">
                                    <div class="o_cart_product d-flex align-items-stretch gap-3 sale.order.line()  "
                                         data-product-id="2">
                                        <div><img
                                                src="${item.product.img}"
                                                class="img o_image_64_max rounded" alt="${item.product.productName}" loading="lazy"
                                                style=""></div>
                                        <div class="flex-grow-1">
                                            <a href="/detailProduct?id=${item.product.productId}">

                                                <h6 class="d-inline align-top h6 fw-bold">${item.product.productName}</h6>

                                            </a>
                                            <div name="o_wsale_cart_line_button_container">
                                                <a href="#" onclick="removeFromCart(${item.product.productId})" class="js_delete_product d-none d-md-inline-block small"
                                                   aria-label="Xóa khỏi giỏ hàng" title="Xóa khỏi giỏ hàng">Xoá</a>
                                                <button class="js_delete_product btn btn-light d-inline-block d-md-none"
                                                        title="xoá">
                                                    <i class="fa fa-trash-o"></i>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="d-flex flex-column align-items-end">
                                            <div name="website_sale_cart_line_quantity"
                                                 class="css_quantity input-group mb-2">
                                                <a href="#"
                                                   class="js_add_cart_json btn btn-link d-inline-block border-end-0"
                                                   aria-label="Xóa một" title="Xóa một">
                                                    <i class="position-relative z-1 fa fa-minus"></i>
                                                </a>
                                                <input id="product_quantity_input" type="text" onchange="updateQuantity(${item.product.productId}, this.value, ${item.product.quantity})" min="1" max="${item.product.quantity}"
                                                       class="js_quantity quantity form-control border-start-0 border-end-0"
                                                       data-line-id="2" aria-valuemax="15" data-product-id="2" value="${item.quantity}">
                                                <a href="#" class="js_add_cart_json d-inline-block float_left btn btn-link border-start-0"
                                                                                                         aria-label="Thêm" title="Thêm">
                                                <i class="fa fa-plus position-relative z-1"></i>
                                            </a>
                                            </div>
                                            <div class="mb-0 h6 fw-bold text-end" name="website_sale_cart_line_price">
                                                    <span style="white-space: nowrap;" data-oe-type="monetary"
                                                          data-oe-expression="product_price"><span
                                                            class="oe_currency_value">
                                                        <fmt:formatNumber value="${item.product.priceProduct}" type="number" groupingUsed="true"/>
                                                    </span>&nbsp;₫</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <div class="clearfix"></div>
                            <div class="oe_structure" id="oe_structure_website_sale_cart_1"></div>
                        </div>

                    </div>

                </div>
            </div>



            <div class="oe_structure" id="oe_structure_website_sale_cart_2"></div>

        </div>

        <div id="o_shared_blocks" class="oe_unremovable"></div>
    </main>
    <%@include file="footer.jsp"%>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script>
    function updateQuantity(productId, quantity, maxQuantity) {
        $.ajax({
            url: "/updateCart",
            type: "get",
            data: {
                productId: productId,
                quantity: quantity
            },
            success: function(data) {
                let msg = data.toString().trim();
                if (msg === "Số lượng sản phẩm vượt quá số lượng sản phẩm còn lại"){
                    $("#product_quantity_input").val(maxQuantity);
                    alert(msg);
                }
            },
            error: function() {
                alert("Error updating cart");
            }
        });
    }

    function removeFromCart(productId) {
        $.ajax({
            url: "/removeItemFromCart",
            type: "get",
            data: {
                productId: productId
            },
            success: function(data) {
                location.reload();
            },
            error: function() {
                alert("Error removing item");
            }
        });
    }

    function applyVoucher() {
        let voucherCode = $("#voucherCode").val();
        if (voucherCode) {
            $.ajax({
                url: "/applyVoucher",
                type: "get",
                data: { voucherCode: voucherCode },
                success: function (response) {
                    var data = JSON.parse(response);
                    if (data.status) {
                        updateTotal(data.discountValue);
                        $("#voucherCodeValue").prop("value", voucherCode);
                        $("#voucher-message").text("Voucher applied successfully").css("color", "green");
                    } else {
                        $("#voucher-message").text(data.message).css("color", "red");
                    }
                }
            });
        }
    }

    function updateTotal(discountValue) {
        var shipFee = $("#ship_fee").text() === "free" ? 0 : parseInt($("#ship_fee").text().replace(/\,/g, ''));
        var totalPriceOriginal = parseInt($("#totalPriceOriginal").text().replace(/\,/g, ''));
        var totalPrice = totalPriceOriginal + shipFee - discountValue;
        $("#discount-value").text("-" + (new Intl.NumberFormat().format(discountValue)));
        $("#total-price").text(new Intl.NumberFormat().format(totalPrice));
    }
</script>
</body>
</html>