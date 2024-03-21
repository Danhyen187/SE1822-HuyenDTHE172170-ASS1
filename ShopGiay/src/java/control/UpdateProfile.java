package control;

import dao.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import model.Account;

/**
 *
 * @author DELL
 */
@MultipartConfig(
        //        location = "E:\\Lap Trinh Java\\JavaWeb\\PRJ\\ShopGiayOnline\\web\\img",
        fileSizeThreshold = 1024 * 2024,
        maxFileSize = 1024 * 2024 * 10,
        maxRequestSize = 1024 * 2024 * 11
)
@WebServlet(name = "UpdateProfile", urlPatterns = {"/updateProfile"})
public class UpdateProfile extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
    private static final String UPLOAD_DIR = "uploads";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id_raw = request.getParameter("id");
        String name = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String gender = request.getParameter("gender");
        String image = request.getParameter("image");
        String mess = "";
        int id = -1;
        DAO d = new DAO();
        String fileName = null;
        try {
            id = Integer.parseInt(id_raw);
            String applicationPath = request.getServletContext().getRealPath("/");
            int begin = applicationPath.indexOf("build");
            String newPath = applicationPath.substring(0, begin) + "web\\";
            String uploadFilePath = newPath + File.separator + UPLOAD_DIR;
            File fileSaveDir = new File(newPath);
            if (!fileSaveDir.exists()) {
                fileSaveDir.mkdirs();
            }

            Part part = request.getPart("file");
            fileName = getFileName(part);
            part.write(uploadFilePath + File.separator + fileName);

        } catch (Exception e) {
            fileName = image;
            mess = "Update information Failed " + e.getMessage();
        }
        if (d.updateAccount(name, email, phone, gender, fileName, id)) {
            mess = "Update information successfully! ";
            response.sendRedirect("profile?id=" + id);
        } else {
            mess = "Failed";
            request.setAttribute("mess", mess);
            request.getRequestDispatcher("Profile.jsp").forward(request, response);
        }
//        Account acc = d.getAccountById(id);

    }

    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        System.out.println("content-disposition header= " + contentDisp);
        String[] tokens = contentDisp.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length() - 1);
            }
        }
        return "";
    }

}
