/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Database.AuthenticationDB;
import Database.CartDB;
import Model.CartProducts;
import Model.User;
import Utils.JWT;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
 *
 * @author Admin
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

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
            out.println("<title>Servlet LoginServlet</title>");            
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
      request.getRequestDispatcher("login.jsp").forward(request, response);
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
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String remember =request.getParameter("remember");

        AuthenticationDB authenticationDB = new AuthenticationDB();
        CartDB cartDB = new CartDB();
        User user = authenticationDB.login(email, password);
        if (user == null) {
            request.setAttribute("message", "Sai tên đăng nhập hoặc mật khẩu!");
            request.setAttribute("typeMsg", "error");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            if(!user.isStatus() && user.getToken() != null) {
                request.setAttribute("message", "Tài khoản chưa được kích hoạt!");
                request.setAttribute("typeMsg", "error");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }
            if (user.isBan()){
                request.setAttribute("message", "Tài khoản của bạn đã bị khóa, vui lòng liên hệ admin để mở khóa!");
                request.setAttribute("typeMsg", "error");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }
            // Get cart items current
            HttpSession session = request.getSession();

            List<CartProducts> listCartCurrent = session.getAttribute("cart") != null ? (List<CartProducts>) session.getAttribute("cart") : new ArrayList<>();

            List<CartProducts> listCartProducts = cartDB.getCartItems(user.getUserID());
            if (listCartProducts == null) {
                listCartProducts = new ArrayList<>();
            }
            // Merge cart items
            for (CartProducts cartProduct : listCartCurrent) {
                boolean isExist = false;
                for (CartProducts cartProduct1 : listCartProducts) {
                    if (cartProduct.getProduct().getProductId() == cartProduct1.getProduct().getProductId()) {
                        cartProduct1.setQuantity(cartProduct1.getQuantity() + cartProduct.getQuantity());
                        isExist = true;
                        break;
                    }
                }
                if (!isExist) {
                    listCartProducts.add(cartProduct);
                }
            }

            session.setAttribute("user", user);
            session.setAttribute("cart", listCartProducts);
            session.setMaxInactiveInterval(60*60*24);
            Cookie usernameCookie = new Cookie("usernameCookie", email);
            Cookie passwordCookie = new Cookie("passwordCookie", password);
            if(remember != null) {
                passwordCookie.setMaxAge(60*60*24);
            }else {
                passwordCookie.setMaxAge(0);
            }

            usernameCookie.setMaxAge(60*60*24*365);

            response.addCookie(usernameCookie);
            response.addCookie(passwordCookie);
            String token = JWT.generateToken(String.valueOf(user.getUserID()));
            response.addCookie(new Cookie("token", token));
            response.setHeader("Authorization", token);
            session.setAttribute("token", token);
            response.sendRedirect("/");
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
