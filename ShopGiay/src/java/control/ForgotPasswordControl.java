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
import util.Email;
import util.generateOTP;

@WebServlet(name = "ForgotPasswordControl", urlPatterns = {"/forgot-password"})
public class ForgotPasswordControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Forgot-password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        DAO d = new DAO();
        if (d.checkEmailExist(email)) {
            generateOTP generate = new generateOTP();
            String otp = generate.generateOTP(6);
            Cookie cookieOtp = new Cookie("otp", otp);
            Cookie cookieEmail = new Cookie("cEmail", email);
            cookieOtp.setMaxAge(60 * 5);
            cookieEmail.setMaxAge(60 * 60);
            Email sendEmail = new Email();
            sendEmail.sendEmail(email, otp);
            response.addCookie(cookieOtp);
            response.addCookie(cookieEmail);
            response.sendRedirect("otp-password");
        } else {
            request.setAttribute("error", "Email not exist");
            request.getRequestDispatcher("Forgot-password.jsp").forward(request, response);
        }
    }

}
