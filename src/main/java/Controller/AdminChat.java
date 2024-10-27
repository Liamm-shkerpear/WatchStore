package Controller;

import Database.ChatRoomDB;
import Model.ChatRoom;
import Model.User;
import Utils.JWT;
import Utils.Permission;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/chatAdmin")
public class AdminChat extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if (!Permission.checkAdmin(request, response)) {
            return;
        }
        response.setContentType("text/html;charset=UTF-8");
        ChatRoomDB chatRoomDB = new ChatRoomDB();
        List<ChatRoom> chatRoomList = chatRoomDB.getAllChatRoom();
        List<ChatRoom> chatRoomsResult = new ArrayList<>();
        for (ChatRoom chatRoom : chatRoomList) {
            ChatRoom newChatRoom = new ChatRoom();
            newChatRoom.setChatRoomID(chatRoom.getChatRoomID());
            newChatRoom.setUser(chatRoom.getUser());
            newChatRoom.setAdmin(chatRoom.getAdmin());
            newChatRoom.setCreatedAt(chatRoom.getCreatedAt());
            newChatRoom.setStatus(chatRoom.isStatus());
            User user = chatRoom.getUser();
            assert user != null;
            String userId = String.valueOf(user.getUserID());
            String token = JWT.generateToken(userId);
            newChatRoom.setToken(token);
            chatRoomsResult.add(newChatRoom);
        }
        request.setAttribute("chatRoomList", chatRoomsResult);
        request.setCharacterEncoding("UTF-8");
        request.getRequestDispatcher("admin/chatRoom.jsp").forward(request, response);
    }
}
