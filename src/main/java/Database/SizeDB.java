package Database;

import Model.Size;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SizeDB extends DBContext{
    // getSizeById
    public Size getSizeById(int id) {
        String sql = "select * from size where sizeId = ?";
        try{
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                return new Size(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }
    public boolean deleteSize(int sizeId) {
        String query = "delete from Size where sizeId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, sizeId);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
        return true;
    }
    public boolean updateSize(String sizeId, String sizeName, String description, String diameter) {
        String query = "UPDATE Size SET sizeName = ?, describeSize = ?, weight = ? WHERE sizeId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, sizeName);
            ps.setString(2, description);
            ps.setString(3, diameter);
            ps.setString(4, sizeId);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
        return true;
    }

    public List<Size> getAllSize() {
        List<Size> list = new ArrayList<>();
        String query = "select * from Size";
        try {

            PreparedStatement   ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Size(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDate(5),
                        rs.getDate(6)
                ));
            }
        } catch (Exception ignored) {
        }
        return list;
    }

    public boolean addSize(Size size) {
        String query = "INSERT INTO Size (sizeName, describeSize, weight) VALUES (?, ?, ?)";
        try {

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, size.getSizeName());
            ps.setString(2, size.getDescribeSize());
            ps.setString(3, size.getWeight());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }
}
