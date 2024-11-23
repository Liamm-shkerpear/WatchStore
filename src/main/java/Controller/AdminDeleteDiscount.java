package Controller;

import Database.DiscountDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteDiscount")
public class AdminDeleteDiscount extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int discountId = Integer.parseInt(request.getParameter("discountId"));
        DiscountDB discountDAO = new DiscountDB();
        if (discountDAO.deleteDiscount(discountId)){
            request.setAttribute("message", "Discount deleted successfully");
            request.setAttribute("typeMsg", "success");
            response.sendRedirect("/listDiscounts");
        } else {
            request.setAttribute("message", "Failed to delete discount");
            request.setAttribute("typeMsg", "error");
            request.getRequestDispatcher("admin/listDiscount.jsp").forward(request, response);

        }

    }
}
