package Controller;

import Database.BillDB;
import Model.Bill;
import Model.BillDetail;
import Utils.Permission;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/adminBillDetail")
public class AdminBillDetailServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (!Permission.checkAdmin(request, response)) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        BillDB billDB = new BillDB();
        int billId = Integer.parseInt(request.getParameter("billId"));
        Bill bill = billDB.getBillById(billId);
        List<BillDetail> billDetailList = billDB.getBillDetailByBillId(billId);
        request.setAttribute("bill", bill);
        request.setAttribute("billDetailList", billDetailList);
        request.getRequestDispatcher("admin/billDetail.jsp").forward(request, response);
    }
}