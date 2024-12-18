package Controller;


import Database.VoucherDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/activeVoucher")
public class ActiveVoucher extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        int voucherId = Integer.parseInt(request.getParameter("voucherID"));
        VoucherDB voucherDB = new VoucherDB();
        voucherDB.activeVoucher(voucherId);
        response.sendRedirect("/listVoucher");
    }
}
