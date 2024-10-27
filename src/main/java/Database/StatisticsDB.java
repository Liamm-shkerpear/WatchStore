package Database;

import Database.DBContext;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class StatisticsDB extends DBContext {

    // getRevenueBetweenDates
    public Map<String, Long> getRevenueBetweenDates(String fromDate, String toDate) {
        Map<String, Long> revenueData = new LinkedHashMap<>();
        String query = "SELECT CAST(createdDate AS DATE) AS date, SUM(totalPrice) AS dailyRevenue \n" +
                "FROM bill \n" +
                "WHERE CAST(createdDate AS DATE) BETWEEN ? AND ? \n" +
                "GROUP BY CAST(createdDate AS DATE)\n";
        try (
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, fromDate);
            ps.setString(2, toDate);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    String date = rs.getString("date");
                    Long revenue = rs.getLong("dailyRevenue");
                    revenueData.put(date, revenue);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return revenueData;
    }


    public Map<String, Object> getStatistics() throws SQLException, ClassNotFoundException {
        Map<String, Object> statistics = new HashMap<>();
        String dailyRevenueQuery = "SELECT SUM(totalPrice) AS dailyRevenue FROM bill WHERE CAST(createdDate AS DATE) = CAST(GETDATE() AS DATE)";
        String monthlyRevenueQuery = "SELECT SUM(totalPrice) AS monthlyRevenue FROM bill WHERE MONTH(createdDate) = MONTH(GETDATE()) AND YEAR(createdDate) = YEAR(GETDATE())";
        String yearlyRevenueQuery = "SELECT SUM(totalPrice) AS yearlyRevenue FROM bill WHERE YEAR(createdDate) = YEAR(GETDATE())";
        String customerCountQuery = "SELECT COUNT(DISTINCT userId) AS customerCount FROM bill";
        String soldItemsCountQuery = "SELECT SUM(quantity) AS soldItemsCount FROM billdetail";
// Get productName, productId of product through productID
        String bestSellerQuery = "SELECT productName, billdetail.productId as productId, SUM(billdetail.quantity) AS soldQuantity FROM billdetail JOIN products ON billdetail.productId = products.productId GROUP BY billdetail.productId, productName ORDER BY soldQuantity DESC OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY";
        String soldItemThisMonth = "SELECT SUM(quantity) AS soldItemsCount FROM billdetail WHERE MONTH(createdDate) = MONTH(GETDATE()) AND YEAR(createdDate) = YEAR(GETDATE())";
        String soldItemToday = "SELECT SUM(quantity) AS soldItemsCount FROM billdetail WHERE CAST(createdDate AS DATE) = CAST(GETDATE() AS DATE)";
//        List all the product every month this year
        List<Map<String, Object>> soldItemsThisYear = new ArrayList<>();
        String soldItemsThisYearQuery = "SELECT MONTH(createdDate) as month, SUM(quantity) as soldItemsCount FROM billdetail WHERE YEAR(createdDate) = YEAR(GETDATE()) GROUP BY MONTH(createdDate)";

        try (PreparedStatement ps = connection.prepareStatement(dailyRevenueQuery); ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                statistics.put("dailyRevenue", rs.getLong("dailyRevenue"));
            }
        }

        // Monthly Revenue
        try (PreparedStatement ps = connection.prepareStatement(monthlyRevenueQuery); ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                statistics.put("monthlyRevenue", rs.getLong("monthlyRevenue"));
            }
        }

        // Yearly Revenue
        try (PreparedStatement ps = connection.prepareStatement(yearlyRevenueQuery); ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                statistics.put("yearlyRevenue", rs.getLong("yearlyRevenue"));
            }
        }

        // Customer Count
        try (PreparedStatement ps = connection.prepareStatement(customerCountQuery); ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                statistics.put("customerCount", rs.getLong("customerCount"));
            }
        }

        // Sold Items Count
        try (PreparedStatement ps = connection.prepareStatement(soldItemsCountQuery); ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                statistics.put("soldItemsCount", rs.getLong("soldItemsCount"));
            }
        }

        // Best Seller
        try (PreparedStatement ps = connection.prepareStatement(bestSellerQuery); ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                statistics.put("bestSeller", rs.getString("productName"));
                statistics.put("bestSellerID", rs.getInt("productId"));
                statistics.put("bestSellerQuantity", rs.getInt("soldQuantity"));
            }
        }

        // Sold Items This Month
        try (PreparedStatement ps = connection.prepareStatement(soldItemThisMonth); ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                statistics.put("soldItemsThisMonth", rs.getLong("soldItemsCount"));
            }
        }

        // Sold Items Today
        try (PreparedStatement ps = connection.prepareStatement(soldItemToday); ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                statistics.put("soldItemsToday", rs.getLong("soldItemsCount"));
            }
        }

        try (PreparedStatement ps = connection.prepareStatement(soldItemsThisYearQuery); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Map<String, Object> soldItem = new HashMap<>();
                soldItem.put("month", rs.getInt("month"));
                soldItem.put("soldItemsCount", rs.getLong("soldItemsCount"));
                soldItemsThisYear.add(soldItem);
            }
            System.out.println(soldItemsThisYear);
            statistics.put("soldItemsThisYear", soldItemsThisYear);
        }

        return statistics;
    }
}
