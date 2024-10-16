package Controller;

import Database.BillDB;
import Database.ProductDB;
import Database.UserDB;
import Model.Bill;
import Model.BillDetail;
import Model.User;
import Utils.Email;
import Utils.Permission;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/approveBill")
public class ApproveBillServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (!Permission.checkManager(request, response)) {
            return;
        }
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        BillDB billDB = new BillDB();
        ProductDB productDB = new ProductDB();
        int billId = Integer.parseInt(request.getParameter("billId"));
        System.out.println(billId);
        Bill bill = billDB.getBillById(billId);
        if (bill == null) {
            request.setAttribute("error", "Bill not found");
            request.getRequestDispatcher("/listBillAdmin").forward(request, response);
            return;
        }
        System.out.println(bill);
        bill.setStatusBill("Confirmed");
        bill.setEmployeeId(user.getUserID());
        UserDB userDB = new UserDB();
        User customer = userDB.getUserById(bill.getUserId());
        Email.sendEmail(customer.getEmail(), "Thông báo đơn hàng", "Đơn hàng của bạn đã được xác nhận.\n Đơn hàng sẽ sớm được giao đến bạn.\n Cảm ơn sự ủng hộ của bạn!");
        List<BillDetail> billDetailList = billDB.getBillDetailByBillId(billId);
//        for (BillDetail billDetail : billDetailList) {
//            int quantity = productDB.getProductQuantity(billDetail.getProductId());
//            productDB.updateProductQuantity(billDetail.getProductId(), quantity - billDetail.getQuantity());
//        }
        billDB.approveBill(bill);
        response.sendRedirect("/listBillAdmin");
    }
}
