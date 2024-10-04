package Controller.ajax;

import Database.CartDB;
import Database.ProductDB;
import Model.CartProducts;
import Model.Product;
import Model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/updateCart")
public class UpdateQuantityCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        HttpSession session = request.getSession();
        List<CartProducts> listCart = (List<CartProducts>) session.getAttribute("cart");
        if (listCart == null) {
            listCart = new ArrayList<>();
        }
        ProductDB productDB = new ProductDB();
        Product product = productDB.getDetailProductById(productId);
        if (product == null) {
            response.getWriter().println("Không tìm thấy sản phẩm");
            return;
        }
        if (product.getQuantity() == 0) {
            response.getWriter().println("Sản phẩm đã hết hàng");
            return;
        }
        if (quantity <= 0) {
            response.getWriter().println("Số lượng sản phẩm không hợp lệ");
            return;
        }
        if (quantity + 1 > product.getQuantity()) {
            response.getWriter().println("Số lượng sản phẩm vượt quá số lượng sản phẩm còn lại");
            return;
        }
        CartDB cartDB = new CartDB();
        User user = (User) session.getAttribute("user");
        if (user != null) {
            int cartId = cartDB.getCart(user.getUserID()).getCartId();

            cartDB.updateQuantityProductInCart(cartId, productId, quantity);
        }
        for (CartProducts c : listCart) {
            if (c.getProduct().getProductId() == productId) {
                c.setQuantity(quantity);
                session.setAttribute("cart", listCart);
                response.getWriter().println("Thay đổi số lượng sản phẩm trong giỏ hàng thành công");
            }
        }
    }
}
