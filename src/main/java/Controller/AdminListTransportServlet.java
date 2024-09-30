package Controller;

import Database.TransportDB;
import Model.Transport;
import Utils.Permission;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/listTransport")
public class AdminListTransportServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        if(!Permission.checkAdmin(request, response)) return;
        TransportDB transportDB = new TransportDB();
        List<Transport> transportList = transportDB.getAllTransport();
        request.setAttribute("transportList", transportList);
        request.getRequestDispatcher("admin/listTransport.jsp").forward(request, response);
    }
}
