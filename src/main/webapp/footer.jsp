<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="o_search_modal_block">
  <div class="modal fade css_editable_mode_hidden" id="o_search_modal" aria-hidden="true" tabindex="-1">
    <div class="modal-dialog modal-lg pt-5">
      <div class="modal-content mt-5">
        <form method="get" class="o_searchbar_form s_searchbar_input " action="/search"
              data-snippet="s_searchbar_input">
          <div role="search" class="input-group input-group-lg">
            <input type="search" name="keyword"
                   class="search-query form-control oe_search_box border border-end-0 p-3 border-0 bg-light"
                   placeholder="Tìm kiếm..." data-search-type="all" data-limit="5"
                   data-display-image="true" data-display-description="true"
                   data-display-extra-link="true" data-display-detail="true"
                   data-order-by="name asc" autocomplete="off">
            <button type="submit" aria-label="Tìm kiếm" title="Tìm kiếm"
                    class="btn oe_search_button border border-start-0 px-4 bg-o-color-4">
              <i class="fa fa-search"></i>
            </button>
          </div>

          <input name="order" type="hidden" class="o_search_order_by" value="name asc">


        </form>
      </div>
    </div>
  </div>
</div>

<footer id="bottom" data-anchor="true" data-name="Footer" class="o_footer o_colored_level o_cc ">
  <div id="footer" class="oe_structure oe_structure_solo">
    <section class="s_title pt48 pb24" data-vcss="001" data-snippet="s_title">
      <div class="container s_allow_columns">
        <h4><b>Đã thiệt kế</b> cho công ty</h4>
      </div>
    </section>
    <section class="s_text_block pb32" data-snippet="s_text_block" data-name="Text">
      <div class="container">
        <div class="row">
          <div class="col-lg-5">
            <p>Chúng tôi là một nhóm những người đam mê với mục tiêu cải thiện cuộc sống của mọi
              người thông qua các sản phẩm đột phá. Chúng tôi xây dựng các sản phẩm tuyệt vời để
              giải quyết các vấn đề kinh doanh của bạn. Sản phẩm của chúng tôi được thiết kế cho
              các công ty vừa và nhỏ sẵn sàng tối ưu hóa hiệu suất của họ.</p>
          </div>
          <div class="col-lg-3 offset-lg-1">
            <p class="text-muted"><b>My Company</b><br />Khu FPT<br />
              Thành phố Đà Nẵng, <br />Việt Nam</p>
          </div>
          <div class="col-lg-3">
            <ul class="list-unstyled mb-2">
              <li><i class="fa fa-phone fa-fw me-2"></i><span class="o_force_ltr"><a
                      href="tel:+1 555-555-5556">+1 555-555-5556</a></span></li>
              <li><i class="fa fa-envelope fa-fw me-2"></i><span><a
                      href="mailto:hello@mycompany.com">support@openerp.vn</a></span></li>
            </ul>
            <div class="s_social_media text-start no_icon_color o_not_editable"
                 data-snippet="s_social_media" data-name="Social Media" contenteditable="false">
              <h5 class="s_social_media_title d-none" contenteditable="true">Theo dõi chúng tôi
              </h5>
              <a href="/website/social/github" class="s_social_media_github" target="_blank">
                <i class="fa fa-2x fa-github m-1 o_editable_media"></i>
              </a>
              <a href="/website/social/instagram" class="s_social_media_instagram"
                 target="_blank">
                <i class="fa fa-2x fa-instagram m-1 o_editable_media"></i>
              </a>
              <a href="/website/social/linkedin" class="s_social_media_linkedin" target="_blank">
                <i class="fa fa-2x fa-linkedin m-1 o_editable_media"></i>
              </a>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
  <div class="o_footer_copyright o_colored_level o_cc" data-name="Copyright">
    <div class="container py-3">
      <div class="row">
        <div class="col-sm text-center text-sm-start text-muted">
          <span class="o_footer_copyright_name me-2">Bản quyền thuộc &copy; Tên công ty</span>


        </div>
        <div class="col-sm text-center text-sm-end o_not_editable">

        </div>
      </div>
    </div>
  </div>
</footer>
<%@ include file="chatButton.jsp"%>