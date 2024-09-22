package Controller;

import Database.UserDB;
import Model.User;
import Utils.Encrypt;
import Utils.Permission;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/delete-account")
public class DeleteAccountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        if (!Permission.checkLogin(request, response)) {
            return;
        }
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String email = request.getParameter("email");
        if (email != user.getEmail()) {
            request.setAttribute("message", "Bạn không thể xóa tài khoản của bản thân");
            request.setAttribute("typeMsg", "error");
            request.getRequestDispatcher("changePassword.jsp").forward(request, response);
            return;
        }
        if (user.getIdGoogle() != null) {
            UserDB userDB = new UserDB();
            userDB.deleteUser(user.getUserID());
            session.removeAttribute("user");
        } else {
            String password = request.getParameter("password");
            password = Encrypt.encrypt(password);
            if (password.equals(user.getPassword())) {
                UserDB userDB = new UserDB();
                userDB.deleteUser(user.getUserID());
                session.removeAttribute("user");
            } else {
                request.setAttribute("message", "Bạn không thể xóa tài khoản của bản thân");
                request.setAttribute("typeMsg", "error");
                request.getRequestDispatcher("changePassword.jsp").forward(request, response);
                return;
            }
        }
        response.sendRedirect("/");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        if (!Permission.checkLogin(request, response)) {
            return;
        }
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String email = request.getParameter("email");
        if (email != user.getEmail()) {
            request.setAttribute("message", "Bạn không thể xóa tài khoản của bản thân");
            request.setAttribute("typeMsg", "error");
            request.getRequestDispatcher("changePassword.jsp").forward(request, response);
            return;
        }
        if (user.getIdGoogle() != null) {
            UserDB userDB = new UserDB();
            userDB.deleteUser(user.getUserID());
            session.removeAttribute("user");
        } else {
            String password = request.getParameter("password");
            password = Encrypt.encrypt(password);
            if (password.equals(user.getPassword())) {
                UserDB userDB = new UserDB();
                userDB.deleteUser(user.getUserID());
                session.removeAttribute("user");
            } else {
                request.setAttribute("message", "Bạn không thể xóa tài khoản của bản thân");
                request.setAttribute("typeMsg", "error");
                request.getRequestDispatcher("changePassword.jsp").forward(request, response);
                return;
            }
        }
        response.sendRedirect("/");
    }
}
