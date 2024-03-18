package control;

import dao.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Product;

/**
 *
 * @author DELL
 */
@WebServlet(name="PagingControl", urlPatterns={"/paging"})
public class PagingControl extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String paging_raw = request.getParameter("paging");
        int paging;
        DAO d = new DAO();
        List<Product>list = null;
        if(paging_raw==null){
            paging = 1;
        }
        else {
            paging = Integer.parseInt(paging_raw);
        }
            list = d.getPaging(paging);
            System.out.println(list);
            request.setAttribute("listP",list);
            request.getRequestDispatcher("Home.jsp").forward(request, response);
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }
}
