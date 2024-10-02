package Controller;

import Database.UserDB;
import Model.TypeAccount;
import Model.User;
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
import java.sql.Date;
import java.util.List;

@WebServlet("/addUser")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class AddUserServlet extends HttpServlet {
    private static final String UPLOAD_DIR = "uploads";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if (!Permission.checkAdmin(request, response)) {
            return;
        }
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        UserDB userDB = new UserDB();
        List<TypeAccount> typeAccountList = userDB.getAllTypeAccount();
        request.setAttribute("typeAccountList", typeAccountList);
        request.getRequestDispatcher("admin/addUser.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if (!Permission.checkAdmin(request, response)) {
            return;
        }
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        UserDB userDB = new UserDB();
        String userName = request.getParameter("name");
        Date userDOB = Date.valueOf(request.getParameter("userDOB"));
        String email = request.getParameter("email");
        String phone = request.getParameter("phoneNumber");
        boolean gender = request.getParameter("gender").equals("1");
        String address = request.getParameter("address");
        String description = request.getParameter("description");
        int typeAccountId = Integer.parseInt(request.getParameter("typeAccountId"));
        String password = request.getParameter("password");
        boolean status = request.getParameter("status").equals("1");
        Part filePart = request.getPart("avatar");
        String fileName = extractFileName(filePart);
        String avatarPath = "";

        if (fileName != null && !fileName.isEmpty()) {
            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            String filePath = uploadPath + File.separator + fileName;
            filePart.write(filePath);
            avatarPath = UPLOAD_DIR + "/" + fileName;
        }
        User newUser = new User(userName, userDOB, password, email, phone, gender, address, avatarPath, description, typeAccountId, status);
        userDB.addNewUser(newUser);
        response.sendRedirect("/listUser");
    }
    private String extractFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        for (String cd : contentDisposition.split(";")) {
            if (cd.trim().startsWith("filename")) {
                return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}
