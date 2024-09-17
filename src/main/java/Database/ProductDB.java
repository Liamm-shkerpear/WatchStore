package Database;

import Model.Product;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDB extends DBContext {
    public List<Product> getAllProductBought(int userID) {
        List<Product> products = new ArrayList<>();
        String query = "SELECT DISTINCT p.productId, p.productName, p.img, p.img1, p.img2, p.img3, p.priceProduct, p.createdDate\n" +
                "FROM users u\n" +
                "JOIN bill b ON u.userID = b.userId\n" +
                "JOIN billDetail bd ON b.billId = bd.billId\n" +
                "JOIN products p ON bd.productId = p.productId\n" +
                "WHERE u.userID = ?\n" +
                "ORDER BY p.createdDate DESC;\n";
        try{
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, userID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getInt("productId"));
                product.setProductName(rs.getString("productName"));
                product.setImg(rs.getString("img"));
                product.setImg1(rs.getString("img1"));
                product.setImg2(rs.getString("img2"));
                product.setImg3(rs.getString("img3"));
                product.setPriceProduct(rs.getInt("priceProduct"));
                products.add(product);
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return products;
    }
//    getAllProductIds
    public List<Integer> getAllProductIds() {
        List<Integer> list = new ArrayList<>();
        String query = "SELECT productId FROM products";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt(1));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void deleteProductDiscount(int productId) {
        String query = "DELETE FROM product_discount WHERE productId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, productId);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
//    Delete product
    public void deleteProduct(int productId) {
//        Disable foreign key check
//        Delete product
        String disableConstraintsQuery = "ALTER TABLE wishlist_products NOCHECK CONSTRAINT ALL";
        String disCon2 = "ALTER TABLE billdetail NOCHECK CONSTRAINT ALL";
        String disCon3 = "ALTER TABLE product_discount NOCHECK CONSTRAINT ALL";
        String disCon4 = "ALTER TABLE cart_products NOCHECK CONSTRAINT ALL";


        String query = "DELETE FROM products WHERE productId = ?";
        try {
            PreparedStatement psDisable = connection.prepareStatement(disableConstraintsQuery);
            psDisable.executeUpdate();
            PreparedStatement psDisable2 = connection.prepareStatement(disCon2);
            psDisable2.executeUpdate();
            PreparedStatement psDisable3 = connection.prepareStatement(disCon3);
            psDisable3.executeUpdate();
            PreparedStatement psDisable4 = connection.prepareStatement(disCon4);
            psDisable4.executeUpdate();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, productId);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String query = "select p.*, t.typeProductName, s.sizeName, tm.trademarkName from products p\n"
                + "join TypeProduct t on p.typeProductId = t.typeProductId\n"
                + "join Size s on p.sizeId = s.sizeId\n"
                + "join Trademark tm on p.trademarkId = tm.trademarkId";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
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
            throw new RuntimeException(e);
        }
        return list;
    }

    public boolean addDiscountProduct(int productId, int discountId) {
        String query = "INSERT INTO product_discount (productId, discountId) VALUES (?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, productId);
            ps.setInt(2, discountId);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public void changeDiscountProduct(int productId, int discountId) {
        String query = "UPDATE product_discount SET discountId = ? WHERE productId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, discountId);
            ps.setInt(2, productId);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public boolean checkDiscountProduct(int productId) {
        String query = "SELECT * FROM product_discount WHERE productId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }
    public boolean editProduct(Product product) {
        String query = "UPDATE products SET productName = ?, img = ?, img1 = ?, img2 = ?, img3 = ?, priceProduct = ?, typeProductId = ?, sizeId = ?, trademarkId = ?, quantity = ?, describeProduct = ?, status = ? WHERE productId = ?";
        try {

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, product.getProductName());
            ps.setString(2, product.getImg());
            ps.setString(3, product.getImg1());
            ps.setString(4, product.getImg2());
            ps.setString(5, product.getImg3());
            ps.setInt(6, product.getPriceProduct());
            ps.setInt(7, product.getTypeProductId());
            ps.setInt(8, product.getSizeId());
            ps.setInt(9, product.getTrademarkId());
            ps.setInt(10, product.getQuantity());
            ps.setString(11, product.getDescribeProduct());
            ps.setBoolean(12, product.isStatus());
            ps.setInt(13, product.getProductId());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
            System.out.println("Loi ");
            return false;
        }
        return true;
    }

    public boolean addProduct(Product product) {
        String query = "INSERT INTO products (productName, img, img1, img2, img3, priceProduct, typeProductId, sizeId, trademarkId, quantity, describeProduct) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, product.getProductName());
            ps.setString(2, product.getImg());
            ps.setString(3, product.getImg1());
            ps.setString(4, product.getImg2());
            ps.setString(5, product.getImg3());
            ps.setInt(6, product.getPriceProduct());
            ps.setInt(7, product.getTypeProductId());
            ps.setInt(8, product.getSizeId());
            ps.setInt(9, product.getTrademarkId());
            ps.setInt(10, product.getQuantity());
            ps.setString(11, product.getDescribeProduct());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    // Get Products by Price Range
    public List<Product> getProductByPriceRange(int lower, int upper) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT p.*, t.typeProductName, s.sizeName, tm.trademarkName, " +
                "d.discountPercentage, " +
                "(p.priceProduct - (p.priceProduct * d.discountPercentage / 100)) AS priceAfterDiscount " +
                "FROM products p " +
                "JOIN TypeProduct t ON p.typeProductId = t.typeProductId " +
                "JOIN Size s ON p.sizeId = s.sizeId " +
                "JOIN Trademark tm ON p.trademarkId = tm.trademarkId " +
                "LEFT JOIN Product_Discount pd ON p.productId = pd.productId " +
                "LEFT JOIN Discount d ON pd.discountId = d.discountId " +
                "WHERE p.priceProduct BETWEEN ? AND ? AND p.status = 1";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, lower);
            ps.setInt(2, upper);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(mapResultSetToProduct(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Get Product Quantity
    public int getProductQuantity(int productId) {
        String query = "SELECT quantity FROM products WHERE productId = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    // Update Product Quantity
    public void updateProductQuantity(int productId, int quantity) {
        String query = "UPDATE products SET quantity = ? WHERE productId = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, quantity);
            ps.setInt(2, productId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Get Product Details by ID
    public Product getDetailProductById(int id) {
        String query = "SELECT p.*, t.typeProductName, s.sizeName, tm.trademarkName, " +
                "d.discountPercentage, " +
                "(p.priceProduct - (p.priceProduct * d.discountPercentage / 100)) AS priceAfterDiscount " +
                "FROM products p " +
                "JOIN TypeProduct t ON p.typeProductId = t.typeProductId " +
                "JOIN Size s ON p.sizeId = s.sizeId " +
                "JOIN Trademark tm ON p.trademarkId = tm.trademarkId " +
                "LEFT JOIN Product_Discount pd ON p.productId = pd.productId " +
                "LEFT JOIN Discount d ON pd.discountId = d.discountId " +
                "WHERE p.productId = ? AND p.status = 1";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return mapResultSetToProduct(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Get Related Products
    public List<Product> getRelatedProduct(int typeProductId, int productId) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT TOP 4 p.*, t.typeProductName, s.sizeName, tm.trademarkName, " +
                "d.discountPercentage, " +
                "(p.priceProduct - (p.priceProduct * d.discountPercentage / 100)) AS priceAfterDiscount " +
                "FROM products p " +
                "JOIN TypeProduct t ON p.typeProductId = t.typeProductId " +
                "JOIN Size s ON p.sizeId = s.sizeId " +
                "JOIN Trademark tm ON p.trademarkId = tm.trademarkId " +
                "LEFT JOIN Product_Discount pd ON p.productId = pd.productId " +
                "LEFT JOIN Discount d ON pd.discountId = d.discountId " +
                "WHERE p.typeProductId = ? AND p.productId != ? " +
                "ORDER BY p.productId DESC";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, typeProductId);
            ps.setInt(2, productId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(mapResultSetToProduct(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Helper Method to Map ResultSet to Product Object
    private Product mapResultSetToProduct(ResultSet rs) throws SQLException {
        return new Product(
                rs.getInt("productId"),
                rs.getString("productName"),
                rs.getString("img"),
                rs.getString("img1"),
                rs.getString("img2"),
                rs.getString("img3"),
                rs.getInt("priceProduct"),
                rs.getInt("typeProductId"),
                rs.getInt("sizeId"),
                rs.getInt("trademarkId"),
                rs.getInt("quantity"),
                rs.getString("describeProduct"),
                rs.getDate("createdDate"),
                rs.getDate("updatedDate"),
                rs.getBoolean("status"),
                rs.getString("typeProductName"),
                rs.getString("sizeName"),
                rs.getString("trademarkName"),
                rs.getFloat("discountPercentage"),
                rs.getInt("priceAfterDiscount")
        );
    }

    // Get All Products with Pagination and Sorting
    public List<Product> getAllProductWithDiscount(int offset, String sort, String typeSort) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT p.*, t.typeProductName, s.sizeName, tm.trademarkName, " +
                "d.discountPercentage, " +
                "(p.priceProduct - (p.priceProduct * d.discountPercentage / 100)) AS priceAfterDiscount " +
                "FROM products p " +
                "JOIN TypeProduct t ON p.typeProductId = t.typeProductId " +
                "JOIN Size s ON p.sizeId = s.sizeId " +
                "JOIN Trademark tm ON p.trademarkId = tm.trademarkId " +
                "LEFT JOIN Product_Discount pd ON p.productId = pd.productId " +
                "LEFT JOIN Discount d ON pd.discountId = d.discountId " +
                "WHERE p.status = 1 " +
                "ORDER BY p." + sort + " " + typeSort + " " +
                "OFFSET ? ROWS FETCH NEXT 9 ROWS ONLY";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, offset);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(mapResultSetToProduct(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getTopProduct(int limit) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT TOP(?) p.*, t.typeProductName, s.sizeName, tm.trademarkName, " +
                "d.discountPercentage, " +
                "(p.priceProduct - (p.priceProduct * d.discountPercentage / 100)) AS priceAfterDiscount " +
                "FROM products p " +
                "JOIN TypeProduct t ON p.typeProductId = t.typeProductId " +
                "JOIN Size s ON p.sizeId = s.sizeId " +
                "JOIN Trademark tm ON p.trademarkId = tm.trademarkId " +
                "LEFT JOIN Product_Discount pd ON p.productId = pd.productId " +
                "LEFT JOIN Discount d ON pd.discountId = d.discountId";

        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, limit);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getInt("productId"),
                        rs.getString("productName"),
                        rs.getString("img"),
                        rs.getString("img1"),
                        rs.getString("img2"),
                        rs.getString("img3"),
                        rs.getInt("priceProduct"),
                        rs.getInt("typeProductId"),
                        rs.getInt("sizeId"),
                        rs.getInt("trademarkId"),
                        rs.getInt("quantity"),
                        rs.getString("describeProduct"),
                        rs.getDate("createdDate"),
                        rs.getDate("updatedDate"),
                        rs.getBoolean("status"),
                        rs.getString("typeProductName"),
                        rs.getString("sizeName"),
                        rs.getString("trademarkName"),
                        rs.getFloat("discountPercentage"),
                        rs.getInt("priceAfterDiscount")
                ));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public int getTotalProduct() {
        String query = "SELECT COUNT(*) AS total FROM products WHERE status = 1";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("total");  // Use column alias for clarity
            }
        } catch (SQLException e) {
            System.out.println("SQL Exception: " + e.getMessage());
        }
        return 0;  // Return 0 if no result found or an exception occurs
    }

    public boolean checkUserBuyProduct(int productId, int userId) {
        String query = "SELECT * FROM billdetail bd " +
                "JOIN bill b ON bd.billId = b.billId " +
                "WHERE b.userId = ? AND bd.productId = ?";

        try {
            // Ensure you're using a valid SQL Server connection

            if (connection != null) {
                PreparedStatement ps = connection.prepareStatement(query);

                // Set the parameters for userId and productId
                ps.setInt(1, userId);
                ps.setInt(2, productId);

                // Execute the query and check if a result exists
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    return true;  // User bought the product
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Print exception for debugging
        }
        return false;  // No purchase found
    }

    public Product getProductById(int id) {
        String query = "SELECT p.*, t.typeProductName, s.sizeName, tm.trademarkName FROM products p "
                + "JOIN TypeProduct t ON p.typeProductId = t.typeProductId "
                + "JOIN Size s ON p.sizeId = s.sizeId "
                + "JOIN Trademark tm ON p.trademarkId = tm.trademarkId "
                + "WHERE productId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Product product = new Product(
                        rs.getInt(1),
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
                        rs.getString(18)
                );
                return product;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

}
