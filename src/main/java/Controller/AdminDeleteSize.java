package Controller;


import Database.SizeDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteSize", urlPatterns = {"/deleteSize"})
public class AdminDeleteSize extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SizeDB sizeDB = new SizeDB();
        if(sizeDB.deleteSize(Integer.parseInt(request.getParameter("sizeId")))){
           request.setAttribute("message", "Deleted Successfully");
           request.setAttribute("typeMsg", "success");
        } else{
            request.setAttribute("message", "Không thể xóa Size, vì có một số sản phẩm đang liên kết với size này");
            request.setAttribute("typeMsg", "error");
        }
        response.sendRedirect("/listSize");
    }
}
