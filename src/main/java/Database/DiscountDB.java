package Database;

import Model.Discount;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DiscountDB extends DBContext {

    // deleteDiscount
    public boolean deleteDiscount(int discountId) {
        String query = "DELETE FROM discount WHERE discountId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, discountId);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error deleting discount:");
            System.out.println(e);
            return false;
        }
        return true;
    }

    // updateDiscount
    public boolean updateDiscount(Discount discount) {
        String query = "UPDATE discount SET discountPercentage = ?, startDate = ?, endDate = ?, status = ? WHERE discountId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setFloat(1, discount.getDiscountPercentage());
            ps.setDate(2, discount.getStartDate());
            ps.setDate(3, discount.getEndDate());
            ps.setBoolean(4, discount.isStatus());
            ps.setInt(5, discount.getDiscountId());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("Error updating discount:");
            System.out.println(e);
        }
        return false;
    }

    public Discount getDiscountById(int discountId) {
        String query = "SELECT * FROM discount WHERE discountId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, discountId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Discount(rs.getInt(1),
                        rs.getFloat(2),
                        rs.getDate(3),
                        rs.getDate(4),
                        rs.getBoolean(5));
            }
        } catch (SQLException e) {
            System.out.println("Error retrieving discount by ID:");
            System.out.println(e);
        }
        return null;
    }

    public Discount getDiscountByProductId(int productId) {
        String query = "SELECT d.* FROM discount d " +
                "JOIN product_discount pd ON d.discountId = pd.discountId " +
                "WHERE pd.productId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Discount(rs.getInt(1),
                        rs.getFloat(2),
                        rs.getDate(3),
                        rs.getDate(4),
                        rs.getBoolean(5));
            }
        } catch (SQLException e) {
            System.out.println("Error retrieving discount by product ID:");
            System.out.println(e);
        }
        return null;
    }

    public List<Discount> getAllDiscount() {
        List<Discount> list = new ArrayList<>();
        String query = "SELECT * FROM discount";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Discount(rs.getInt(1),
                        rs.getFloat(2),
                        rs.getDate(3),
                        rs.getDate(4),
                        rs.getBoolean(5)));
            }
        } catch (SQLException e) {
            System.out.println("Error retrieving all discounts:");
            System.out.println(e);
        }
        return list;
    }

    public Discount getDiscountByIdProduct(int productId) {
        return getDiscountByProductId(productId); // Gọi lại phương thức đã có
    }

    public boolean addDiscount(String discountPercentage, Date startDate, Date endDate, boolean status) {
        String query = "INSERT INTO discount (discountPercentage, startDate, endDate, status) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, discountPercentage);
            ps.setDate(2, startDate);
            ps.setDate(3, endDate);
            ps.setBoolean(4, status);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("Error adding discount:");
            System.out.println(e);
        }
        return false;
    }
}
