package Controller;

import Database.BillDB;
import Model.Bill;
import Utils.Permission;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/listBillAdmin")
public class AdminListBillServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        UTF-8
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        if (!Permission.checkManager(request, response)) {
            return;
        }
        BillDB billDB = new BillDB();
        List<Bill> billList = billDB.getAllBill();
        request.setAttribute("billList", billList);
        request.getRequestDispatcher("admin/bill.jsp").forward(request, response);
    }
}
