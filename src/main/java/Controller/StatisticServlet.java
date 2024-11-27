package Controller;

import Database.StatisticsDB;
import Utils.Permission;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

@WebServlet("/dashboard")
public class StatisticServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (!Permission.checkAdmin(request, response)) {
            return;
        }
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        StatisticsDB statisticsDAO = new StatisticsDB();

        Map<String, Object> statistics = null;
        try {
            statistics = statisticsDAO.getStatistics();
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        request.setAttribute("statistics", statistics);
        String now = java.time.LocalDate.now().toString();
        String lastDay = java.time.LocalDate.now().minusDays(1).toString();
        String fromDate = request.getParameter("fromDate") == null ? lastDay : request.getParameter("fromDate");
        String toDate = request.getParameter("toDate") == null ? now : request.getParameter("toDate");
        request.setAttribute("fromDate", fromDate);
        request.setAttribute("toDate", toDate);
        Map<String, Long> revenueData = statisticsDAO.getRevenueBetweenDates(fromDate, toDate);
        request.setAttribute("revenueData", revenueData);

        request.getRequestDispatcher("admin/dashboard.jsp").forward(request, response);

    }

}
