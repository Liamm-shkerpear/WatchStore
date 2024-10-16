package Controller;


import Database.SizeDB;
import Utils.Permission;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/editSize")
public class EditSizeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (!Permission.checkAdmin(request, response)) {
            return;
        }
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        int id = Integer.parseInt(request.getParameter("sizeId"));
        SizeDB sizeDB = new SizeDB();
        request.setAttribute("size", sizeDB.getSizeById(id));
        request.getRequestDispatcher("admin/editSize.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (!Permission.checkAdmin(request, response)) {
            return;
        }
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        SizeDB sizeDB = new SizeDB();
        String sizeId = request.getParameter("sizeId");
        String sizeName = request.getParameter("sizeName");
        String sizeDescription = request.getParameter("describeSize");
        String diameter = request.getParameter("diameter");
        sizeDB.updateSize(sizeId, sizeName, sizeDescription, diameter);
        response.sendRedirect(request.getContextPath() + "/listSize");
    }
}
