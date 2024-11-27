/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Database.*;
import Model.*;
import Utils.Permission;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
@WebServlet(name = "DetailMaintain", urlPatterns = {"/detailMaintain"})
public class DetailMaintain extends HttpServlet {

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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        MaintenanceDB maintenanceDB = new MaintenanceDB();
        int maintenanceId = Integer.parseInt(request.getParameter("id"));

        Maintenance maintenance = maintenanceDB.getMaintenanceById(maintenanceId);
        List<MaintenanceProduct> maintenanceProductList = maintenanceDB.getAllProductMaintenanceByID(maintenanceId);

        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm:ss.SSSSSSS");

        String maintenanceTime = maintenance.getMaintenanceTime().toString();
        LocalDate date = LocalDate.parse(maintenance.getMaintenanceDate(), dateFormatter);
        LocalTime time = LocalTime.parse(maintenanceTime, timeFormatter); // Updated to use the new formatter

        LocalDateTime maintenanceDateTime = LocalDateTime.of(date, time);

        LocalDateTime expectedReturnDateTime = maintenanceDateTime.plusDays(3);

        String expectedReturnDate = expectedReturnDateTime.format(DateTimeFormatter.ofPattern("HH:mm - dd/MM/yyyy "));

        request.setAttribute("maintenance", maintenance);
        request.setAttribute("maintenanceProductList", maintenanceProductList);
        request.setAttribute("expectedReturnDate", expectedReturnDate);
        request.getRequestDispatcher("detailMaintenance.jsp").forward(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */


    /**
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
