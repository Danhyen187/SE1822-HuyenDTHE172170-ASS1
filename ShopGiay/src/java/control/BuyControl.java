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
import model.Cart;
import model.Category;
import model.Item;
import model.Product;

@WebServlet(name = "BuyControl", urlPatterns = {"/buy"})
public class BuyControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAO d = new DAO();
        List<Product> list = d.getAllProduct();
        Cookie[] c = request.getCookies();
        String txt = "";
        if (c != null) {
            for (Cookie o : c) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                    o.setMaxAge(0);
                    response.addCookie(o);
                }
            }
        }
        String id = request.getParameter("id");
        String num = request.getParameter("quantity");
        String size = request.getParameter("size");
        System.out.println(size);
        int id_parse = Integer.parseInt(id);
        int cid = d.getCategoryId(id_parse);
        Category cate = d.getCategory(cid);
        if (txt.isEmpty()) {
            txt += id + ":" + num + "_"+size;
        } else {
            txt += "/" + id + ":" + num + "_"+size;
        }
        Cookie cookie = new Cookie("cart", txt);
        cookie.setMaxAge(60 * 60 * 24 * 2);
        response.addCookie(cookie);
        Cart cart = new Cart(txt, list);
        List<Item> listItem = cart.getList();
        request.setAttribute("size", listItem.size());
        request.setAttribute("cate", cate.getName());
        HttpSession session = request.getSession();
        String url = request.getRequestURI();
//        System.out.println(url);
        String prevUrl = (String)session.getAttribute("prevPage");
//        System.out.println(prevUrl);
        response.sendRedirect(prevUrl);
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
