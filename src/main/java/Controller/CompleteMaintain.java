package Controller;


import Database.MaintenanceDB;
import Database.UserDB;
import Database.VoucherDB;
import Model.Maintenance;
import Model.User;
import Utils.Email;
import Utils.Permission;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/completeMaintain")
public class CompleteMaintain extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        if (!Permission.checkAdmin(request, response)){
            return;
        }
        int maintainID = Integer.parseInt(request.getParameter("id"));
        MaintenanceDB maintenanceDB = new MaintenanceDB();
        maintenanceDB.completeMaintenance(maintainID);
        Maintenance maintenance = maintenanceDB.getMaintenanceById(maintainID);
        UserDB userDB = new UserDB();
        User user = userDB.getUserById(maintenance.getUserId());
        Email.sendEmail(user.getEmail(), "Thông báo về đơn hàng bảo trì số #" + maintainID, " “Đã hoàn tất bảo trì, sản phẩm của quý khách sẽ đc giao tới trong 3 ngày, quý khách vui lòng kiểm tra điện thoại để nắm được thời gian chúng tôi trả hàng.”\nTrân trọng!");
        response.sendRedirect("/listMaintain");
    }
}
