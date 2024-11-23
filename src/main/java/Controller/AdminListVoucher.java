package Controller;

import Database.VoucherDB;
import Model.Voucher;
import Utils.Permission;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/listVoucher")
public class AdminListVoucher extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (!Permission.checkAdmin(request, response)) {
            return;
        }
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        VoucherDB voucherDB = new VoucherDB();
        List<Voucher> listVoucher = voucherDB.getAllVoucher();
        request.setAttribute("listVoucher", listVoucher);
        request.getRequestDispatcher("admin/listVoucher.jsp").forward(request, response);
    }
}
