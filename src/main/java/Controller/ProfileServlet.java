/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Database.UserDB;
import Model.User;
import Utils.Permission;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.Objects;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ProfileControl", urlPatterns = {"/profile"})
public class ProfileServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProfileControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        if (!Permission.checkLogin(request, response)) {
            response.sendRedirect("/login");
            return;
        }
        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("/login");
            return;
        }

        String name = request.getParameter("name");
        Date userDOB = Date.valueOf(request.getParameter("userDOB"));
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        boolean gender = Objects.equals(request.getParameter("gender"), "male");
        String address = request.getParameter("address");
        String description = request.getParameter("description");

        if (name.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Tên không được để trống!");
            request.getRequestDispatcher("userInfo.jsp").forward(request, response);
            return;
        }

        // Check if the email is in the correct format
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
        if (!email.matches(emailRegex)) {
            request.setAttribute("errorMessage", "Email không hợp lệ!");
            request.getRequestDispatcher("userInfo.jsp").forward(request, response);
            return;
        }

        String phoneRegex = "0\\d{9,10}";
        if (!phoneNumber.matches(phoneRegex)) {
            request.setAttribute("errorMessage", "Số điện thoại không hợp lệ!");
            request.getRequestDispatcher("userInfo.jsp").forward(request, response);
            return;
        }

        // Check userDOB, > 12 years old
        Date currentDate = new Date(System.currentTimeMillis());
        long diff = currentDate.getTime() - userDOB.getTime();
        long diffYears = diff / (24 * 60 * 60 * 1000) / 365;
        if (diffYears < 12) {
            request.setAttribute("errorMessage", "Ngày sinh không hợp lệ! Bạn phải lớn hơn 12 tuổi!");
            request.getRequestDispatcher("userInfo.jsp").forward(request, response);
            return;
        }




        user.setName(name);
        user.setUserDOB(userDOB);
        user.setEmail(email);
        user.setPhoneNumber(phoneNumber);
        user.setGender(gender);
        user.setAddress(address);
        user.setDescription(description);

        UserDB userDB = new UserDB();
        userDB.editInfoUser(user);

        session.setAttribute("user", user);

        response.sendRedirect("/profile");
    }

    /**
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
