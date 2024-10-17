package Controller;

import Database.AuthenticationDB;
import Database.CartDB;
import Database.WishlistDB;
import Model.CartProducts;
import Model.Product;
import Model.User;
import Utils.JWT;
import Utils.Permission;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "WishListServlet", urlPatterns = {"/wishlist"})
public class WishListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        UTF-8
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        if (!Permission.checkLogin(request, response)) {
            response.sendRedirect("/login");
            return;
        }
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        WishlistDB wishlistDB = new WishlistDB();
        List<Product> listProduct = wishlistDB.getWishlistProductByUserID(user.getUserID());
        request.setAttribute("wishlistItems", listProduct);
        request.getRequestDispatcher("wishlist.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


    }

    /**
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}