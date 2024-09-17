package Database;

import Database.DBContext;
import Model.TypeAccount;
import Model.User;
import Utils.Encrypt;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class UserDB extends DBContext {

    public UserDB() {
        super();
    }
    // getUserByEmail
    public User getUserByEmail(String email) {
        String query = "SELECT * FROM user WHERE email = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()){
                return new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getDate(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getBoolean(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getInt(11),
                        rs.getString(12),
                        rs.getString(13),
                        rs.getBoolean(14),
                        rs.getString(15),
                        rs.getDate(16),
                        rs.getDate(17),
                        rs.getBoolean(18),
                        rs.getString(19));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateAvatar(String avatarPath, int userId) {
        String query = "UPDATE users SET avatar = ? WHERE userID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, avatarPath);
            ps.setInt(2, userId);
            ps.executeUpdate();
        } catch (Exception e){
            System.out.println(e.getMessage());
            return false;
        }
        return true;
    }

    public void updateUser(User user) {
        String query = "UPDATE users SET name = ?, userDOB = ?, email = ?, phoneNumber = ?, gender = ?, address = ?, avatar = ?, status = ?, description = ?, typeAccountId = ? WHERE userId = ?";
        try {
            
            PreparedStatement ps =  connection.prepareStatement(query);
            ps.setString(1, user.getName());
            ps.setDate(2, user.getUserDOB());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPhoneNumber());
            ps.setBoolean(5, user.isGender());
            ps.setString(6, user.getAddress());
            ps.setString(7, user.getAvatar());
            ps.setBoolean(8, user.isStatus());
            ps.setString(9, user.getDescription());
            ps.setInt(10, user.getTypeAccountId());
            ps.setInt(11, user.getUserID());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public User findUserById(int id) {
        String query = "SELECT u.*, t.typeAccountName " +
                "FROM users u " +
                "JOIN typeAccount t ON u.typeAccountId = t.typeAccountId " +
                "WHERE u.userID = ?";
        try {
            
            
            PreparedStatement ps =  connection.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getDate(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getBoolean(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getInt(11),
                        rs.getString(12),
                        rs.getString(13),
                        rs.getBoolean(14),
                        rs.getString(15),
                        rs.getDate(16),
                        rs.getDate(17),
                        rs.getBoolean(18),
                        rs.getString(19));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public User findUserByGoogleId(String googleId) {
        String query = "SELECT * FROM users WHERE idGoogle = ?";
        try {
            
            
            PreparedStatement ps =  connection.prepareStatement(query);
            ps.setString(1, googleId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getDate(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getBoolean(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getInt(11),
                        rs.getString(12),
                        rs.getString(13),
                        rs.getBoolean(14),
                        rs.getString(15),
                        rs.getDate(16),
                        rs.getDate(17),
                        rs.getBoolean(18));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public User findUserByFBId(String fbId)  {
        String query = "SELECT * FROM users WHERE idFacebook = ?";
        try {
            
            
            PreparedStatement ps =  connection.prepareStatement(query);
            ps.setString(1, fbId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getDate(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getBoolean(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getInt(11),
                        rs.getString(12),
                        rs.getString(13),
                        rs.getBoolean(14),
                        rs.getString(15),
                        rs.getDate(16),
                        rs.getDate(17),
                        rs.getBoolean(18));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public User findUserByEmail(String email) {
        String query = "SELECT * FROM users WHERE email = ?";
        try {
            
            PreparedStatement ps =  connection.prepareStatement(query);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getDate(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getBoolean(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getInt(11),
                        rs.getString(12),
                        rs.getString(13),
                        rs.getBoolean(14),
                        rs.getString(15),
                        rs.getDate(16),
                        rs.getDate(17),
                        rs.getBoolean(18));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean editInfoUser(User user) {
        String query = "UPDATE users SET name = ?, userDOB = ?, email = ?, phoneNumber = ?, gender = ?, address = ?, description = ?, avatar = ? WHERE userID = ?";
        try {
            
            PreparedStatement ps =  connection.prepareStatement(query);
            ps.setString(1, user.getName());
            ps.setDate(2, user.getUserDOB());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPhoneNumber());
            ps.setBoolean(5, user.isGender());
            ps.setString(6, user.getAddress());
            ps.setString(7, user.getDescription());
            ps.setString(8, user.getAvatar());
            ps.setInt(9, user.getUserID());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public List<User> getAllUser() {
        List<User> list = new ArrayList<>();
        String query = "SELECT u.*, ta.typeAccountName FROM users u\n"
                + "JOIN typeaccount ta ON u.typeAccountId = ta.typeAccountId";
        try {
            
            PreparedStatement ps =  connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getDate(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getBoolean(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getInt(11),
                        rs.getString(12),
                        rs.getString(13),
                        rs.getBoolean(14),
                        rs.getString(15),
                        rs.getDate(16),
                        rs.getDate(17),
                        rs.getBoolean(18),
                        rs.getString(19)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public User getUserById(int userId) {
        String query = "SELECT * FROM users WHERE userId = ?";
        try {
            
            PreparedStatement ps =  connection.prepareStatement(query);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getDate(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getBoolean(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getInt(11),
                        rs.getString(12),
                        rs.getString(13),
                        rs.getBoolean(14),
                        rs.getString(15),
                        rs.getDate(16),
                        rs.getDate(17),
                        rs.getBoolean(18));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public List<TypeAccount> getAllTypeAccount() {
        List<TypeAccount> list = new ArrayList<>();
        String query = "SELECT * FROM typeaccount";
        try {
            
            PreparedStatement ps =  connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new TypeAccount(rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public boolean updateUserByAdmin(User user) {
        String query = "UPDATE users SET name = ?, userDOB = ?, email = ?, phoneNumber = ?, gender = ?, address = ?, avatar = ?, status = ?, description = ?, typeAccountId = ? WHERE userId = ?";
        try {
            
            PreparedStatement ps =  connection.prepareStatement(query);
            ps.setString(1, user.getName());
            ps.setDate(2, user.getUserDOB());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPhoneNumber());
            ps.setBoolean(5, user.isGender());
            ps.setString(6, user.getAddress());
            ps.setString(7, user.getAvatar());
            ps.setBoolean(8, user.isStatus());
            ps.setString(9, user.getDescription());
            ps.setInt(10, user.getTypeAccountId());
            ps.setInt(11, user.getUserID());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public void deleteUser(int userId) {
        String disableConstraintsQuery = "ALTER TABLE carts NOCHECK CONSTRAINT ALL";
        String disableConstraintsQuery2 = "ALTER TABLE bill NOCHECK CONSTRAINT ALL";
        String disableConstraintsQuery3 = "ALTER TABLE wishlist NOCHECK CONSTRAINT ALL";

        String deleteUserQuery = "DELETE FROM users WHERE userId = ?";
        String enableConstraintsQuery = "ALTER TABLE carts WITH CHECK CHECK CONSTRAINT ALL";

        try {
            // Vô hiệu hóa ràng buộc khóa ngoại
            PreparedStatement psDisable = connection.prepareStatement(disableConstraintsQuery);
            psDisable.executeUpdate();



            PreparedStatement psDisable4 = connection.prepareStatement(disableConstraintsQuery2);
            psDisable4.executeUpdate();

            PreparedStatement psDisable5 = connection.prepareStatement(disableConstraintsQuery3);
            psDisable5.executeUpdate();

            // Xóa user trong bảng users
            PreparedStatement psDeleteUser = connection.prepareStatement(deleteUserQuery);
            psDeleteUser.setInt(1, userId);
            psDeleteUser.executeUpdate();

            // Bật lại ràng buộc khóa ngoại
            PreparedStatement psEnable = connection.prepareStatement(enableConstraintsQuery);
            psEnable.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }
    }


    public boolean addNewUser(User user) {
        String query = "INSERT INTO users (name, userDOB, email, phoneNumber, gender, address, avatar, status, description, typeAccountId, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            
            PreparedStatement ps =  connection.prepareStatement(query);
            ps.setString(1, user.getName());
            ps.setDate(2, user.getUserDOB());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPhoneNumber());
            ps.setBoolean(5, user.isGender());
            ps.setString(6, user.getAddress());
            ps.setString(7, user.getAvatar());
            ps.setBoolean(8, user.isStatus());
            ps.setString(9, user.getDescription());
            ps.setInt(10, user.getTypeAccountId());
            ps.setString(11, Encrypt.encrypt(user.getPassword()));
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean blockUser(int userId) {
        String query = "UPDATE users SET isBan = 1 WHERE userId = ?";
        try {
            
            PreparedStatement ps =  connection.prepareStatement(query);
            ps.setInt(1, userId);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean unblockUser(int userId) {
        String query = "UPDATE users SET isBan = 0 WHERE userId = ?";
        try {
            
            PreparedStatement ps =  connection.prepareStatement(query);
            ps.setInt(1, userId);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }
}
