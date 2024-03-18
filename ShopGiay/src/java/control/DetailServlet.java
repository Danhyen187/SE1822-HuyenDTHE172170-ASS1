package control;

import dao.DAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import model.Cart;
import model.Category;
import model.Item;
import model.Product;

@WebServlet(name = "DetailServlet", urlPatterns = {"/detail"})
public class DetailServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            String[] pp = {
            "Under 100$",
            "From 100-200$",
            "From 200-400$",
            "From 400-600$",
            "Above 600$"
        };
            String id_raw = request.getParameter("pid");
            HttpSession session = request.getSession();
            String url = request.getRequestURI() + "?pid=" + id_raw;
//            System.out.println(url);
            session.setAttribute("prevPage", url);
            Product p = null;
            DAO d = new DAO();
            int id = 0;
            try {
                id = Integer.parseInt(id_raw);
                p = d.getProductById(id);
            } catch (NumberFormatException e) {
                System.out.println(e);
            }
            List<Product> list = d.getAllProduct();
            List<Category> listCate = d.getAllCategories();
            Product pnew = d.getNewProduct();
            int cid = d.getCidById(id);
            List<Product> listProductByCide = d.getProductByCid(cid);
            ArrayList<Integer> listSizeId = d.getSizeId(cid);
            ArrayList<Integer> listSize = d.getSize(listSizeId);
            Collections.sort(listSize);
            
            //
            Cookie[] arr = request.getCookies();
            String txt = "";
            if (arr != null) {
                for (Cookie x : arr) {
                    if (x.getName().equals("cart")) {
                        txt += x.getValue();
                    }
                }
            }

            Cart cart = new Cart(txt, list);
            List<Item> listItem = cart.getList();
            int n;
            if (listItem != null) {
                n = listItem.size();
            } else {
                n = 0;
            }
             request.setAttribute("pp",pp);
            request.setAttribute("pCate",listProductByCide );
            request.setAttribute("size", n);
            request.setAttribute("sizes", listSize);
            request.setAttribute("tag", cid);
            request.setAttribute("pnew", pnew);
            request.setAttribute("listC", listCate);
            request.setAttribute("detail", p);
            request.getRequestDispatcher("Detail.jsp").forward(request, response);
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
