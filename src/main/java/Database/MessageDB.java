package Database;

import Database.DBContext;
import Model.Message;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MessageDB extends DBContext {
    public List<Message> getAllMessageByChatRoomID(int roomID) {
        List<Message> list = new ArrayList<>();
        String query = "SELECT * FROM messages WHERE chatRoomID = ?";
        ChatRoomDB chatRoomDB = new ChatRoomDB();
        UserDB userDB = new UserDB();
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, roomID);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Message message = new Message();
                message.setMessageID(rs.getInt("messageID"));
                message.setContent(rs.getString("content"));
                message.setTimestamp(rs.getTimestamp("timestamp"));
                message.setUser(userDB.findUserById(rs.getInt("userID")));
                message.setChatRoom(chatRoomDB.findChatRoomByID(roomID));
                list.add(message);
            }
        } catch (Exception ignored) {

        }
        return list;
    }

    public boolean insertMessage(String content, int chatRoomID, int userID) {
        String query = "INSERT INTO messages (content, chatRoomID, userID) VALUES (?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, content);
            ps.setInt(2, chatRoomID);
            ps.setInt(3, userID);
            ps.executeUpdate();
            return true;
        } catch (SQLException ignored) {
        }
        return false;
    }


}
