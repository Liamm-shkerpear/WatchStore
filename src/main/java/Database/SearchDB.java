package Database;


import Model.Product;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class SearchDB extends DBContext{
    public List<Product> searchByKeyword(String keyword) {
        String query = "SELECT p.*, t.typeProductName, s.sizeName, tm.trademarkName FROM products p\n" +
                "JOIN TypeProduct t ON p.typeProductId = t.typeProductId\n" +
                "JOIN Size s ON p.sizeId = s.sizeId\n" +
                "JOIN Trademark tm ON p.trademarkId = tm.trademarkId\n" +
                "WHERE p.productName LIKE ? OR p.describeProduct LIKE ? OR t.typeProductName LIKE ? OR tm.trademarkName LIKE ?";

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            String keywordPattern = "%" + keyword + "%";
            ps.setString(1, keywordPattern);
            ps.setString(2, keywordPattern);
            ps.setString(3, keywordPattern);
            ps.setString(4, keywordPattern);

            ResultSet rs = ps.executeQuery();
            List<Product> list = new ArrayList<>();
            while (rs.next()) {
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
                        rs.getBoolean(15),
                        rs.getString(16),
                        rs.getString(17),
                        rs.getString(18)));
            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
}
