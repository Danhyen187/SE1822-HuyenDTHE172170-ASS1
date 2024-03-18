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
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import model.Cart;
import model.Category;
import model.Item;
import model.Product;

@WebServlet(name = "CategoryServlet", urlPatterns = {"/category"})
public class CategoryServlet extends HttpServlet {

    private boolean isCheck(int d, int[] id) {
        if (id == null) {
            return false;
        } else {
            for (int i = 0; i < id.length; i++) {
                if (id[i] == d) {
                    return true;
                }
            }
            return false;
        }
    }

    public List<Product> sort(String opt, List<Product> list) {

        switch (opt) {
            case "sortByCreasePrice":
                Collections.sort(list, new Comparator<Product>() {
                    @Override
                    public int compare(Product o1, Product o2) {
                        if (o1.getPrice() > o2.getPrice()) {
                            return 1;
                        } else {
                            return -1;
                        }
                    }
                ;
                });
                break;
            case "sortByDecresePrice":
                Collections.sort(list, new Comparator<Product>() {
                    @Override
                    public int compare(Product o1, Product o2) {
                        return (int) (o2.getPrice() - o1.getPrice());
                    }
                ;
                });
                break;
            case "sortByName":
                Collections.sort(list, new Comparator<Product>() {
                    @Override
                    public int compare(Product o1, Product o2) {
                        return o1.getName().compareTo(o2.getName());
                    }
                ;
                });
                break;
            case "default":
                return list;
            default:
                return list;
        }
        return list;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cid_raw = request.getParameter("cid");
        String[] cidd_raw = request.getParameterValues("cidd");
        int cid = 0;
        DAO d = new DAO();
        List<Product> products = new ArrayList<>();
        if (cid_raw != null) {
            System.out.println(cid_raw);
            cid = Integer.parseInt(cid_raw);
        products = d.getProductByCid(cid);
        }
        List<Product> listP = d.getAllProduct();
        List<Category> listCate = d.getAllCategories();
        boolean[] chid = new boolean[listCate.size() + 1];
        int[] cidd = null;
        if (cid_raw != null) {
            cid = Integer.parseInt(cid_raw);
            products = d.getProductByCid(cid);
            if (cid == 0) {
                chid[0] = true;
            }
        }
        if (cidd_raw != null) {
            cidd = new int[cidd_raw.length];
            for (int i = 0; i < cidd.length; i++) {
                cidd[i] = Integer.parseInt(cidd_raw[i]);
            }
            products = d.searchByCheck(cidd);
        }
        //

        //
        if ((cidd_raw != null) && (cidd[0] != 0)) {
            chid[0] = false;
            for (int i = 1; i < chid.length; i++) {
                if (isCheck(listCate.get(i - 1).getCid(), cidd)) {
                    chid[i] = true;
                } else {
                    chid[i] = false;
                }
            }
        }
        //sort
        int paging;
        String sort;
        sort = request.getParameter("sort") != null ? request.getParameter("sort") : "default";
        System.out.println(sort);
        //Paging
        String paging_raw = request.getParameter("page");
        if (paging_raw == null) {
            paging = 1;
        } else {
            paging = Integer.parseInt(paging_raw);
        }
        System.out.println(paging);
        System.out.println(products);
        List<Product> list = sort(sort, products);
        List<Product> listPage = list.subList(6 * (paging - 1), (paging * 6) < list.size() ? paging * 6 : list.size());
        
        // End paging
        Product pnew = d.getNewProduct();
        //Cart
        Cookie[] arr = request.getCookies();
        String txt = "";
        
        if (arr != null) {
            for (Cookie x : arr) {
                if (x.getName().equals("cart")) {
                    txt += x.getValue();
                }
            }
        }
        
        Cart cart = new Cart(txt, listP);
        List<Item> listItem = cart.getList();
        int n;
        if (listItem != null || listItem.isEmpty()) {
            n = listItem.size();
        } else {
            n = 0;
        }
        String path = "";
        for(int i = 0; i < cidd.length;i++){
            if(i== cidd.length -1){
                path += "cidd=" + i;
            }
            else{
                path += "cidd=" + i + "&";
            }
        }
        System.out.println(path);
        request.setAttribute("size", n);
        request.setAttribute("path", path);
        request.setAttribute("cidd", cidd);
        request.setAttribute("pnew", pnew);
        request.setAttribute("chid", chid);
        request.setAttribute("page", paging);
        request.setAttribute("listP", listPage);
        request.setAttribute("listC", listCate);
        request.getRequestDispatcher("Home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cid_raw = request.getParameter("cid");
        String[] cidd_raw = request.getParameterValues("cidd");
        int cid = 0;
        List<Product> list = null;
        DAO d = new DAO();
//            cid = Integer.parseInt(cid_raw);
//            list = d.getProductByCid(cid);
        List<Product> products = new ArrayList<>();
        List<Product> listP = d.getAllProduct();
        List<Category> listCate = d.getAllCategories();
        boolean[] chid = new boolean[listCate.size() + 1];
        int[] cidd = null;
        if (cid_raw != null) {
            cid = Integer.parseInt(cid_raw);
            products = d.getProductByCid(cid);
            if (cid == 0) {
                chid[0] = true;
            }
        }
        if (cidd_raw != null) {
            cidd = new int[cidd_raw.length];
            for (int i = 0; i < cidd.length; i++) {
                cidd[i] = Integer.parseInt(cidd_raw[i]);
            }
            products = d.searchByCheck(cidd);
        }
        //

        //
        if ((cidd_raw != null) && (cidd[0] != 0)) {
            chid[0] = false;
            for (int i = 1; i < chid.length; i++) {
                if (isCheck(listCate.get(i - 1).getCid(), cidd)) {
                    chid[i] = true;
                } else {
                    chid[i] = false;
                }
            }
        }
        Product pnew = d.getNewProduct();
        request.setAttribute("cid", cid);
        request.setAttribute("pnew", pnew);
        request.setAttribute("chid", chid);
        request.setAttribute("listP", products);
        request.setAttribute("listC", listCate);
        request.setAttribute("listP", list);
        request.getRequestDispatcher("Home.jsp").forward(request, response);
    }
}
