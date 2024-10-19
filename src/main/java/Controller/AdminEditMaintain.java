package Controller;

import Database.MaintenanceDB;
import Database.PaymentDB;
import Model.Maintenance;
import Model.MaintenanceProduct;
import Model.Payment;
import Utils.Permission;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminEditMaintain", urlPatterns = {"/adminEditMaintain"})
public class AdminEditMaintain extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        if (!Permission.checkAdmin(request, response)) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        MaintenanceDB maintenanceDB = new MaintenanceDB();
        Maintenance maintenance = maintenanceDB.getMaintenanceById(Integer.parseInt(request.getParameter("maintenanceId")));
        List<MaintenanceProduct> maintenanceProductList = maintenanceDB.getAllProductMaintenanceByID(Integer.parseInt(request.getParameter("maintenanceId")));
        request.setAttribute("maintenance", maintenance);
        request.setAttribute("maintenanceProductList", maintenanceProductList);
        request.getRequestDispatcher("admin/editMaintain.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        int maintenanceId = Integer.parseInt(request.getParameter("maintenanceId"));
        String maintenanceName = request.getParameter("maintenanceName");
        String maintenanceDescription = request.getParameter("maintenanceDescription");
        String maintenanceDate = request.getParameter("maintenanceDate");
        String maintenanceTime = request.getParameter("maintenanceTime");
        boolean maintenanceStatus = "1".equals(request.getParameter("maintenanceStatus"));

        // Khởi tạo đối tượng Maintenance và đặt các thuộc tính
        Maintenance maintenance = new Maintenance();
        maintenance.setMaintenanceId(maintenanceId);
        maintenance.setMaintenanceName(maintenanceName);
        maintenance.setMaintenanceDescription(maintenanceDescription);
        maintenance.setMaintenanceDate(maintenanceDate);
        maintenance.setMaintenanceTime(maintenanceTime);
        maintenance.setMaintenanceStatus(maintenanceStatus);

        MaintenanceDB maintenanceDB = new MaintenanceDB();
        maintenanceDB.updateMaintenance(maintenance);

        response.sendRedirect("/listMaintain");
    }

}
