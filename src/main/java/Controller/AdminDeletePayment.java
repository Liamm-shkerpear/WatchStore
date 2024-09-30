package Controller;

import Database.PaymentDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeletePayment", urlPatterns = {"/deletePayment"})
public class AdminDeletePayment extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PaymentDB paymentDB = new PaymentDB();
        if(paymentDB.deletePayment(Integer.parseInt(request.getParameter("paymentId")))){
            response.sendRedirect("/listPayment");
        } else{
            request.setAttribute("message", "Failed to delete payment");
            request.setAttribute("typeMsg", "error");
            request.getRequestDispatcher("admin/listPayment.jsp").forward(request, response);
        }
    }
}
