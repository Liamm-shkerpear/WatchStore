package Controller;

import Database.ProductTypeDB;
import Model.TypeProduct;
import Utils.Permission;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addTypeProduct")
public class AddTypeProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if (!Permission.checkAdmin(request, response)) {
            return;
        }
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        request.getRequestDispatcher("admin/addTypeProduct.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if (!Permission.checkAdmin(request, response)) {
            return;
        }
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        TypeProduct typeProduct = new TypeProduct(request.getParameter("typeProductName"), request.getParameter("describeType"));
        if (typeProduct.getTypeProductName() == null || typeProduct.getTypeProductName().isEmpty()) {
            request.setAttribute("errorMessage", "Loại sản phẩm không được để trống!");
            request.getRequestDispatcher("admin/addTypeProduct.jsp").forward(request, response);
            return;
        }
        ProductTypeDB productTypeDB = new ProductTypeDB();
        if (productTypeDB.addTypeProduct(typeProduct)) {
            request.setAttribute("successMessage", "Thêm loại sản phẩm thành công!");
        } else {
            request.setAttribute("errorMessage", "Thêm loại sản phẩm thất bại!");
        }
        request.getRequestDispatcher("admin/addTypeProduct.jsp").forward(request, response);
    }
}
