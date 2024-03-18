package control;

import dao.StatisticDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import model.StatisticProduct;

/**
 *
 * @author DELL
 */
@WebServlet(name = "StatisticControl", urlPatterns = {"/statistic"})
public class StatisticControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        StatisticDAO sd = new StatisticDAO();
        ArrayList<StatisticProduct> list = sd.getStatisticProduct();
        int total = 0;
        double totalAmount = 0;
        for(StatisticProduct s : list){
            total += s.getTotal();
            totalAmount += s.getTotal()*s.getProduct().getPrice();
        }
        request.setAttribute("list", list);
        request.setAttribute("total", total);
        request.setAttribute("totalAmount", totalAmount);
        request.getRequestDispatcher("Statistic.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
