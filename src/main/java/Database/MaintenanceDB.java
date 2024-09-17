package Database;

import Model.Maintenance;
import Model.MaintenanceProduct;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MaintenanceDB extends DBContext{
    public boolean cancelByID(int id) {
        String query = "UPDATE maintenance SET isCancel = ? WHERE maintenanceID = ?";
        try{
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setBoolean(1, true);
            ps.setInt(2, id);
            ps.executeUpdate();
        }catch (Exception e){
            System.out.println(e);
            return false;
        }
        return true;
    }
    public boolean completeMaintenance(int id) {
        String query = "UPDATE maintenance SET " +
                "maintenanceStatus = 1, " +
                "updatedDate = CURRENT_TIMESTAMP " +
                "WHERE maintenanceId = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, id);

            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public boolean updateMaintenance(Maintenance maintenance) {
        String query = "UPDATE maintenance SET " +
                "maintenanceName = ?, " +
                "maintenanceDescription = ?, " +
                "maintenanceDate = ?, " +
                "maintenanceTime = ?, " +
                "maintenanceStatus = ?, " +
                "updatedDate = CURRENT_TIMESTAMP " +
                "WHERE maintenanceId = ?";

        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, maintenance.getMaintenanceName());
            ps.setString(2, maintenance.getMaintenanceDescription());
            ps.setString(3, maintenance.getMaintenanceDate());
            ps.setString(4, maintenance.getMaintenanceTime());
            ps.setBoolean(5, maintenance.isMaintenanceStatus());
            ps.setInt(6, maintenance.getMaintenanceId());

            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<MaintenanceProduct> getAllProductMaintenanceByID(int id) {
        String query = "SELECT \n" +
                "    m.maintenanceId,\n" +
                "    m.maintenanceName,\n" +
                "    m.maintenanceDescription,\n" +
                "    m.maintenanceDate,\n" +
                "    m.maintenanceTime,\n" +
                "    m.maintenanceStatus,\n" +
                "    m.userId,\n" +
                "    m.createdDate,\n" +
                "    m.updatedDate,\n" +
                "    p.productId,\n" +
                "    p.productName,\n" +
                "    p.img,\n" +
                "    p.img1,\n" +
                "    p.img2,\n" +
                "    p.img3,\n" +
                "    p.priceProduct,\n" +
                "    p.typeProductId,\n" +
                "    p.sizeId,\n" +
                "    p.trademarkId,\n" +
                "    p.quantity,\n" +
                "    p.describeProduct,\n" +
                "    p.createDate,\n" +
                "    p.updateDate,\n" +
                "    p.sizeName,\n" +
                "    p.trademarkName,\n" +
                "    p.productTypeName,\n" +
                "    p.discountPercentage,\n" +
                "    p.priceAfterDiscount,\n" +
                "    p.status\n" +
                "FROM \n" +
                "    maintenance m\n" +
                "JOIN \n" +
                "    maintenance_products mp ON m.maintenanceId = mp.maintenanceId\n" +
                "JOIN \n" +
                "    product p ON mp.productId = p.productId\n" +
                "WHERE \n" +
                "    m.maintenanceId = ?";
        List<MaintenanceProduct> maintenanceProducts = new ArrayList<>();

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                MaintenanceProduct maintenanceProduct = new MaintenanceProduct(
                        rs.getInt("maintenanceId"),
                        rs.getInt("productId"),
                        rs.getString("maintenanceName"),
                        rs.getString("maintenanceDescription"),
                        rs.getString("maintenanceDate"),
                        rs.getString("maintenanceTime"),
                        rs.getBoolean("maintenanceStatus"),
                        rs.getInt("userId"),
                        rs.getDate("createdDate"),
                        rs.getDate("updatedDate"),
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
                        rs.getDate("createDate"),
                        rs.getDate("updateDate"),
                        rs.getString("sizeName"),
                        rs.getString("trademarkName"),
                        rs.getString("productTypeName"),
                        rs.getFloat("discountPercentage"),
                        rs.getInt("priceAfterDiscount"),
                        rs.getBoolean("status")
                );
                maintenanceProducts.add(maintenanceProduct);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return maintenanceProducts;
    }

    public Maintenance getMaintenanceById(int id){
        String query = "SELECT * FROM maintenance WHERE maintenanceId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Maintenance(

                        rs.getInt("maintenanceId"),
                        rs.getString("maintenanceName"),
                        rs.getString("maintenanceDescription"),
                        rs.getString("maintenanceDate"),
                        rs.getString("maintenanceTime"),
                        rs.getBoolean("maintenanceStatus"),
                        rs.getInt("userId"),
                        rs.getString("createdDate"),
                        rs.getString("isCancel"));
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    public List<Maintenance> getAllMaintenanceByUserID(int userID){
        String query = "SELECT * FROM maintenance WHERE userId = ?";
        List<Maintenance> listMaintenance = new ArrayList<>();
        try{
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, userID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                System.out.println(rs.getBoolean("isCancel"));
                listMaintenance.add(new Maintenance(
                        rs.getInt("maintenanceId"),
                        rs.getString("maintenanceName"),
                        rs.getString("maintenanceDescription"),
                        rs.getString("maintenanceDate"),
                        rs.getString("maintenanceTime"),
                        rs.getBoolean("maintenanceStatus"),
                        rs.getInt("userId"),
                        rs.getString("createdDate"),
                        rs.getBoolean("isCancel")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listMaintenance;
    }
    // Delete maintenance
    public void deleteMaintenance(int maintenanceId) {
        try {
            String sql = "DELETE FROM maintenance_products WHERE maintenanceId = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, maintenanceId);
            ps.executeUpdate();
            sql = "DELETE FROM Maintenance WHERE maintenanceId = ?";
            ps = connection.prepareStatement(sql);
            ps.setInt(1, maintenanceId);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
//    Add new maintenance
    public boolean addMaintenance(String name, String description, String date, String time, int userId, List<Integer> productIds, boolean status) {
        try {
            String sql = "INSERT INTO maintenance (maintenanceName, maintenanceDescription, maintenanceDate, maintenanceTime, userId, maintenanceStatus) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, description);
            ps.setString(3, date);
            ps.setString(4, time);
            ps.setInt(5, userId);
            ps.setBoolean(6, status);
            ps.executeUpdate();
            sql = "SELECT MAX(maintenanceId) AS maintenanceId FROM maintenance";
            ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            int maintenanceId = 0;
            if (rs.next()) {
                maintenanceId = rs.getInt("maintenanceId");
            }
            for (int productId : productIds) {
                sql = "INSERT INTO maintenance_products (maintenanceId, productId) VALUES (?, ?)";
                ps = connection.prepareStatement(sql);
                ps.setInt(1, maintenanceId);
                ps.setInt(2, productId);
                ps.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
        return true;
    }

    public List<Maintenance> getAllMaintenance() {
//        String query = "SELECT m.*, u.*, mp.* " +
//                "FROM " +
//                "    maintenance m " +
//                "LEFT JOIN " +
//                "    maintenance_products mp ON m.maintenanceId = mp.maintenanceId " +
//                "LEFT JOIN " +
//                "    users u ON m.userId = u.userID;";
        String query = "SELECT * FROM maintenance";
        List<Maintenance> list = new ArrayList<>();

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Maintenance maintenance = new Maintenance();
                maintenance.setMaintenanceId(rs.getInt("maintenanceId"));
                maintenance.setMaintenanceName(rs.getString("maintenanceName"));
                maintenance.setMaintenanceDescription(rs.getString("maintenanceDescription"));
                maintenance.setMaintenanceDate(rs.getString("maintenanceDate"));
                maintenance.setMaintenanceTime(rs.getString("maintenanceTime"));
                maintenance.setUserId(rs.getInt("userId"));
                maintenance.setMaintenanceStatus(rs.getBoolean("maintenanceStatus"));
                maintenance.SetExpectedReturnDate();
                maintenance.setCancel(rs.getBoolean("isCancel"));
                list.add(maintenance);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return List.of();
    }
}
