package Controller.ajax;


import Database.VoucherDB;
import Model.CartProducts;
import Model.Voucher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/applyVoucher")
public class ApplyVoucher extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try {
            String code = request.getParameter("voucherCode");
            VoucherDB voucherDB = new VoucherDB();
            HttpSession session = request.getSession();
            List<CartProducts> listCart = (List<CartProducts>) session.getAttribute("cart");
            if (listCart == null) {
                listCart = new ArrayList<>();
            }
            int total = 0;
            for (CartProducts c : listCart) {
                if (c.getProduct().getPriceAfterDiscount() == 0) {
                    total += c.getProduct().getPriceProduct() * c.getQuantity();
                } else {
                    total += c.getProduct().getPriceAfterDiscount() * c.getQuantity();
                }
            }
            Voucher voucher = voucherDB.getVoucherByCode(code);
            if (voucher != null) {
                int discountValue = 0;
                if (voucher.isTypeSale()) {
                    discountValue = total * voucher.getValue() / 100;
                } else {
                    discountValue = voucher.getValue();
                }
                if (discountValue > voucher.getMaxSale()) {
                    discountValue = voucher.getMaxSale();
                }
                if(total < discountValue) {
                    discountValue = total;
                }
                total -= discountValue;
                session.setAttribute("totalPrice", total);

                String totalStr = String.format("%,d", total);
                String discountValueStr = String.format("%,d", discountValue);

                response.getWriter().write("{\"status\": true, \"total\": \"" + totalStr + "\", \"discountValue\": \"" + discountValue +  "\"}");
            } else {
                response.getWriter().write("{\"status\": false, \"message\": \"Invalid voucher code\"}");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("/cart");
        }
    }
}
