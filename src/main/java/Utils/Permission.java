package Utils;

import Model.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Objects;

public class Permission {

    public static boolean checkAdmin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("user") != null) {
            User user = (User) session.getAttribute("user");
            if(!Objects.equals(user.getTypeAccountId(), 2)) {
                response.sendRedirect("/");
                return false;
            }
        } else {
            response.sendRedirect("/login");
            return false;
        }
        return true;
    }

    public static boolean checkLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        return session.getAttribute("user") != null;
    }

    public static boolean checkEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("user") != null) {
            User user = (User) session.getAttribute("user");
            if(!Objects.equals(user.getTypeAccountId(), 3)) {
                response.sendRedirect("/");
                return false;
            }
        } else {
            response.sendRedirect("/login");
            return false;
        }
        return true;
    }

    public static boolean checkManager(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("user") != null) {
            User user = (User) session.getAttribute("user");
            if(!Objects.equals(user.getTypeAccountId(), 2) && !Objects.equals(user.getTypeAccountId(), 3)) {
                response.sendRedirect("/");
                return false;
            }
        } else {
            response.sendRedirect("/login");
            return false;
        }
        return true;
    }
}