package Database;


import Model.Product;
import Model.TypeProduct;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductTypeDB extends DBContext {

    // getTotalProductTypeById
    public int getTotalProductTypeById(int typeId) {
        String query = "select count(*) from products where typeProductId = ? and status = 1";
        try {

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, typeId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return 0;
    }

    public void updateProductType(int typeProductId, String typeProductName, String describeType) {
        String query = "update TypeProduct set typeProductName = ?, describeType = ? where typeProductId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, typeProductName);
            ps.setString(2, describeType);
            ps.setInt(3, typeProductId);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    public boolean deleteProductType(int typeProductId) {
        String query = "delete from TypeProduct where typeProductId = ?";
        try {
            
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, typeProductId);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
        return true;
    }

    public List<TypeProduct> getAllProductType() {
        List<TypeProduct> list = new ArrayList<>();
        String query = "select * from TypeProduct";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new TypeProduct(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDate(4),
                        rs.getDate(5)
                ));
            }
        } catch (Exception ignored) {
        }
        return list;
    }

    public List<TypeProduct> getAllProductTypeWithQuantity() {
        List<TypeProduct> list = new ArrayList<>();
        String query = "SELECT t.typeProductId, t.typeProductName, COUNT(p.productId) AS quantity\n"
                + "FROM typeproduct t\n"
                + "LEFT JOIN products p ON t.typeProductId = p.typeProductId\n"
                + "GROUP BY t.typeProductId, t.typeProductName";

        try {


            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new TypeProduct(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public TypeProduct findProductTypeByID(int typeProductId) {
        String query = "select * from TypeProduct where typeProductId = ?";
        try {

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, typeProductId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new TypeProduct(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> getProductTypeTrademark(int trademakrID, int offset, String sortTy, String typeSort) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT p.*, t.typeProductName, s.sizeName, tm.trademarkName " +
                "FROM products p " +
                "JOIN TypeProduct t ON p.typeProductId = t.typeProductId " +
                "JOIN Size s ON p.sizeId = s.sizeId " +
                "JOIN Trademark tm ON p.trademarkId = tm.trademarkId " +
                "WHERE p.trademarkId = ? " +
                "ORDER BY p." + sortTy + " " + typeSort + " " +
                "OFFSET ? ROWS FETCH NEXT 9 ROWS ONLY";


        try {
            //mo ket noi voi sql

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, trademakrID);
            ps.setInt(2, offset);
            ResultSet rs = ps.executeQuery();
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
        } catch (SQLException e) {
            System.out.println(e);
            throw new RuntimeException(e);
        }
        return list;
    }
    public List<Product> getProductTypeById(int typeId, int offset, String sortTy, String typeSort) {


        List<Product> list = new ArrayList<>();
        String query = "SELECT p.*, t.typeProductName, s.sizeName, tm.trademarkName " +
                "FROM products p " +
                "JOIN TypeProduct t ON p.typeProductId = t.typeProductId " +
                "JOIN Size s ON p.sizeId = s.sizeId " +
                "JOIN Trademark tm ON p.trademarkId = tm.trademarkId " +
                "WHERE p.typeProductId = ? " +
                "ORDER BY p." + sortTy + " " + typeSort + " " +
                "OFFSET ? ROWS FETCH NEXT 9 ROWS ONLY";


        try {
            //mo ket noi voi sql

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, typeId);
            ps.setInt(2, offset);
            ResultSet rs = ps.executeQuery();
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
        } catch (SQLException e) {
            System.out.println(e);
            throw new RuntimeException(e);
        }
        return list;
    }

    public boolean addTypeProduct(TypeProduct typeProduct) {
        String query = "INSERT INTO TypeProduct (typeProductName, describeType) VALUES (?, ?)";
        try {

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, typeProduct.getTypeProductName());
            ps.setString(2, typeProduct.getDescribeType());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }
}
