package Controller;

import Database.MaintenanceDB;
import Database.ProductDB;
import Database.UserDB;
import Model.Product;
import Model.User;
import Utils.Permission;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/addMaintain")
public class AdminAddMaintain extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        if(!Permission.checkLogin(request, response)) {
            response.sendRedirect("/login");
            return;
        }
        ProductDB productDB = new ProductDB();
        List<Product> products = productDB.getAllProduct();
        request.setAttribute("productList", products);
        UserDB userDB = new UserDB();
        List<User> users = userDB.getAllUser();
        request.setAttribute("userList", users);
        request.getRequestDispatcher("admin/addMaintain.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        if(!Permission.checkLogin(request, response)) {
            response.sendRedirect("/login");
            return;
        }
        String maintenanceName = request.getParameter("maintenanceName");
        String maintenanceDescription = request.getParameter("maintenanceDescription");
        String maintenanceDate = request.getParameter("maintenanceDate");
        String maintenanceTime = request.getParameter("maintenanceTime");
        int userId = Integer.parseInt(request.getParameter("userId"));
        String[] productIds = request.getParameterValues("productIds");
        boolean maintenanceStatus = Boolean.parseBoolean(request.getParameter("maintenanceStatus"));
        List<Integer> productIdsList = new ArrayList<>();
        for (String productId : productIds) {
            productIdsList.add(Integer.parseInt(productId));
        }
        MaintenanceDB maintenanceDB = new MaintenanceDB();
        if(maintenanceDB.addMaintenance(maintenanceName, maintenanceDescription, maintenanceDate, maintenanceTime, userId, productIdsList, maintenanceStatus)) {
            request.setAttribute("typeMsg", "success");
            request.setAttribute("message", "Add maintenance success");
        } else {
            request.setAttribute("typeMsg", "error");
            request.setAttribute("message", "Add maintenance failed");
        }
        response.sendRedirect("/listMaintain");
    }
}
