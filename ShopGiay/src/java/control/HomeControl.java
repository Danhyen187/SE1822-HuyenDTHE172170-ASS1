package control;

import dao.DAO;
import java.io.IOException;
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

/**
 *
 * @author DELL
 */
@WebServlet(name = "HomeControl", urlPatterns = {"/home"})
public class HomeControl extends HttpServlet {

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

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String[] pp = {
            "Under 100$",
            "From 100-200$",
            "From 200-400$",
            "From 400-600$",
            "Above 600$"
        };
        boolean[] pb = new boolean[pp.length + 1];
        DAO d = new DAO();
        String cid_raw = request.getParameter("cid");
        String[] cidd_raw = request.getParameterValues("cidd");
         String[] price = request.getParameterValues("price");
        int cid = 0;
        List<Product> products = new ArrayList<>();
        List<Product> listP = d.getAllProduct();
        List<Category> listCate = d.getAllCategories();
        if (cid_raw != null) {
            System.out.println(cid_raw);
            cid = Integer.parseInt(cid_raw);
            products = d.getProductByCid(cid);
        }
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
        if (cid_raw == null) {
            chid[0] = true;
        }
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
        // filter price
        if(price != null){
            double from =0,to=0;
            for(int i = 0;i<price.length;i++){
                System.out.println(price[i]);
                List<Product> temp = new ArrayList<>();
                if(price[i].equals("0")){
                    from = 0;
                    to = 100000;
                    products = d.getProductsByPrice(from,to);
                    pb[0] = true;
                    break;
                }
                else {
                    if(price[i].equals("1")){
                        from = 0;
                        to = 100;
                        temp =  d.getProductsByPrice(from, to);
                        products.addAll(temp);
                        pb[1] = true;
                    }
                    if(price[i].equals("2")){
                        from = 100;
                        to = 200;
                        temp =  d.getProductsByPrice(from, to);
                        products.addAll(temp);
                        pb[2] = true;
                    }
                    if(price[i].equals("3")){
                        from = 200;
                        to = 400;
                        temp =  d.getProductsByPrice(from, to);
                        products.addAll(temp);
                        pb[3] = true;
                    }
                    if(price[i].equals("4")){
                        from = 400;
                        to = 600;
                        temp =  d.getProductsByPrice(from, to);
                        products.addAll(temp);
                        pb[4] = true;
                    }
                    if(price[i].equals("5")){
                        from = 600;
                        to = 100000;
                        temp =  d.getProductsByPrice(from, to);
                        System.out.println(temp);
                        products.addAll(temp);
                        pb[5] = true;
                    }
                }
            }
        }
        if(price==null){
            pb[0] = true;
        }
        //
        //sort
        int paging = 1;
        String sort;
        sort = request.getParameter("sort") != null ? request.getParameter("sort") : "default";
        Product pnew = d.getNewProduct();

        // Paging
        String paging_raw = request.getParameter("page");
        if (paging_raw == null) {
            paging = 1;
        } else {
            try {
                paging = Integer.parseInt(paging_raw);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }

        }
        List<Product> list = sort(sort, products.isEmpty() ? listP : products);
        List<Product> listPage = null;
        try {
            listPage = list.subList(6 * (paging - 1), (paging * 6) <= list.size() ? paging * 6 : list.size());
            if(listPage.isEmpty()){
                listPage = null;
            }
        } catch (Exception e) {
            System.out.println("Nothing");
        }
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
         request.setAttribute("pp",pp);
        request.setAttribute("pb",pb);
        request.setAttribute("chid", chid);
        request.setAttribute("size", n);
        request.setAttribute("cid", cid);
        request.setAttribute("page", paging);
        request.setAttribute("pnew", pnew);
        if (listPage != null ) {
            request.setAttribute("listP", listPage);

        } else {
            request.setAttribute("error", "No product");
        }
        request.setAttribute("listC", listCate);
        request.setAttribute("sort", sort);

        request.getRequestDispatcher("Home.jsp").forward(request, response);
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
