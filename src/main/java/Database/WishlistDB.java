package Database;

import Model.Product;
import Model.Wishlist;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class WishlistDB extends DBContext{
//    CREATE TABLE wishlist (
//       wishlistId INT IDENTITY(1,1) PRIMARY KEY,
//       userId INT,
//       createdDate DATETIME DEFAULT GETDATE(),
//       FOREIGN KEY (userId) REFERENCES users(userID)
//);
//
//CREATE TABLE wishlist_products (
//       wishlistItemId INT IDENTITY(1,1) PRIMARY KEY,
//       wishlistId INT,
//       productId INT,
//       createdDate DATETIME DEFAULT GETDATE(),
//       FOREIGN KEY (wishlistId) REFERENCES wishlist(wishlistId),
//       FOREIGN KEY (productId) REFERENCES products(productId)
//);
//    Add product to wishlist
    public boolean addProductToWishlist(int wishlistID, int productID) {
        try {
            String sql = "INSERT INTO wishlist_products(wishlistId, productId) VALUES (?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, wishlistID);
            ps.setInt(2, productID);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    // Get wishlist id by user id
    public int getWishlistID(int userID) {
        try {
            String sql = "SELECT wishlistId FROM wishlist WHERE userId = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userID);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                return rs.getInt("wishlistId");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return -1;
    }

    // Get wishlist by user id
    public List<Product> getWishlistProductByUserID(int userID) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "SELECT p.* FROM wishlist_products wp JOIN products p ON wp.productId = p.productId WHERE wp.wishlistId = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, getWishlistID(userID));
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {

                list.add(new Product(rs.getInt(1),
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
                        rs.getBoolean(15)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    // Remove product from wishlist
    public boolean removeProductFromWishlist(int wishlistId, int productID) {
        try {
            String sql = "DELETE FROM wishlist_products WHERE wishlistId = ? AND productId = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, wishlistId);
            ps.setInt(2, productID);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    // Check product in wishlist
    public boolean checkProductInWishlist(int wishlistId, int productID) {
        try {
            String sql = "SELECT * FROM wishlist_products WHERE wishlistId = ? AND productId = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, wishlistId);
            ps.setInt(2, productID);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    // Remove all product from wishlist
    public boolean removeAllProductFromWishlist(int userID) {
        try {
            String sql = "DELETE FROM wishlist_products WHERE wishlistId = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, getWishlistID(userID));
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

//    Create wishlist
    public boolean createWishlist(int userID) {
        try {
            String sql = "INSERT INTO wishlist(userId) VALUES (?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userID);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

//    Get wishlist by user id
    public Wishlist getWishlistByUserID(int userID) {
        try {
            String sql = "SELECT * FROM wishlist WHERE userId = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userID);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                return new Wishlist(rs.getInt(1), rs.getInt(2), rs.getDate(3));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
}
