package Controller;

import Database.MaintenanceDB;
import Database.ProductDB;
import Model.Product;
import Model.User;
import Utils.Email;
import Utils.Permission;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/maintenance")
public class AddMaintenanceServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        if(!Permission.checkLogin(request, response)) {
            response.sendRedirect("/login");
            return;
        }
        User user = (User) request.getSession().getAttribute("user");
        ProductDB productDB = new ProductDB();
        List<Product> products = productDB.getAllProductBought(user.getUserID());
        request.setAttribute("productList", products);
        request.getRequestDispatcher("maintenance.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        if(!Permission.checkLogin(request, response)) {
            response.sendRedirect("/login");
            return;
        }
        User user = (User) request.getSession().getAttribute("user");
        String maintenanceName = request.getParameter("maintenanceName");
        String maintenanceDescription = request.getParameter("maintenanceDescription");
        String maintenanceDate = request.getParameter("maintenanceDate");
        String maintenanceTime = request.getParameter("maintenanceTime");
        int userId = Integer.parseInt(request.getParameter("userId"));
        String[] productIds = request.getParameterValues("productIds");
        if (productIds == null || productIds.length == 0) {
            response.sendRedirect("/maintenance");
        }
        List<Integer> productIdsList = new ArrayList<>();
        for (String productId : productIds) {
            productIdsList.add(Integer.parseInt(productId));
        }
        MaintenanceDB maintenanceDB = new MaintenanceDB();
        if(maintenanceDB.addMaintenance(maintenanceName, maintenanceDescription, maintenanceDate, maintenanceTime, userId, productIdsList, false)) {
            Email.sendEmail(user.getEmail(), "Thông báo về việc bảo hành, bảo trì sản phẩm", "Đơn bảo hành - bảo trì của bạn đã được xác nhận. Vui lòng đợi thông báo của chúng tôi về lịch nhận sản phẩm khi chúng tôi hoàn thành việc bảo trì, bào hành.\n Xin cảm ơn quý khách!");
            response.sendRedirect("/maintain");
        } else {
            request.setAttribute("typeMsg", "error");
            request.setAttribute("message", "Add maintenance failed");
            request.getRequestDispatcher("maintenance.jsp").forward(request, response);
        }
    }
}
