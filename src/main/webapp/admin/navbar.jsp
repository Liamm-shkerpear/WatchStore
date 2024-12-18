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
            }, 5000);
        }
    }
</script>
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/admin">
        <div class="sidebar-brand-icon rotate-n-15">
            <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">SB Admin <sup>2</sup></div>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider my-0">

    <!-- Nav Item - Dashboard -->
    <li class="nav-item active">
        <a class="nav-link" href="/dashboard">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Dashboard</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">
        Interface
    </div>

    <!-- Nav Item - Pages Collapse Menu -->
<%--    <li class="nav-item">--%>
<%--        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"--%>
<%--           aria-expanded="true" aria-controls="collapseTwo">--%>
<%--            <i class="fas fa-fw fa-cog"></i>--%>
<%--            <span>Components</span>--%>
<%--        </a>--%>
<%--        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">--%>
<%--            <div class="bg-white py-2 collapse-inner rounded">--%>
<%--                <h6 class="collapse-header">Custom Components:</h6>--%>
<%--                <a class="collapse-item" href="buttons.html">Buttons</a>--%>
<%--                <a class="collapse-item" href="cards.html">Cards</a>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </li>--%>

<%--    <!-- Nav Item - Utilities Collapse Menu -->--%>
<%--    <li class="nav-item">--%>
<%--        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"--%>
<%--           aria-expanded="true" aria-controls="collapseUtilities">--%>
<%--            <i class="fas fa-fw fa-wrench"></i>--%>
<%--            <span>Utilities</span>--%>
<%--        </a>--%>
<%--        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"--%>
<%--             data-parent="#accordionSidebar">--%>
<%--            <div class="bg-white py-2 collapse-inner rounded">--%>
<%--                <h6 class="collapse-header">Custom Utilities:</h6>--%>
<%--                <a class="collapse-item" href="utilities-color.html">Colors</a>--%>
<%--                <a class="collapse-item" href="utilities-border.html">Borders</a>--%>
<%--                <a class="collapse-item" href="utilities-animation.html">Animations</a>--%>
<%--                <a class="collapse-item" href="utilities-other.html">Other</a>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </li>--%>

<%--    <!-- Divider -->--%>
<%--    <hr class="sidebar-divider">--%>

<%--    <!-- Heading -->--%>
<%--    <div class="sidebar-heading">--%>
<%--        Addons--%>
<%--    </div>--%>

    <!-- Nav Item - Pages Collapse Menu -->
<%--    <li class="nav-item">--%>
<%--        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"--%>
<%--           aria-expanded="true" aria-controls="collapsePages">--%>
<%--            <i class="fas fa-fw fa-table"></i>--%>
<%--            <span>Pages</span>--%>
<%--        </a>--%>
<%--        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">--%>
<%--            <div class="bg-white py-2 collapse-inner rounded">--%>
<%--                <h6 class="collapse-header">Login Screens:</h6>--%>
<%--                <a class="collapse-item" href="/listUser">User</a>--%>
<%--                <a class="collapse-item" href="/listProduct">Product</a>--%>
<%--                <a class="collapse-item" href="/listBillAdmin">Bill</a>--%>
<%--                <a class="collapse-item" href="/listSize">Size</a>--%>
<%--                <a class="collapse-item" href="/listTrademark">Trademark</a>--%>
<%--                <a class="collapse-item" href="/listProductType">Product Type</a>--%>
<%--                <div class="collapse-divider"></div>--%>
<%--                <h6 class="collapse-header">Other Pages:</h6>--%>
<%--                <a class="collapse-item" href="404.html">404 Page</a>--%>
<%--                <a class="collapse-item" href="blank.html">Blank Page</a>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </li>--%>

    <!-- Nav Item - Tables -->
    <li class="nav-item">
        <a class="nav-link" href="/listUser">
            <i class="fas fa-fw fa-table"></i>
            <span>User</span></a>
    </li>

    <li class="nav-item">
        <a class="nav-link" href="/listBillAdmin">
            <i class="fas fa-fw fa-table"></i>
            <span>Bills</span></a>
    </li>

    <li class="nav-item">
        <a class="nav-link" href="/chatAdmin">
            <i class="fas fa-fw fa-table"></i>
            <span>Chat</span></a>
    </li>

    <li class="nav-item">
        <a class="nav-link" href="/listProduct">
            <i class="fas fa-fw fa-table"></i>
            <span>Products</span></a>
    </li>



    <li class="nav-item">
        <a class="nav-link" href="/listSize">
            <i class="fas fa-fw fa-table"></i>
            <span>Size</span></a>
    </li>

    <li class="nav-item">
        <a class="nav-link" href="/listTransport">
            <i class="fas fa-fw fa-table"></i>
            <span>Transport</span></a>
    </li>

    <li class="nav-item">
        <a class="nav-link" href="/listTrademark">
            <i class="fas fa-fw fa-table"></i>
            <span>Trademark</span></a>
    </li>

    <li class="nav-item">
        <a class="nav-link" href="/listProductType">
            <i class="fas fa-fw fa-table"></i>
            <span>Type Product</span></a>
    </li>

    <li class="nav-item">
        <a class="nav-link" href="/listMaintain">
            <i class="fas fa-fw fa-table"></i>
            <span>Maintain</span></a>
    </li>

    <li class="nav-item">
        <a class="nav-link" href="/listPayment">
            <i class="fas fa-fw fa-table"></i>
            <span>Payment</span></a>
    </li>

    <li class="nav-item">
        <a class="nav-link" href="/listDiscounts">
            <i class="fas fa-fw fa-table"></i>
            <span>Discount</span></a>
    </li>

    <li class="nav-item">
        <a class="nav-link" href="/listVoucher">
            <i class="fas fa-fw fa-table"></i>
            <span>Voucher</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider d-none d-md-block">

    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>

    <!-- Sidebar Message -->
<%--    <div class="sidebar-card d-none d-lg-flex">--%>
<%--        <img class="sidebar-card-illustration mb-2" src="img/undraw_rocket.svg" alt="...">--%>
<%--        <p class="text-center mb-2"><strong>SB Admin Pro</strong> is packed with premium features, components, and more!</p>--%>
<%--        <a class="btn btn-success btn-sm" href="https://startbootstrap.com/theme/sb-admin-pro">Upgrade to Pro!</a>--%>
<%--    </div>--%>

</ul>