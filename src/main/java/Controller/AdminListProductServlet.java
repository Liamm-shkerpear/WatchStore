package Controller;

import Database.ProductDB;
import Model.Product;
import Utils.Permission;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/listProduct")
public class AdminListProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if (!Permission.checkAdmin(request, response)) {
            return;
        }
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        ProductDB productDB = new ProductDB();
        List<Product> productList = productDB.getAllProduct();
        request.setAttribute("productList", productList);
        request.getRequestDispatcher("admin/listProduct.jsp").forward(request, response);
    }
}
