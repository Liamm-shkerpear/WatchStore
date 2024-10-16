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
import java.util.List;

@WebServlet(name = "ListTrademark", urlPatterns = "/listTrademark")
public class AdminListTrademarkServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        if(!Permission.checkAdmin(request, response)){
            return;
        }
        TradeMarkDB trademarkService = new TradeMarkDB();
        List<Trademark> trademarks = trademarkService.getAllTrademark();
        request.setAttribute("listTrademark", trademarks);
        request.getRequestDispatcher("admin/listTrademark.jsp").forward(request, response);
    }
}
