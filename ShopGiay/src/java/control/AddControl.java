package control;

import dao.DAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

@WebServlet(name = "AddControl", urlPatterns = {"/add"})
public class AddControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try {
            String name = request.getParameter("name");
            String image = request.getParameter("image");
            String price = request.getParameter("price");
            String quantity = request.getParameter("quantity");
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String pcategory = request.getParameter("category");
            HttpSession session = request.getSession();
            Account a = (Account) session.getAttribute("acc");
            int sid = a.getId();
            DAO d = new DAO();
            System.out.println(name + image + description);
            d.InsertProduct(name, image, price, title, description, pcategory, sid,quantity);
            response.sendRedirect("manager");
        } catch (Exception e) {
            System.out.println(e);
            response.sendRedirect("login");

        }
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
