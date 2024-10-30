package Controller;

import Database.ProductDB;
import Model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CompareProductsServlet", urlPatterns = {"/compareProduct"})
public class CompareProductsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId1 = request.getParameter("productId1");
        String productId2 = request.getParameter("productId2");

        ProductDB productDB = new ProductDB();
        Product product1 = productDB.getProductById(Integer.parseInt(productId1));
        Product product2 = productDB.getProductById(Integer.parseInt(productId2));

        List<Product> products = new ArrayList<>();
        products.add(product1);
        products.add(product2);

        request.setAttribute("products", products);
        RequestDispatcher dispatcher = request.getRequestDispatcher("compareProduct.jsp");
        dispatcher.forward(request, response);
    }

}
