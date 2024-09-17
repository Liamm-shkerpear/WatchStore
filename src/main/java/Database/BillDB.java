package Database;

import Database.DBContext;
import Model.*;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class BillDB extends DBContext {
    public void deleteBillAdmin(int billId) {
        String deleteBillDetailQuery = "DELETE FROM billDetail WHERE billId = ?";

        String deleteBillQuery = "DELETE FROM bill WHERE billId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(deleteBillDetailQuery);
            ps.setInt(1, billId);
            ps.executeUpdate();

            ps = connection.prepareStatement(deleteBillQuery);
            ps.setInt(1, billId);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    public BillDB() {
        super();
    }

    public void confirmShipped(int billId) {
        String query = "UPDATE bill SET statusBill = 'Delivered' WHERE billId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, billId);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public List<Bill> getAllBillToShipper() {
        List<Bill> list = new ArrayList<>();
        String query = "SELECT b.*, t.transportName, p.typePayment FROM bill b " +
                "JOIN transport t ON b.transportId = t.transportId " +
                "JOIN payment p ON b.paymentId = p.paymentId " +
                "WHERE b.statusBill = 'Confirmed' ORDER BY b.createdDate ASC";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Bill(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getFloat(12),
                        rs.getInt(13),
                        rs.getInt(14),
                        rs.getInt(15),
                        rs.getInt(16),
                        rs.getDate(17),
                        rs.getDate(18),
                        rs.getString(19),
                        rs.getString(20)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        System.out.println(list.size());
        return list;
    }

    public boolean buyAgain(int billID) {
        String query = "INSERT INTO bill (userId, userName, email, city, district, phone, address, note, voucherCode, transportId, paymentId, totalPrice) " +
                "SELECT userId, userName, email, city, district, phone, address, note, voucherCode, transportId, paymentId, totalPrice " +
                "FROM bill WHERE billId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, billID);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean checkQuantity(int billID) {
        String query = "SELECT bd.productId, bd.quantity, p.quantityProduct AS quantityInStock " +
                "FROM billDetail bd " +
                "JOIN products p ON bd.productId = p.productId " +
                "WHERE bd.billId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, billID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                if (rs.getInt("quantity") > rs.getInt("quantityInStock")) {
                    return false;
                }
            }
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public void addBillDetail(List<CartProducts> listCartProducts, int billId) {
        String query = "INSERT INTO billDetail (billId, productId, quantity, priceBillDetail) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            for (CartProducts c : listCartProducts) {
                ps.setInt(1, billId);
                ps.setInt(2, c.getProduct().getProductId());
                ps.setInt(3, c.getQuantity());
                if (c.getProduct().getPriceAfterDiscount() == 0) {
                    ps.setInt(4, c.getQuantity() * c.getProduct().getPriceProduct());
                } else {
                    ps.setInt(4, c.getQuantity() * c.getProduct().getPriceAfterDiscount());
                }
                ps.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public Bill addBill(Bill bill) {
        String query = "INSERT INTO bill (userId, userName, email, city, district, phone, address, note, voucherCode, transportId, paymentId, totalPrice) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, bill.getUserId());
            ps.setString(2, bill.getUserName());
            ps.setString(3, bill.getEmail());
            ps.setString(4, bill.getCity());
            ps.setString(5, bill.getDistrict());
            ps.setString(6, bill.getPhone());
            ps.setString(7, bill.getAddress());
            ps.setString(8, bill.getNote());
            ps.setString(9, bill.getVoucherCode());
            ps.setInt(10, bill.getTransportId());
            ps.setInt(11, bill.getPaymentId());
            ps.setInt(12, bill.getTotalPrice());
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            while (rs.next()) {
                bill.setBillId(rs.getInt(1));
            }
            return bill;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public Bill getBillById(int billId) {
        String query = "SELECT b.*, t.transportName, p.typePayment FROM bill b " +
                "JOIN transport t ON b.transportId = t.transportId " +
                "JOIN payment p ON b.paymentId = p.paymentId " +
                "JOIN users u ON b.userId = u.userId " +
                "WHERE b.billId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, billId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Bill(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getFloat(12),
                        rs.getInt(13),
                        rs.getInt(14),
                        rs.getInt(15),
                        rs.getInt(16),
                        rs.getDate(17),
                        rs.getDate(18),
                        rs.getString(19),
                        rs.getString(20));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public List<BillDetail> getBillDetailByBillId(int billId) {
        List<BillDetail> list = new ArrayList<>();
        String query = "SELECT p.*, " +
                "(p.priceProduct - (p.priceProduct * ISNULL(d.discountPercentage, 0) / 100)) AS priceAfterDiscount, " +
                "d.*, bd.*, bd.quantity as quantityBill " +
                "FROM billDetail bd " +
                "JOIN products p ON bd.productId = p.productId " +
                "LEFT JOIN bill b ON b.billId = bd.billId " +
                "LEFT JOIN product_discount pd ON p.productId = pd.productId " +
                "LEFT JOIN discount d ON pd.discountId = d.discountId " +
                "LEFT JOIN voucher v ON v.code = b.voucherCode " +
                "WHERE bd.billId = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, billId);
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
                        rs.getInt(16));
                Discount discount = new Discount(rs.getInt(17),
                        rs.getFloat(18),
                        rs.getDate(19),
                        rs.getDate(20),
                        rs.getBoolean(21));
                list.add(new BillDetail(rs.getInt("billDetailId"),
                        rs.getInt("productId"),
                        rs.getInt("billId"),
                        rs.getInt("quantityBill"),
                        rs.getInt("priceBillDetail"),
                        rs.getDate("createdDate"),
                        rs.getDate("updatedDate"),
                        product,
                        discount));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void approveBill(Bill bill) {
        String query = "UPDATE bill SET statusBill = ?, employeeId = ? WHERE billId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, bill.getStatusBill());
            ps.setInt(2, bill.getEmployeeId());
            ps.setInt(3, bill.getBillId());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void updateBillByAdmin(Bill bill) {
        String query = "UPDATE bill SET userName = ?, email = ?, city = ?, district = ?, phone = ?, address = ?, " +
                "note = ?, statusBill = ?, voucherCode = ?, vat = ?, transportId = ?, paymentId = ?, totalPrice = ? " +
                "WHERE billId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, bill.getUserName());
            ps.setString(2, bill.getEmail());
            ps.setString(3, bill.getCity());
            ps.setString(4, bill.getDistrict());
            ps.setString(5, bill.getPhone());
            ps.setString(6, bill.getAddress());
            ps.setString(7, bill.getNote());
            ps.setString(8, bill.getStatusBill());
            ps.setString(9, bill.getVoucherCode());
            ps.setFloat(10, bill.getVat());
            ps.setInt(11, bill.getTransportId());
            ps.setInt(12, bill.getPaymentId());
            ps.setFloat(13, bill.getTotalPrice());
            ps.setInt(14, bill.getBillId());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public List<Bill> getAllBill() {
        List<Bill> list = new ArrayList<>();
        String query = "SELECT b.*, t.transportName, p.typePayment FROM bill b " +
                "JOIN transport t ON b.transportId = t.transportId " +
                "JOIN payment p ON b.paymentId = p.paymentId " +
                "ORDER BY b.createdDate ASC";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Bill(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getFloat(12),
                        rs.getInt(13),
                        rs.getInt(14),
                        rs.getInt(15),
                        rs.getInt(16),
                        rs.getDate(17),
                        rs.getDate(18),
                        rs.getString(19),
                        rs.getString(20)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Bill> getBillByUserId(int userId) {
        List<Bill> list = new ArrayList<>();
        String query = "SELECT b.*, t.transportName, p.typePayment FROM bill b " +
                "JOIN transport t ON b.transportId = t.transportId " +
                "JOIN payment p ON b.paymentId = p.paymentId " +
                "JOIN users u ON b.userId = u.userId " +
                "WHERE b.userId = ? ORDER BY b.createdDate ASC";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Bill(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getFloat(12),
                        rs.getInt(13),
                        rs.getInt(14),
                        rs.getInt(15),
                        rs.getInt(16),
                        rs.getDate(17),
                        rs.getDate(18),
                        rs.getString(19),
                        rs.getString(20)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public void deleteBill(int billId) {
        String query1 = "DELETE FROM billDetail WHERE billId = ?";
        String query2 = "DELETE FROM bill WHERE billId = ?";
        try {
            PreparedStatement ps1 = connection.prepareStatement(query1);
            ps1.setInt(1, billId);
            ps1.executeUpdate();
            PreparedStatement ps2 = connection.prepareStatement(query2);
            ps2.setInt(1, billId);
            ps2.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void deleteBillDetail(int billDetailId) {
        String query = "DELETE FROM billDetail WHERE billDetailId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, billDetailId);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void cancelBill(int billId) {
        String query = "UPDATE bill SET statusBill = 'Canceled' WHERE billId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, billId);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public List<Bill> getUserBills(int userId) {
        List<Bill> list = new ArrayList<>();
        String query = "SELECT b.billId, b.userId, b.userName, b.email, b.city, b.district, " +
                "b.phone, b.address, b.note, b.statusBill, b.voucherCode, b.vat, " +
                "b.transportId, b.paymentId, b.employeeId, b.totalPrice, " +
                "b.createdDate, b.updatedDate, t.transportName, p.typePayment " +
                "FROM bill b " +
                "JOIN transport t ON b.transportId = t.transportId " +
                "JOIN payment p ON b.paymentId = p.paymentId " +
                "WHERE b.userId = ? " +
                "ORDER BY b.createdDate ASC";

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Bill(rs.getInt("billId"),
                        rs.getInt("userId"),
                        rs.getString("userName"),
                        rs.getString("email"),
                        rs.getString("city"),
                        rs.getString("district"),
                        rs.getString("phone"),
                        rs.getString("address"),
                        rs.getString("note"),
                        rs.getString("statusBill"),
                        rs.getString("voucherCode"),
                        rs.getFloat("vat"),
                        rs.getInt("transportId"),
                        rs.getInt("paymentId"),
                        rs.getInt("employeeId"),
                        rs.getInt("totalPrice"),
                        rs.getDate("createdDate"),
                        rs.getDate("updatedDate"),
                        rs.getString("transportName"),
                        rs.getString("typePayment")));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

}
