package Database;

import Model.Payment;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PaymentDB extends DBContext {
    public PaymentDB() {
        super();
    }

    public boolean deletePayment(int paymentId) {
        String query = "DELETE FROM payment WHERE paymentId = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, paymentId);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
        return true;
    }

    public void updatePayment(int paymentId, String paymentName) {
        String query = "UPDATE payment SET typePayment = ? WHERE paymentId = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, paymentName);
            ps.setInt(2, paymentId);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public Payment getPaymentById(int paymentId) {
        String query = "SELECT * FROM payment WHERE paymentId = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, paymentId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Payment(rs.getInt("paymentId"),
                        rs.getString("typePayment"));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Payment> getAllPayment() {
        List<Payment> list = new ArrayList<>();
        String query = "SELECT * FROM payment";
        try (PreparedStatement ps = connection.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(new Payment(rs.getInt("paymentId"),
                        rs.getString("typePayment")));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public boolean addPayment(String paymentName) {
        String query = "INSERT INTO payment (typePayment) VALUES (?)";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, paymentName);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }
}
