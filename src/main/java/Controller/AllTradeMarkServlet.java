package Controller;

import Database.TradeMarkDB;
import Utils.Permission;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/allTrademark")
public class AllTradeMarkServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        if(!Permission.checkAdmin(request, response)){
            return;
        }
        TradeMarkDB tradeMarkDB = new TradeMarkDB();
        request.setAttribute("listTradeMark", tradeMarkDB.getAllTrademark());
        request.getRequestDispatcher("all-trademark.jsp").forward(request, response);
    }
}
