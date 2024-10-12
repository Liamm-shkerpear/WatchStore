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
import java.sql.Date;

@WebServlet("/addVoucher")
public class AddVoucher extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        request.getRequestDispatcher("admin/addVoucher.jsp").forward(request, response);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (!Permission.checkAdmin(request, response)) {
            return;
        }
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (!Permission.checkAdmin(request, response)) {
            return;
        }
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        VoucherDB voucherDB = new VoucherDB();
        String code = request.getParameter("code");
        int value = Integer.parseInt(request.getParameter("value"));
        boolean typeSale = request.getParameter("typeSale").equals("1");
        boolean status = request.getParameter("status").equals("1");
        String describeVoucher = request.getParameter("describeVoucher");
        int maxSale = Integer.parseInt(request.getParameter("maxSale"));
        Date startDate = Date.valueOf(request.getParameter("startDate"));
        Date endDate = Date.valueOf(request.getParameter("endDate"));
        if (value < 0) {
            request.setAttribute("error", "Please enter a positive value");
        }
        Voucher voucher = new Voucher(code, value, typeSale, status, describeVoucher, maxSale, startDate, endDate);
        if (voucherDB.addVoucher(voucher)) {
            request.setAttribute("successMessage", "Added Voucher");
        } else {
            request.setAttribute("errorMessage", "Failed to add Voucher");
        }
        processRequest(request, response);
    }
}
