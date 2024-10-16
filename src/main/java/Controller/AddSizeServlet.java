package Controller;

import Database.SizeDB;
import Model.Size;
import Utils.Permission;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addSize")
public class AddSizeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if (!Permission.checkAdmin(request, response)) {
            return;
        }
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        request.getRequestDispatcher("admin/addSize.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if (!Permission.checkAdmin(request, response)) {
            return;
        }
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        Size size = new Size(request.getParameter("sizeName"), request.getParameter("describeSize"), request.getParameter("weight"));
        if (size.getSizeName() == null || size.getSizeName().isEmpty()) {
            request.setAttribute("errorMessage", "Kích thước không được để trống!");
            request.getRequestDispatcher("admin/addSize.jsp").forward(request, response);
            return;
        }
        SizeDB sizeDB = new SizeDB();
        if (sizeDB.addSize(size)) {
            request.setAttribute("successMessage", "Thêm kích thước thành công!");
        } else {
            request.setAttribute("errorMessage", "Thêm kích thước thất bại!");
        }
        request.getRequestDispatcher("admin/addSize.jsp").forward(request, response);
    }
}
