package Controller;

import Database.MaintenanceDB;
import Model.Maintenance;
import Utils.Permission;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

@WebServlet("/listMaintain")
public class AdminListMaintainServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        if(!Permission.checkAdmin(request, response)){
            return;
        }
        MaintenanceDB maintenanceDB = new MaintenanceDB();
        List<Maintenance> listMaintain = maintenanceDB.getAllMaintenance();
        request.setAttribute("listMaintain", listMaintain);
        request.getRequestDispatcher("admin/listMaintain.jsp").forward(request, response);
    }
}
