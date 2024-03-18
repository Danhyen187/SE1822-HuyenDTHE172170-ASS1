/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.DAO;
import dao.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Cart;
import model.Information;
import model.Item;
import model.OrderDetail;
import model.Product;

/**
 *
 * @author DELL
 */
@WebServlet(name = "CheckoutControl", urlPatterns = {"/checkout"})
public class CheckoutControl extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DAO d = new DAO();
        List<Product> list = d.getAllProduct();
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                }
            }
        }
        Cart cart = new Cart(txt, list);
        request.setAttribute("cart", cart);
        request.getRequestDispatcher("Checkout.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        DAO d = new DAO();
        String txt = "";
        Cookie[] c = request.getCookies();
        if (c != null) {
            for (Cookie o : c) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                    o.setMaxAge(0);
                    response.addCookie(o);
                }
            }
        }
        List<Product> list = d.getAllProduct();
        Cart cart = new Cart(txt, list);

        Account acount = null;
        Object a = session.getAttribute("acc");
        if (a != null) {
            acount = (Account) a;
            OrderDAO odb = new OrderDAO();
            odb.addOrder(name, phone, address, acount, cart);
//            for (Item item : cart.getList()) {
//                int id = item.getProduct().getId();
//                int quantity = item.getQuantity();
//                d.buyProduct(quantity, id);
//            }
        } else {
            response.sendRedirect("login.jsp");
        }

        request.setAttribute("name", name);
        request.setAttribute("phone", phone);
        request.setAttribute("address", address);
        request.getRequestDispatcher("success.jsp").forward(request, response);
    }

}
