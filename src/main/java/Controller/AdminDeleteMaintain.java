package Controller;

import Database.MaintenanceDB;
import Utils.Permission;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteMaintain")
public class AdminDeleteMaintain extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        if (!Permission.checkAdmin(request, response)) {
            return;
        }
        int maintainId = Integer.parseInt(request.getParameter("maintenanceId"));
        MaintenanceDB maintenanceDB = new MaintenanceDB();
        maintenanceDB.deleteMaintenance(maintainId);
        response.sendRedirect("/listMaintain");
    }
}
