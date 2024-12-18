package Database;


import Model.User;
import Utils.Email;
import Utils.Encrypt;

import java.sql.*;
import java.util.UUID;

public class AuthenticationDB extends DBContext {
//    Update password
    public boolean updatePassword(String email, String password) {
        String query = "UPDATE users SET password = ? WHERE email = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, Encrypt.encrypt(password));
            ps.setString(2, email);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public User login(String email, String password) {
        String hashPassword = Encrypt.encrypt(password);
        String query = "SELECT u.*, t.typeAccountName " +
                "FROM users u " +
                "JOIN typeAccount t ON u.typeAccountId = t.typeAccountId " +
                "WHERE u.email = ? " +
                "AND u.password = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, hashPassword);
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

    public boolean changePassword(int id, String password) {
        String query = "UPDATE users SET password = ? WHERE userID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, Encrypt.encrypt(password));
            ps.setInt(2, id);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean checkToken(String token) {
        String query = "select * from users where token = ?";
        try {
            
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, token);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean resetPassword(String token, String password) {
        String query = "UPDATE users SET password = ?, token = null WHERE token = ?";
        try {
            
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, Encrypt.encrypt(password));
            ps.setString(2, token);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }
    public boolean checkAccountIsExist(String email) {
        String query = "select * from users\n"
                + "where email = ?";
        try {
            
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }



    public void signup(String name, String password, String email) {
        String token = UUID.randomUUID().toString();
        String hashPassword = Encrypt.encrypt(password);
        String query = "INSERT INTO users (name, password, email, token) " +
                "VALUES (?, ?, ?, ?)";
        try {
            
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, hashPassword);
            ps.setString(3, email);
            ps.setString(4, token);
            ps.executeUpdate();
            Email.sendEmail(email, "Welcome to our website", "You have successfully registered an account on our website, please visit this link verify your account: http://localhost:8080/verify?token=" + token);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void signupNew(String name, String password, String email, Date dob, String phone, boolean gender) {
        String token = UUID.randomUUID().toString();
        String hashPassword = Encrypt.encrypt(password);
        String query = "INSERT INTO users (name, password, email, userDOB, phoneNumber, gender) " +
                "VALUES (?, ?, ?, ?, ?, ?)";
        try {

                PreparedStatement ps = connection.prepareStatement(query);
                ps.setString(1, name);
                ps.setString(2, hashPassword);
                ps.setString(3, email);
                ps.setDate(4, dob);
                ps.setString(5, phone);
                ps.setBoolean(6, gender);
                ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }


    // verify token
    public void verifyAccount(String token) {
        String query = "update users set status = 1, token = null where token = ?";
        try {
            
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, token);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    // Check user when login with facebook
    public boolean checkFB(String idFB) {
        String query = "select * from users where idFacebook = ?";
        try {
            
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, idFB);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    // Register user when login with facebook
    public void registerFB(String name, String avatar, String idFB) {
        String query = "INSERT INTO users (name, avatar, idFacebook) " +
                "VALUES (?, ?, ?)";
        try {
            
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, avatar);
            ps.setString(3, idFB);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    // Login with facebook
    public User loginFB(String idFB) {
        String query = "SELECT u.*, t.typeAccountName " +
                "FROM users u " +
                "JOIN typeAccount t ON u.typeAccountId = t.typeAccountId " +
                "WHERE u.idFacebook = ? ";
        try {
            
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, idFB);
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

    // Check Google
    public boolean checkGoogle(String idGG) {
        String query = "select * from users where idGoogle = ?";
        try {
            
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, idGG);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    // Register user when login with google
    public void registerGoogle(String name, String avatar, String idGG) {
        String query = "INSERT INTO users (name, avatar, idGoogle, email, status) " +
                "VALUES (?, ?, ?, ?, ?)";
        try {
            
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, avatar);
            ps.setString(3, idGG);
            ps.setString(4, "no-" + idGG + "@gmail.com");
            ps.setBoolean(5, true);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    // Login with google
    public User loginGoogle(String idGG) {
        String query = "SELECT u.*, t.typeAccountName " +
                "FROM users u " +
                "JOIN typeAccount t ON u.typeAccountId = t.typeAccountId " +
                "WHERE u.idGoogle = ? ";
        try {
            
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, idGG);
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
                        rs.getBoolean(18),
                        rs.getString(19));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean checkUserByEmail(String email) {
        String query = "select * from users where email = ?";
        try {
            
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }
    public boolean forgotPassword(String email) {
        String token = UUID.randomUUID().toString();
        String query = "UPDATE users SET token = ? WHERE email = ?";
        try {
            
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, token);
            ps.setString(2, email);
            ps.executeUpdate();
            Email.sendEmail(email, "Reset password", "Please visit this link to reset your password: http://localhost:8080/resetPassword?token=" + token);
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }
}
