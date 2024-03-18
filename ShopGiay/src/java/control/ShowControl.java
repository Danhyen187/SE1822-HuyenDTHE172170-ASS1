package control;

import dao.DAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Cart;
import model.Product;

@WebServlet(name="ShowControl", urlPatterns={"/show"})
public class ShowControl extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAO d = new DAO();
         List<Product> list = d.getAllProduct();
         Cookie [] arr = request.getCookies();
         String txt = "";
         if(arr != null){
             for(Cookie o : arr){
                 if(o.getName().equals("cart")){
                     txt += o.getValue();
                 }
             }
         }
         Cart cart = new Cart(txt, list);
         request.setAttribute("cart",cart);
         request.getRequestDispatcher("MyCart.jsp").forward(request, response);
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
