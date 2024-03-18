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
import java.util.List;
import model.Cart;
import model.Item;
import model.Product;

/**
 *
 * @author DELL
 */
@WebServlet(name = "DeleteItemCart", urlPatterns = {"/deleteItem"})
public class DeleteItemCart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            String id_raw = request.getParameter("id");
            String size_raw = request.getParameter("size");
            DAO d = new DAO();
            Cookie[] arr = request.getCookies();
            String txt = "";
            if (arr != null) {
                for (Cookie c : arr) {
                    if (c.getName().equals("cart")) {
                        txt += c.getValue();
                        c.setMaxAge(0);
                        response.addCookie(c);
                    }
                }
            }
            List<Product> listProduct = d.getAllProduct();
            Cart cart = new Cart(txt, listProduct);
            System.out.println(cart);
            int id = Integer.parseInt(id_raw);
            int size = Integer.parseInt(size_raw);
            cart.removeItem(id,size);
            txt = "";
            List<Item> listItem = cart.getList();
            if (listItem.size() > 0) {
                txt = listItem.get(0).getProduct().getId() + ":" + listItem.get(0).getQuantity()+"_"+listItem.get(0).getSize();
                for (int i = 1; i < listItem.size(); i++) {
                    txt += "/" + listItem.get(0).getProduct().getId() + ":" + listItem.get(0).getQuantity()+"_"+listItem.get(0).getSize();
                }
            }
            Cookie c = new Cookie("cart", txt);
            c.setMaxAge(1 * 60 * 60 * 24);
            response.addCookie(c);
            request.setAttribute("cart", cart);
            request.getRequestDispatcher("MyCart.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
}
