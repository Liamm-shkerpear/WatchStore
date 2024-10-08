/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Database.*;
import Model.*;
import Utils.Permission;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
@WebServlet(name = "DetailProductServlet", urlPatterns = {"/detailProduct"})
public class DetailProductServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        int idProduct = Integer.parseInt(request.getParameter("id"));
        ProductDB productDB = new ProductDB();
        ReviewDB reviewDB = new ReviewDB();
        ProductTypeDB productTypeDB = new ProductTypeDB();
        Product product = productDB.getDetailProductById(idProduct);
        User user = (User) request.getSession().getAttribute("user");
        List<Product> listAllProduct = productDB.getAllProduct();
        request.setAttribute("allProducts", listAllProduct);
        if (user != null) {
            WishlistDB wishlistDB = new WishlistDB();
            Wishlist wishlist = wishlistDB.getWishlistByUserID(user.getUserID());
            if (wishlist == null) {
                wishlistDB.createWishlist(user.getUserID());
                wishlist = wishlistDB.getWishlistByUserID(user.getUserID());
            }
            boolean check = wishlistDB.checkProductInWishlist(wishlist.getWishlistId(), idProduct);
            if (check) {
                request.setAttribute("checkWishlist", true);
            } else {
                request.setAttribute("checkWishlist", false);
            }

        }
        if (product != null) {
            List<Product> listRelatedProduct = productDB.getRelatedProduct(product.getTypeProductId(), product.getProductId());
            List<Review> listReview = reviewDB.getAllReviewByProductId(idProduct);
            boolean checkUser = false;
            HttpSession session = request.getSession();
            if (user != null) {
                if (productDB.checkUserBuyProduct(idProduct, user.getUserID())) {
                    checkUser = true;
                }
            }
            TypeProduct typeProduct = productTypeDB.findProductTypeByID(product.getTypeProductId());
            // Tính số rating trung bình
            int totalRating = 0;
            for (Review review : listReview) {
                totalRating += review.getStarQuantity();
            }
            float avgRating = 0;
            if (listReview.size() > 0) {
                avgRating = (float) totalRating / listReview.size();
            }
            if (user != null) {
                boolean checkReview = reviewDB.checkReview(user.getUserID(), idProduct);
                request.setAttribute("checkReview", checkReview);

            }
            request.setAttribute("avgRating", (int) avgRating);
            request.setAttribute("checkUser", checkUser);
            request.setAttribute("typeProduct", typeProduct);
            request.setAttribute("product", product);
            request.setAttribute("listRelatedProduct", listRelatedProduct);
            request.setAttribute("listReview", listReview);
            request.getRequestDispatcher("detailProduct.jsp").forward(request, response);

        } else {
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */


    /**
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
