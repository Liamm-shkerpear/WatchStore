package Controller;

import Database.BillDB;
import Model.Bill;
import Model.User;
import Utils.Permission;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/orderHistory")
public class OrderHistoryServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        UTf-8
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        if (!Permission.checkLogin(request, response)) {
            response.sendRedirect("login");
            return;
        }
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        BillDB billDB = new BillDB();
        List<Bill> listBill = billDB.getUserBills(user.getUserID());
        request.setAttribute("listBill", listBill);
        request.getRequestDispatcher("orderHistory.jsp").forward(request, response);
    }
}
