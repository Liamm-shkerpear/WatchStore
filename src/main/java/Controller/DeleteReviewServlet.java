package Controller;

import Database.ReviewDB;
import Utils.Permission;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteReview", urlPatterns = "/deleteReview")
public class DeleteReviewServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        if(!Permission.checkAdmin(request, response)){
            return;
        }
        ReviewDB reviewDB = new ReviewDB();
        int id = Integer.parseInt(request.getParameter("id"));
        String redirectLink = request.getParameter("redirectLink");
        reviewDB.deleteReview(id);
        response.sendRedirect(redirectLink);
    }
}
