package Database;

import Model.Transport;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TransportDB extends DBContext {



    public void deleteTransport(int transportId) {
        String query = "DELETE FROM transport WHERE transportId = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, transportId);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void updateTransport(Transport transport) {
        String query = "UPDATE transport SET transportName = ?, priceTransPort = ?, descriptionTransport = ? WHERE transportId = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, transport.getTransportName());
            ps.setInt(2, transport.getPriceTransPort());
            ps.setString(3, transport.getDescriptionTransport());
            ps.setInt(4, transport.getTransportId());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public Transport getTransportById(int transportId) {
        String query = "SELECT * FROM transport WHERE transportId = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, transportId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Transport(rs.getInt("transportId"),
                        rs.getString("transportName"),
                        rs.getInt("priceTransPort"),
                        rs.getString("descriptionTransport"));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean addTransport(String transportName, int priceTransPort, String descriptionTransport) {
        String query = "INSERT INTO transport (transportName, priceTransPort, descriptionTransport) VALUES (?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, transportName);
            ps.setInt(2, priceTransPort);
            ps.setString(3, descriptionTransport);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public List<Transport> getAllTransport() {
        List<Transport> list = new ArrayList<>();
        String query = "SELECT * FROM transport";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Transport(rs.getInt("transportId"),
                        rs.getString("transportName"),
                        rs.getInt("priceTransPort"),
                        rs.getString("descriptionTransport")));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
}
