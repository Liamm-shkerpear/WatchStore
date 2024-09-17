package Database;

import Database.DBContext;
import Model.Voucher;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class VoucherDB extends DBContext {
    public boolean deleteVoucher(int voucherID) {
        String query = "DELETE FROM voucher WHERE voucherId = ?";
        try{
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, voucherID);
            ps.executeUpdate();
        } catch (Exception e){
            System.out.println(e.getMessage());
            return false;
        }
        return true;
    }
    public boolean updateVoucher(Voucher voucher) {
        String query = "UPDATE voucher SET code = ?, value = ?, typeSale = ?, status = ?, describeVoucher = ?, maxSale = ?, startDate = ?, endDate = ? WHERE voucherId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, voucher.getCode());
            ps.setInt(2, voucher.getValue());
            ps.setBoolean(3, voucher.isTypeSale());
            ps.setBoolean(4, voucher.isStatus());
            ps.setString(5, voucher.getDescribeVoucher());
            ps.setInt(6, voucher.getMaxSale());
            ps.setDate(7, voucher.getStartDate());
            ps.setDate(8, voucher.getEndDate());
            ps.setInt(9, voucher.getVoucherId());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public Voucher getVoucherById(int id) {
        String query = "SELECT * FROM voucher WHERE voucherId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Voucher(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getBoolean(4),
                        rs.getBoolean(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getDate(8),
                        rs.getDate(9),
                        rs.getDate(10),
                        rs.getDate(11));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }
    public Voucher getVoucherByCode(String code) {
        String query = "SELECT * FROM voucher WHERE code = ? AND status = 1 AND startDate <= GETDATE() AND endDate >= GETDATE()";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, code);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Voucher(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getBoolean(4),
                        rs.getBoolean(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getDate(8),
                        rs.getDate(9),
                        rs.getDate(10),
                        rs.getDate(11));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean addVoucher(Voucher voucher) {
        String query = "INSERT INTO voucher (code, value, typeSale, status, describeVoucher, maxSale, startDate, endDate) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, voucher.getCode());
            ps.setInt(2, voucher.getValue());
            ps.setBoolean(3, voucher.isTypeSale());
            ps.setBoolean(4, voucher.isStatus());
            ps.setString(5, voucher.getDescribeVoucher());
            ps.setInt(6, voucher.getMaxSale());
            ps.setDate(7, voucher.getStartDate());
            ps.setDate(8, voucher.getEndDate());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public List<Voucher> getAllVoucher() {
        List<Voucher> list = new ArrayList<>();
        String query = "SELECT * FROM voucher";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Voucher(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getBoolean(4),
                        rs.getBoolean(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getDate(8),
                        rs.getDate(9),
                        rs.getDate(10),
                        rs.getDate(11)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public boolean unactiveVoucher(int voucherId) {
        String query = "UPDATE voucher SET status = 0 WHERE voucherId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, voucherId);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean activeVoucher(int voucherId) {
        String query = "UPDATE voucher SET status = 1 WHERE voucherId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, voucherId);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }
}
