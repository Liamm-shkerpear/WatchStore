package Controller;

import Database.BillDB;
import Database.ProductDB;
import Model.BillDetail;
import Model.Product;
import Utils.Permission;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/cancelBill")
public class CancelBill extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        if (!Permission.checkLogin(request, response)) {
            return;
        }
        BillDB billDB = new BillDB();
        ProductDB productDB = new ProductDB();
        int billId = Integer.parseInt(request.getParameter("billId"));
        billDB.cancelBill(billId);
        List<BillDetail> billDetails = billDB.getBillDetailByBillId(billId);
        for (BillDetail billDetail : billDetails) {
            Product product = productDB.getProductById(billDetail.getProductId());
            productDB.updateProductQuantity(product.getProductId(), product.getQuantity() + billDetail.getQuantity());
        }
        response.sendRedirect("/orderHistory");
    }
}
