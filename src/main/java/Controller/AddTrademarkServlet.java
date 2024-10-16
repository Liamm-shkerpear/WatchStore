package Controller;

import Database.TradeMarkDB;
import Model.Trademark;
import Utils.FileUpload;
import Utils.Permission;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;

@WebServlet("/addTrademark")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50)
public class AddTrademarkServlet extends HttpServlet {
    private static final String UPLOAD_DIR = "uploads";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if (!Permission.checkAdmin(request, response)) {
            return;
        }
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        request.getRequestDispatcher("admin/addTrademark.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        if (!Permission.checkAdmin(request, response)) {
            return;
        }

        Part filePart = request.getPart("logo");

        String fileName = FileUpload.getFileName(filePart);

        Trademark trademark = new Trademark();
        trademark.setTrademarkName(request.getParameter("trademarkName"));
        trademark.setDescriptionTrademark(request.getParameter("descriptionTrademark"));
        if (!fileName.isEmpty()) {
            fileName = System.currentTimeMillis() + "_" + fileName;
            String uploadLogo = FileUpload.uploadFile(request, getServletContext(), filePart, fileName);
            trademark.setLogo(uploadLogo);
        }
        if (trademark.getTrademarkName() == null || trademark.getTrademarkName().isEmpty()) {
            request.setAttribute("errorMessage", "Thương hiệu không được để trống!");
            request.getRequestDispatcher("admin/addTrademark.jsp").forward(request, response);
            return;
        }
        TradeMarkDB dao = new TradeMarkDB();
        if (dao.addTrademark(trademark)) {
            request.setAttribute("successMessage", "Thêm thương hiệu thành công!");
        } else {
            request.setAttribute("errorMessage", "Thêm thương hiệu thất bại!");
        }
        request.getRequestDispatcher("admin/addTrademark.jsp").forward(request, response);
    }
}
