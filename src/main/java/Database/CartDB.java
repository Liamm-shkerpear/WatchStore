package Database;

import Model.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CartDB extends DBContext {
    public boolean clearCart(int userId) {
        String query = "DELETE FROM cart_products WHERE cartId = (SELECT cartId FROM carts WHERE userId = ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, userId);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public Cart createCart(int userId) {
        String query = "INSERT INTO carts (userId) VALUES (?)";
        try {
            PreparedStatement ps = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, userId);
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                return new Cart(rs.getInt(1), userId);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<CartProducts> getCartItems(int userId) {
        List<CartProducts> list = new ArrayList<>();
        String query = "SELECT p.*, "
                + "d.*, "
                + "c.*, "
                + "cp.quantity, "
                + "(p.priceProduct - (p.priceProduct * d.discountPercentage / 100)) AS priceAfterDiscount, "
                + "cp.createdDate "
                + "FROM carts c "
                + "JOIN cart_products cp ON c.cartId = cp.cartId "
                + "JOIN products p ON cp.productId = p.productId "
                + "LEFT JOIN discount d ON cp.discountId = d.discountId "
                + "WHERE c.userId = ? "
                + "ORDER BY cp.createdDate DESC;";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getString(12),
                        rs.getDate(13),
                        rs.getDate(14),
                        rs.getBoolean(15),
                        rs.getInt(27));

                Discount discount = new Discount(rs.getInt(16),
                        rs.getFloat(17),
                        rs.getDate(18),
                        rs.getDate(19),
                        rs.getBoolean(20));
                Cart cart = new Cart(rs.getInt(23),
                        rs.getInt(24),
                        rs.getDate(25));
                list.add(new CartProducts(product, discount, rs.getInt(26)));
            }
        } catch (SQLException e) {
            System.out.println("Error getting cart items:");
            System.out.println(e);
        }
        return list;
    }

    public boolean checkProductInCart(int cartId, int productId) {
        String query = "SELECT * FROM cart_products WHERE cartId = ? AND productId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, cartId);
            ps.setInt(2, productId);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            System.out.println(e);
            throw new RuntimeException(e);
        }
    }

    public Cart getCart(int userId) {
        String query = "SELECT u.*, c.* FROM carts c " +
                "JOIN users u ON c.userId = u.userId " +
                "WHERE c.userId = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User user = new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getDate(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getBoolean(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getInt(11),
                        rs.getString(12),
                        rs.getString(13),
                        rs.getBoolean(14),
                        rs.getString(15),
                        rs.getDate(16),
                        rs.getDate(17),
                        rs.getBoolean(18));
                return new Cart(rs.getInt(19), user, rs.getDate(21));
            }
        } catch (SQLException e) {
            System.out.println("Error getting cart:");
            System.out.println(e);
        }
        return null;
    }

    public void updateQuantityProductInCart(int cartId, int productId, int quantity) {
        String query = "UPDATE cart_products SET quantity = ? WHERE productId = ? AND cartId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, quantity);
            ps.setInt(2, productId);
            ps.setInt(3, cartId);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error updating quantity:");
            System.out.println(e);
        }
    }

    public void addProductToCart(int userId, int productId, int quantity) {
        String query = "INSERT INTO cart_products (cartId, productId, quantity, discountId) VALUES (?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            Cart cart = getCart(userId);
            if (cart != null) {
                int cartId = cart.getCartId();
                ps.setInt(1, cartId);
                ps.setInt(2, productId);
                ps.setInt(3, quantity);

                DiscountDB discountDB = new DiscountDB();
                Discount discount = discountDB.getDiscountByProductId(productId);
                if (discount != null) {
                    ps.setInt(4, discount.getDiscountId());
                } else {
                    ps.setNull(4, Types.INTEGER);
                }

                ps.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println("Error adding product to cart:");
            e.printStackTrace();
        }
    }

    public void removeProductFromCart(int cartProductId) {
        String query = "DELETE FROM cart_products WHERE productId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, cartProductId);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error removing product from cart:");
            System.out.println(e);
        }
    }
}
