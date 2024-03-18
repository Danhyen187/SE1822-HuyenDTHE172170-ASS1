package control;

import dao.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;
import model.Cart;
import model.Category;
import model.Item;
import model.Product;

@WebServlet(name="ManagerControl", urlPatterns={"/manager"})
public class ManagerControl extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("acc");
        if(a != null){
             int id = a.getId();
        DAO d = new DAO();
        List<Product> list = d.getProductBySellID(id);
//        System.out.println(list);
        List<Category> listCate = d.getAllCategories();
        
         List<Product> listP = d.getAllProduct();
         Cookie [] arr = request.getCookies();
         String txt = "";
         if(arr != null){
             for(Cookie o : arr){
                 if(o.getName().equals("cart")){
                     txt += o.getValue();
                 }
             }
         }
         Cart cart = new Cart(txt, listP);
         List<Item> listItem = cart.getList();
        int n;
        if (listItem != null) {
            n = listItem.size();
        } else {
            n = 0;
        }
        request.setAttribute("size", n);
        request.setAttribute("listC", listCate); 
        request.setAttribute("listP", list);
        request.getRequestDispatcher("ManagerProduct.jsp").forward(request, response);
        }else{
            response.sendRedirect("home");
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
