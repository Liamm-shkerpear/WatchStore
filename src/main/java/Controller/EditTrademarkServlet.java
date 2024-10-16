package Controller;

import Database.TradeMarkDB;
import Model.Trademark;
import Utils.Permission;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "EditTrademark", urlPatterns = "/editTrademark")
public class EditTrademarkServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (!Permission.checkAdmin(request, response)) {
            return;
        }
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        TradeMarkDB trademarkService = new TradeMarkDB();
        int id = Integer.parseInt(request.getParameter("id"));
        Trademark trademark = trademarkService.findTrademarkByID(id);
        request.setAttribute("trademark", trademark);
        request.getRequestDispatcher("admin/editTrademark.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (!Permission.checkAdmin(request, response)) {
            return;
        }
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        TradeMarkDB trademarkService = new TradeMarkDB();
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String logo = request.getParameter("logo");
        String description = request.getParameter("description");
        Trademark trademark = new Trademark(id, name, logo, description);
        trademarkService.updateTrademark(trademark);
        response.sendRedirect("list-trademark");
    }
}
