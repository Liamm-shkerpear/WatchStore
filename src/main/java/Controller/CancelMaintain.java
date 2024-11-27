package Controller;

import Database.BillDB;
import Database.MaintenanceDB;
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

@WebServlet("/cancelMaintenance")
public class CancelMaintain extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        if (!Permission.checkLogin(request, response)) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        MaintenanceDB maintenanceDB = new MaintenanceDB();
        String maintainID = request.getParameter("id");
        maintenanceDB.cancelByID(Integer.parseInt(maintainID));
        response.sendRedirect("/maintain");
    }
}
