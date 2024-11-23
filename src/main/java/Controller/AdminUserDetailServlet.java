package Controller;

import Database.UserDB;
import Model.User;
import Utils.Permission;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/userDetail")
public class AdminUserDetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (!Permission.checkAdmin(request, response)) {
            return;
        }
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        int userId = Integer.parseInt(request.getParameter("userID"));
        UserDB userDB = new UserDB();
        User user = userDB.getUserById(userId);
        request.setAttribute("user", user);
        request.getRequestDispatcher("admin/userDetail.jsp").forward(request, response);
    }
}
