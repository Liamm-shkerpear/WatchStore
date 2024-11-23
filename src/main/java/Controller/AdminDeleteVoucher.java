package Controller;


import Database.SizeDB;
import Database.VoucherDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteVoucher", urlPatterns = {"/deleteVoucher"})
public class AdminDeleteVoucher extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        VoucherDB voucherDB = new VoucherDB();
        if(voucherDB.deleteVoucher(Integer.parseInt(request.getParameter("voucherID")))){
            response.sendRedirect("/listVoucher");
        } else{
            request.setAttribute("message", "Không thể xóa Voucher, vì có một số sản phẩm đang liên kết với voucher này");
            request.setAttribute("typeMsg", "error");
            request.getRequestDispatcher("admin/listVoucher.jsp").forward(request, response);
        }
    }
}
