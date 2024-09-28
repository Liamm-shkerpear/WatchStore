/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Database.AuthenticationDB;
import Database.CartDB;
import Database.UserDB;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.Objects;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Calendar;

/**
 *
 * @author Admin
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterServet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       request.getRequestDispatcher("register.jsp").forward(request, response);
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String get_userName = request.getParameter("username");
        String get_email = request.getParameter("email");
        String get_password = request.getParameter("password");
        String get_repeat = request.getParameter("confirm-password");
        String get_dob = request.getParameter("dob");
        String get_sex = request.getParameter("gender");
        String get_phone = request.getParameter("phone");


        // Password validation regex: at least 8 characters, one uppercase letter, one special character
        String passwordPattern = "^(?=.*[A-Z])(?=.*[@#$%^&+=]).{8,}$";

        // Check if password and confirm password match
        if (!get_password.equals(get_repeat)) {
            request.setAttribute("message", "Please make sure your passwords match");
            request.setAttribute("typeMsg", "error");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // Check password complexity
        if (!Pattern.matches(passwordPattern, get_password) || get_password.contains(get_userName)) {
            request.setAttribute("message", "Password must be at least 8 characters long, contain at least one uppercase letter, one special character, and must not contain the username.");
            request.setAttribute("typeMsg", "error");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // Check phone number length
        if (get_phone.length() != 10) {
            request.setAttribute("message", "Phone number must be exactly 10 digits.");
            request.setAttribute("typeMsg", "error");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        try {
            Date dob = Date.valueOf(get_dob);

            // Calculate age
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(dob);
            int year = calendar.get(Calendar.YEAR);
            int currentYear = Calendar.getInstance().get(Calendar.YEAR);
            int age = currentYear - year;

            // Check if age is at least 14
            if (age < 14) {
                request.setAttribute("message", "You must be at least 14 years old to register.");
                request.setAttribute("typeMsg", "error");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            AuthenticationDB authenticationDB = new AuthenticationDB();
            UserDB userDB = new UserDB();
            CartDB cartDB = new CartDB();
            Date dobDate = Date.valueOf(get_dob);
            // Convert gender to boolean
            boolean genderBool = Objects.equals(get_sex, "male");
            if(!authenticationDB.checkAccountIsExist(get_email)){
                authenticationDB.signupNew(get_userName, get_password, get_email, dobDate, get_phone, genderBool);
                int userId = userDB.findUserByEmail(get_email).getUserID();
                cartDB.createCart(userId);
                request.setAttribute("message", "Đăng ký thành công, vui lòng kiểm tra email để xác nhận tài khoản!");
                request.setAttribute("typeMsg", "success");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }else{
                request.setAttribute("message", "Tài khoản đã tồn tại!");
                request.setAttribute("typeMsg", "error");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "An error occurred: " + e.getMessage());
            request.setAttribute("typeMsg", "error");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
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