<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Model.CartProducts" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.User" %>
<%
    ArrayList<CartProducts> listCartH = (ArrayList<CartProducts>) session.getAttribute("cart");
    if(listCartH == null){
        listCartH = new ArrayList<>();
    }
    int total = 0;
    for (CartProducts c : listCartH) {
        if (c.getProduct().getPriceAfterDiscount() != 0) {
            total += c.getProduct().getPriceAfterDiscount() * c.getQuantity();
        } else {
            total += c.getProduct().getPriceProduct() * c.getQuantity();
        }
    }
%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/web/assets/1/7a28038/web.assets_frontend.min.css" type="text/css">
<script>
    window.onload = function() {
        var message = '${message}';
        var type = '${typeMsg}';

        if (message) {
            var popup = document.createElement("div");
            popup.innerHTML = message;
            popup.style.position = "fixed";
            popup.style.bottom = "20px";
            popup.style.right = "20px";
            popup.style.backgroundColor = type === "success" ? "rgb(0, 128, 0)" : "rgb(128, 0, 0)";
            popup.style.color = "white";
            popup.style.padding = "10px 20px";
            popup.style.borderRadius = "5px";
            popup.style.zIndex = "1000";
            document.body.appendChild(popup);

            setTimeout(function() {
                popup.style.opacity = "0";
                setTimeout(function() {
                    document.body.removeChild(popup);
                }, 500);
            }, 2000);
        }
    }
