package Database;

import Database.DBContext;
import Model.Review;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ReviewDB extends DBContext {
    public boolean checkReview(int userID, int productID){
        String query = "SELECT * FROM review WHERE userID=? AND productId=?";
        try{
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, userID);
            ps.setInt(2, productID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()){
                return true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }
    // updateReview
    public boolean updateReview(int reviewId, String content, int starQuantity) {
        String query = "UPDATE review SET content = ?, starQuantity = ? WHERE reviewId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, content);
            ps.setInt(2, starQuantity);
            ps.setInt(3, reviewId);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e);
            throw new RuntimeException(e);
        }
    }

    // getReviewById
    public Review getReviewById(int reviewId) {
        String query = "select r.*, u.name, u.avatar, p.productName from review r\n"
                + "join users u on r.userId = u.userID\n"
                + "join products p on r.productId = p.productId\n"
                + "where r.reviewId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, reviewId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Review(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getDate(6),
                        rs.getDate(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }
    public List<Review> getAllReviewByProductId(int productId) {
        List<Review> list = new ArrayList<>();
        String query = "select r.*, u.name, u.avatar, p.productName from review r\n"
                + "join users u on r.userId = u.userID\n"
                + "join products p on r.productId = p.productId\n"
                + "where r.productId = ?";
        try {

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Review(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getDate(6),
                        rs.getDate(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10)));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public boolean addReview(Review review) {
        String query = "INSERT INTO review (productId, userId, starQuantity, content) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, review.getProductId());
            ps.setInt(2, review.getUserId());
            ps.setInt(3, review.getStarQuantity());
            ps.setString(4, review.getContent());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean deleteReview(int reviewId) {
        String query = "DELETE FROM review WHERE reviewId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, reviewId);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }
}
