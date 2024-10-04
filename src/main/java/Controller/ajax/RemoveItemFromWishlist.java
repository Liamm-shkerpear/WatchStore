package Controller.ajax;

import Database.WishlistDB;
import Model.User;
import Model.Wishlist;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RemoveItemFromWishlist", urlPatterns = {"/removeWishlist"})
public class RemoveItemFromWishlist extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        int productID = Integer.parseInt(request.getParameter("productId"));
        User user = (User) request.getSession().getAttribute("user");
        if(user == null) {
            response.getWriter().write("false");
            return;
        }
        int userID = user.getUserID();

        WishlistDB wishlistDB = new WishlistDB();
        Wishlist wishlist = wishlistDB.getWishlistByUserID(userID);

        if (wishlist == null) {
            response.getWriter().write("true");
            return;
        }
        wishlist = wishlistDB.getWishlistByUserID(userID);

        if (!wishlistDB.checkProductInWishlist(wishlist.getWishlistId(), productID)) {
            response.getWriter().write("false");
            return;
        }
        wishlistDB.removeProductFromWishlist(wishlist.getWishlistId(), productID);
        response.getWriter().write("true");

    }
}
