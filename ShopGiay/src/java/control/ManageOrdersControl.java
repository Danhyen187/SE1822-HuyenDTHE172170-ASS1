package control;

import dao.OrderDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Order;

/**
 *
 * @author DELL
 */
@WebServlet(name = "ManageOrdersControl", urlPatterns = {"/manager-orders"})
public class ManageOrdersControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        OrderDAO od = new OrderDAO();
        ArrayList<Order> orders = od.getOrders();
        int size = 0;
        double total = 0;
        if (orders != null) {
            size = orders.size();
            for (Order o : orders) {
                total += o.getTotalMoney();
            }
        }
        request.setAttribute("size", size);
        request.setAttribute("total", total);
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("ManageOrders.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
