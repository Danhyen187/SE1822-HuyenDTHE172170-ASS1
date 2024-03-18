/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
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

/**
 *
 * @author DELL
 */
@WebServlet(name = "ChangePassword", urlPatterns = {"/changePass"})
public class ChangePassword extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("ChangePassword.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user = request.getParameter("user");
        String oldPass = request.getParameter("oldpass");
        String newPass = request.getParameter("newpass");

        DAO d = new DAO();
        boolean check = d.findExistUser(user, oldPass);
        if (!check) {
            request.setAttribute("mess", "Old password not correct!");
            request.getRequestDispatcher("ChangePassword.jsp").forward(request, response);
        } else {
            Cookie cp = new Cookie("cpass", newPass);
            cp.setMaxAge(7 * 60 * 60 * 24);//7 ngay
            response.addCookie(cp);
            d.changePass(user, newPass);
            response.sendRedirect("login");
        }

    }

}
