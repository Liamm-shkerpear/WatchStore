package Controller.socket;

import Database.ChatRoomDB;
import Database.MessageDB;
import Database.UserDB;
import Model.ChatRoom;
import Model.Message;
import Model.User;
import Utils.JWT;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Objects;
import java.util.concurrent.CopyOnWriteArraySet;

@ServerEndpoint("/chat/{token}/{id}")
public class ChatEndPoint {
    private static final CopyOnWriteArraySet<ChatEndPoint> connections = new CopyOnWriteArraySet<>();
    private Session session;
    private int userID;
    private int senderID;
    private String token;

    @OnOpen
    public void start(Session session, @PathParam("token") String token, @PathParam("id") String id) {
        this.userID = Integer.parseInt(Objects.requireNonNull(JWT.validateToken(token)));
        this.senderID = Integer.parseInt(id);
        this.token = token;
        if (this.userID == 0) {
            try {
                session.close(new CloseReason(CloseReason.CloseCodes.VIOLATED_POLICY, "Invalid token"));
            } catch (IOException e) {
                e.printStackTrace();
            }
            return;
        }
        session.getUserProperties().put("userID", this.userID);
        this.session = session;
        connections.add(this);
    }

    @OnClose
    public void end() {
        connections.remove(this);
    }

    @OnMessage
    public void incoming(String message) {
        if (this.userID != (int) session.getUserProperties().get("userID")) {
            return;
        }
        ChatRoomDB chatRoomDB = new ChatRoomDB();
        MessageDB messageDB = new MessageDB();
        ChatRoom chatRoom = chatRoomDB.findChatRoomByUserId(this.userID);
        if (chatRoom == null && userID != 1) {
            chatRoom = chatRoomDB.createChatRoom(this.userID);
        }

        Message msg = new Message();
        msg.setContent(message);
        msg.setChatRoomID(chatRoom.getChatRoomID());
        UserDB userDB = new UserDB();
        User sender = userDB.findUserById(this.senderID);
        msg.setSender(sender);
        msg.setTimestamp(new Timestamp(System.currentTimeMillis()));
        msg.setUser(chatRoom.getUser());
        ObjectMapper mapper = new ObjectMapper();
        String json = "";
        try {
            json = mapper.writeValueAsString(msg);
        } catch (IOException e) {
            e.printStackTrace();
        }
        try {
            for (ChatEndPoint client : connections) {
                if (client.userID == chatRoom.getUser().getUserID()) {
                    if (!Objects.equals(client.token, this.token)) {
                        messageDB.insertMessage(message, chatRoom.getChatRoomID(), 1);
                        client.session.getBasicRemote().sendText(json);
                    } else {
                        messageDB.insertMessage(message, chatRoom.getChatRoomID(), this.userID);
                        client.session.getBasicRemote().sendText(json);

                    }

                }
            }
            session.getBasicRemote().sendText(json);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
