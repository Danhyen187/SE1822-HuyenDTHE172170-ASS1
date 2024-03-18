package control;

import dao.OrderDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Information;
import model.Order;
import model.OrderDetail;

/**
 *
 * @author DELL
 */
@WebServlet(name="OrderDetail", urlPatterns={"/order-detail"})
public class OrderDetailControl extends HttpServlet {
   

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String oid = request.getParameter("oid");
        OrderDAO od = new OrderDAO();
        ArrayList<OrderDetail> orderDetails = od.getOrderDetail(oid);
        Information i = od.getInfo(oid);
  
        double total = 0;
        if(orderDetails != null){
            for(OrderDetail o : orderDetails){
                total += o.getQuantity()*o.getPrice();
            }
        }
        request.setAttribute("total", total);
        request.setAttribute("orderDetail", orderDetails);
        request.setAttribute("info", i);
        request.getRequestDispatcher("OrderDetail.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    }


}
