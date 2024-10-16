package Controller;

import Database.SizeDB;
import Utils.Permission;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/listSize")
public class AdminListSizeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(!Permission.checkAdmin(request, response)) return;
        SizeDB sizeDB = new SizeDB();
        request.setAttribute("listSize", sizeDB.getAllSize());
        request.getRequestDispatcher("admin/listSize.jsp").forward(request, response);
    }
}
