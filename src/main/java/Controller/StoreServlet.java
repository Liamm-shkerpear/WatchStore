/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Database.ProductDB;
import Database.ProductTypeDB;
import Database.TradeMarkDB;
import Model.Product;
import Model.Trademark;
import Model.TypeProduct;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "StoreServlet", urlPatterns = {"/store"})
public class StoreServlet extends HttpServlet {

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
        ProductDB productDB = new ProductDB();
        ProductTypeDB productTypeDB = new ProductTypeDB();
        TradeMarkDB tradeMarkDB = new TradeMarkDB();
        List<Trademark> trademarkList = tradeMarkDB.getAllTrademark();
        List<TypeProduct> listType = productTypeDB.getAllProductTypeWithQuantity();
        List<Product> listTopProduct = productDB.getTopProduct(3);
        if (request.getParameter("lower") != null && request.getParameter("upper") != null) {
            int lower = Integer.parseInt(request.getParameter("lower"));
            int upper = Integer.parseInt(request.getParameter("upper"));
            List<Product> list = productDB.getProductByPriceRange(lower, upper);
            request.setAttribute("listProduct", list);
            request.getRequestDispatcher("productList.jsp").forward(request, response);
            return;
        }

        int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
        int offset = (page - 1) * 9;
        request.setAttribute("page", page);
        request.setAttribute("listTopProduct", listTopProduct);
        request.setAttribute("listTrademark", trademarkList);
        request.setAttribute("listType", listType);
        List<String> listValidSort = new ArrayList<>();
        listValidSort.add("createdDate");
        listValidSort.add("priceProduct");
        listValidSort.add("productName");
        String sort = request.getParameter("sort") == null ? "createdDate" : request.getParameter("sort");
        request.setAttribute("sort", sort);

        if (!listValidSort.contains(sort)) {
            sort = "createdDate";
        }
        String typeSort = request.getParameter("typeSort") == null ? "asc" : request.getParameter("typeSort");
        if (!typeSort.equals("asc") && !typeSort.equals("desc")) {
            typeSort = "asc";
        }
        request.setAttribute("typeSort", typeSort);

        if (request.getParameter("typeId") != null) {
            int typeId = Integer.parseInt(request.getParameter("typeId"));
            List<Product> list = productTypeDB.getProductTypeById(typeId, offset, sort, typeSort);
            int totalAll = productTypeDB.getTotalProductTypeById(typeId);
            request.setAttribute("totalPage", (int) Math.ceil((double) totalAll / 9));

            request.setAttribute("totalAll", totalAll);
            request.setAttribute("typeId", typeId);
            request.setAttribute("listProduct", list);
            request.getRequestDispatcher("productList.jsp").forward(request, response);
            return;
        }
        if (request.getParameter("trademark") != null) {
            int trademarkId = Integer.parseInt(request.getParameter("trademark"));
            List<Product> list = productTypeDB.getProductTypeTrademark(trademarkId, offset, sort, typeSort);
            request.setAttribute("trademark", trademarkId);
            request.setAttribute("listProduct", list);
            request.getRequestDispatcher("productList.jsp").forward(request, response);
            return;
        }
        List<Product> list = productDB.getAllProductWithDiscount(offset, sort, typeSort);
        int totalAll = productDB.getTotalProduct();
        request.setAttribute("totalAll", totalAll);
        request.setAttribute("totalPage", (int) Math.ceil((double) totalAll / 9));

        request.setAttribute("listProduct", list);
        request.getRequestDispatcher("productList.jsp").forward(request, response);
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