</script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<header id="top" data-anchor="true" data-name="Header" data-extra-items-toggle-aria-label="Nút thêm mục" class="o_header_standard o_top_fixed_element" style=" ">

    <nav data-name="Navbar" aria-label="Chính" class="navbar navbar-expand-lg navbar-light o_colored_level o_cc d-none d-lg-block shadow-sm ">


        <div id="o_main_nav" class="o_main_nav container">

            <a data-name="Navbar Logo" href="/" class="navbar-brand logo me-4">

                <span role="img" aria-label="Logo of DaNaLuxury" title="DaNaLuxury"><img src="${pageContext.request.contextPath}/web/image/website/logo/DaNaLuxury.svg" class="img img-fluid" width="95" height="40" alt="DaNaLuxury" loading="lazy" style=""></span>
            </a>


            <ul role="menu" id="top_menu" class="nav navbar-nav top_menu me-auto">



                <li role="presentation" class="nav-item">
                    <a role="menuitem" href="${pageContext.request.contextPath}/" class="nav-link ">
                        <span>Trang chủ</span>
                    </a>
                </li>
                <li role="presentation" class="nav-item">
                    <a role="menuitem" href="${pageContext.request.contextPath}/store" class="nav-link ">
                        <span>Cửa hàng</span>
                    </a>
                </li>
                <li role="presentation" class="nav-item">
                    <a role="menuitem" href="${pageContext.request.contextPath}/about-us" class="nav-link ">
                        <span>Giới thiệu</span>
                    </a>
                </li>
                <li role="presentation" class="nav-item">
                    <a role="menuitem" href="${pageContext.request.contextPath}/maintenance" class="nav-link ">
                        <span>Bảo hành</span>
                    </a>
                </li>


            </ul>

            <ul class="navbar-nav align-items-center gap-2 flex-shrink-0 justify-content-end ps-3">


                <li class=" divider d-none"></li>
                <li class="o_wsale_my_cart  ">
                    <a href="${pageContext.request.contextPath}/cart" aria-label="Giỏ hàng thương mại điện tử" class="o_navlink_background btn position-relative rounded-circle p-1 text-center text-reset">
                        <div class="">
                            <i class="fa fa-shopping-cart fa-stack"></i>
                            <sup class="my_cart_quantity badge bg-primary position-absolute top-0 end-0 mt-n1 me-n1 rounded-pill d-none" data-order-id="">0</sup>
                        </div>
                    </a>
                </li>


                <li class="">

                    <a data-bs-target="#o_search_modal" data-bs-toggle="modal" role="button" title="Tìm kiếm" href="#" class="btn rounded-circle p-1 lh-1 o_navlink_background text-reset o_not_editable">
                        <i class="fa fa-search fa-stack lh-lg"></i>
                    </a>
                </li>

                <li class="">
                    <div data-name="Text" class="s_text_block ">
                        <a href="tel:+1 555-555-5556" class="nav-link o_nav-link_secondary p-2">
                            <i class="fa fa-1x fa-fw fa-phone me-1"></i>
                            <span class="o_force_ltr"><small>+1 555-555-5556</small></span>
                        </a>
                    </div>
                </li>


                <li data-name="Language Selector" class="o_header_language_selector ">


                </li>
                <%
                    User user = (User) session.getAttribute("user");
                %>

                <% if (user == null) { %>
                    <li class=" o_no_autohide_item">
                        <a href="${pageContext.request.contextPath}/login" class="o_nav_link_btn nav-link border px-3">Đăng nhập</a>
                    </li>
                <% } else { %>
                    <li class="dropdown o_no_autohide_item">
                        <a href="#" role="button" data-bs-toggle="dropdown" class="dropdown-toggle nav-link border-0" aria-expanded="false">
                            <span class=""><%= user.getName() %></span>
                            <span class="o_ripple_item" style="animation-duration: 350ms; width: 125.075px; height: 125.075px; top: -44.3375px; left: -7.86257px;"></span></a>
                        <div role="menu" class="dropdown-menu js_usermenu dropdown-menu-end" style="">
                            <a href="${pageContext.request.contextPath}/my" role="menuitem" class="dropdown-item ps-3">
                                <i class="fa fa-fw fa-id-card-o me-1 small text-primary"></i> Tài khoản của tôi
                            </a>
                            <% if (user.getTypeAccountId() == 2) { %>
                                <a href="${pageContext.request.contextPath}/admin" role="menuitem" class="dropdown-item ps-3">
                                    <i class="fa fa-fw fa-id-card-o me-1 small text-primary"></i> Trang quản trị
                                </a>
                            <% } %>
                            <div id="o_logout_divider" class="dropdown-divider"></div>
                            <a role="menuitem" id="o_logout" class="dropdown-item ps-3" href="${pageContext.request.contextPath}/logout">
                                <i class="fa fa-fw fa-sign-out me-1 small text-primary"></i> Đăng xuất
                            </a>
                        </div>
                    </li>
                <% } %>


            </ul>
        </div>

    </nav>
    <nav data-name="Navbar" aria-label="Mobile" class="navbar  navbar-light o_colored_level o_cc o_header_mobile d-block d-lg-none shadow-sm ">


        <div class="o_main_nav container flex-wrap justify-content-between">

            <a data-name="Navbar Logo" href="/" class="navbar-brand logo ">

                <span role="img" aria-label="Logo of DaNaLuxury" title="DaNaLuxury"><img src="${pageContext.request.contextPath}/web/image/website/1/logo/DaNaLuxury?unique=689cb1c" class="img img-fluid" width="95" height="40" alt="DaNaLuxury" loading="lazy" style=""></span>
            </a>

            <ul class="o_header_mobile_buttons_wrap navbar-nav flex-row align-items-center gap-2 mb-0">

                <li class=" divider d-none"></li>
                <li class="o_wsale_my_cart  ">
                    <a href="${pageContext.request.contextPath}/cart" aria-label="Giỏ hàng thương mại điện tử" class="o_navlink_background btn position-relative rounded-circle p-1 text-center text-reset">
                        <div class="">
                            <i class="fa fa-shopping-cart fa-stack"></i>
                            <sup class="my_cart_quantity badge bg-primary position-absolute top-0 end-0 mt-n1 me-n1 rounded-pill " data-order-id="2"><%= listCartH.size() %></sup>
                        </div>
                    </a>
                </li>

                <li class="o_not_editable">
                    <button class="nav-link btn me-auto p-2" type="button" data-bs-toggle="offcanvas" data-bs-target="#top_menu_collapse_mobile" aria-controls="top_menu_collapse_mobile" aria-expanded="false" aria-label="Chuyển đổi điều hướng">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                </li>
            </ul>
            <div id="top_menu_collapse_mobile" class="offcanvas offcanvas-end o_navbar_mobile">
                <div class="offcanvas-header justify-content-end o_not_editable">
                    <button type="button" class="nav-link btn-close" data-bs-dismiss="offcanvas" aria-label="Đóng"></button>
                </div>
                <div class="offcanvas-body d-flex flex-column justify-content-between h-100 w-100">
                    <ul class="navbar-nav">


                        <li class="">
                            <form method="get" class="o_searchbar_form s_searchbar_input " action="${pageContext.request.contextPath}/search" data-snippet="s_searchbar_input">
                                <div role="search" class="input-group mb-3">
                                    <input type="search" name="keyword" class="search-query form-control oe_search_box rounded-start-pill text-bg-light ps-3 border-0 bg-light" placeholder="Tìm kiếm..." data-search-type="all" data-limit="0" data-display-image="true" data-display-description="true" data-display-extra-link="true" data-display-detail="true" data-order-by="name asc">
                                    <button type="submit" aria-label="Tìm kiếm" title="Tìm kiếm" class="btn oe_search_button rounded-end-pill bg-o-color-3 pe-3">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </div>

                                <input name="order" type="hidden" class="o_search_order_by" value="name asc">


                            </form>
                        </li>

                        <ul role="menu" class="nav navbar-nav top_menu  ">



                            <li role="presentation" class="nav-item">
                                <a role="menuitem" href="/" class="nav-link ">
                                    <span>Trang chủ</span>
                                </a>
                            </li>
                            <li role="presentation" class="nav-item">
                                <a role="menuitem" href="${pageContext.request.contextPath}/store" class="nav-link ">
                                    <span>Cửa hàng</span>
                                </a>
                            </li>
                            <li role="presentation" class="nav-item">
                                <a role="menuitem" href="${pageContext.request.contextPath}/about-us" class="nav-link ">
                                    <span>Giới thiệu</span>
                                </a>
                            </li>
                            <li role="presentation" class="nav-item">
                                <a role="menuitem" href="/appointment" class="nav-link ">
                                    <span>Cuộc hẹn</span>
                                </a>
                            </li>


                        </ul>

                        <li class="">
                            <div data-name="Text" class="s_text_block mt-2 border-top pt-2 o_border_contrast">
                                <a href="tel:+1 555-555-5556" class="nav-link o_nav-link_secondary p-2">
                                    <i class="fa fa-1x fa-fw fa-phone me-1"></i>
                                    <span class="o_force_ltr"><small>+1 555-555-5556</small></span>
                                </a>
                            </div>
                        </li>

                    </ul>
                    <ul class="navbar-nav gap-2 mt-3 w-100">

                        <li data-name="Language Selector" class="o_header_language_selector ">


                        </li>




                        <li class="dropdown dropup o_no_autohide_item">
                            <a href="#" role="button" data-bs-toggle="dropdown" class="dropdown-toggle nav-link d-flex align-items-center border-0">
                                <div class="">
                                    <i class="fa fa-1x fa-fw fa-user me-2"></i>
                                </div>
                                <span class="me-auto small">VSLXp10r3rs</span>
                            </a>
                            <div role="menu" class="dropdown-menu js_usermenu w-100">
                                <a href="${pageContext.request.contextPath}/my" role="menuitem" class="dropdown-item ps-3">
                                    <i class="fa fa-fw fa-id-card-o me-1 small text-primary"></i> Tài khoản của tôi
                                </a>
                                <div id="o_logout_divider" class="dropdown-divider"></div>
                                <a role="menuitem" id="o_logout" class="dropdown-item ps-3" href="/web/session/logout?redirect=/">
                                    <i class="fa fa-fw fa-sign-out me-1 small text-primary"></i> Đăng xuất
                                </a>
                            </div>
                        </li>



                    </ul>
                </div>
            </div>
        </div>

    </nav>

</header>