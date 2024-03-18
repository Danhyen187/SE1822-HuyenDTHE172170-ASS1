package control;

import dao.DAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author DELL
 */
@WebServlet(name="DeleteControl", urlPatterns={"/delete"})
public class DeleteControl extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String pid_raw = request.getParameter("productId");
        int pid;
        System.out.println(pid_raw);
        DAO d = new DAO();
        try{
            pid = Integer.parseInt(pid_raw);
            d.deleteProductById(pid);
        }catch(NumberFormatException e){
            System.out.println(e);
        }
        response.sendRedirect("manager");
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
