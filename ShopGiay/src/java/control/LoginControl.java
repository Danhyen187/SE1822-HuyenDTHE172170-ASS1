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
import model.Account;

/**
 *
 * @author DELL
 */
@WebServlet(name = "LoginControl", urlPatterns = {"/login"})
public class LoginControl extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Login.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        String rem = request.getParameter("remember");
        // Tao 3 cookies : Luu tru username, pass,remember
            Cookie cu = new Cookie("cuser", user);
            Cookie cp = new Cookie("cpass", pass);
            Cookie cr = new Cookie("crem", rem);
        if (rem != null) {
            cu.setMaxAge(7 * 60 * 60 * 24);//7 ngay
            cp.setMaxAge(7 * 60 * 60 * 24);//7 ngay
            cr.setMaxAge(7 * 60 * 60 * 24);//7 ngay
        } else {
             // khong chon
            cu.setMaxAge(0);//7 ngay
            cp.setMaxAge(0);//7 ngay
            cr.setMaxAge(0);//7 ngay
        }
        //luu tru vao brower
        response.addCookie(cr);
        response.addCookie(cu);
        response.addCookie(cp);
        DAO dao = new DAO();
        Account a = dao.checkLogin(user, pass);
        if (a == null) {
            request.setAttribute("mess", "Wrong user or password");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("acc", a);
            response.sendRedirect("home");
        }
    }

}
