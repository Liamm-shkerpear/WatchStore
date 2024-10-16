package Controller;

import Database.ProductTypeDB;
import Utils.Permission;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteProductType")
public class DeleteTypeProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        if(!Permission.checkAdmin(request, response)) return;
        int typeProductId = Integer.parseInt(request.getParameter("typeProductId"));
        ProductTypeDB typeProductDB = new ProductTypeDB();
        if (typeProductDB.deleteProductType(typeProductId)) {
            request.setAttribute("typeMsg", "success");

            request.setAttribute("message", "Xóa loại sản phẩm thành công");
        } else {
            request.setAttribute("typeMsg", "error");
            request.setAttribute("message", "Không thể xóa, do có sản phẩm thuộc loại này");
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("/listProductType");
        dispatcher.forward(request, response);

    }
}
