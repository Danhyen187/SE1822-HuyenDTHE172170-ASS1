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
import model.Category;
import model.Item;
import model.Product;

@WebServlet(name="LoadControl", urlPatterns={"/loadProduct"})
public class LoadControl extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
          String pid_raw = request.getParameter("pid");
          System.out.println(pid_raw);
        int pid;
        DAO d = new DAO();
        try{
            pid = Integer.parseInt(pid_raw);
            Product p = d.getProductById(pid);
             List<Category> listCate = d.getAllCategories();
             int cateID = d.getCategoryId(pid);
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
            request.setAttribute("cateID",cateID);
            request.setAttribute("listC", listCate); 
            request.setAttribute("detail",p);
            request.getRequestDispatcher("Edit.jsp").forward(request, response);
        }catch(NumberFormatException e){
            System.out.println(e);
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
