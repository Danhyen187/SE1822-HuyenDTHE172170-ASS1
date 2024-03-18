package dao;

import context.DBContext;
import java.sql.Array;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Account;

import model.Category;
import model.Product;

public class DAO extends DBContext {

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from product";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(9)));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public List<Category> getAllCategories() {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT [cid]\n"
                + "      ,[cname]\n"
                + "  FROM [Wish].[dbo].[Category]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1), rs.getString(2)));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public Product getNewProduct() {
        String sql = "select top 1 * from Product order by id desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(9));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public List<Product> getProductByCid(int cid) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT  [id]\n"
                + "      ,[name]\n"
                + "      ,[image]\n"
                + "      ,[price]\n"
                + "      ,[title]\n"
                + "      ,[description]\n"
                + "      ,[cateID]\n"
                + "      ,[sell_ID]\n"
                + "      ,[quantity]\n"
                + "  FROM [Wish].[dbo].[product]"
                + "Where 1=1 ";
        if (cid != 0) {
            sql += " and cateId =" + cid;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(9)));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public List<Product> searchByCheck(int[] cid) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT  [id]\n"
                + "      ,[name]\n"
                + "      ,[image]\n"
                + "      ,[price]\n"
                + "      ,[title]\n"
                + "      ,[description]\n"
                + "      ,[cateID]\n"
                + "      ,[sell_ID]\n"
                + "      ,[quantity]\n"
                + "  FROM [Wish].[dbo].[product]"
                + "Where 1=1 ";
        if (cid != null && cid[0] != 0) {
            sql += " and cateId in(";
            for (int i = 0; i < cid.length; i++) {
                sql += cid[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(9)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Product getProductById(int id) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from product where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(9));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public List<Product> getProductsByPrice(double from, double to) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[image]\n"
                + "      ,[price]\n"
                + "      ,[title]\n"
                + "      ,[description]\n"
                + "      ,[quantity]\n"
                + "  FROM [Wish].[dbo].[product]"
                + "  where price between ? and ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setDouble(1, from);
            st.setDouble(2, to);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public int getCidById(int id) {
        int cid = 0;
        String sql = "select cateId from product where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                cid = rs.getInt("cateId");
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return cid;
    }

    public List<Product> getListProductSearch(String txtSearch) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[image]\n"
                + "      ,[price]\n"
                + "      ,[title]\n"
                + "      ,[description]\n"
                + "      ,[quantity]\n"
                + "  FROM [Wish].[dbo].[product] where [name] like ? or [title] like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + txtSearch + "%");
            st.setString(2, "%" + txtSearch + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7));
                list.add(p);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public Account checkLogin(String user, String pass) {
        String sql = "SELECT [uID]\n"
                + "      ,[user]\n"
                + "      ,[pass]\n"
                + "      ,[isSell]\n"
                + "      ,[isAdmin]\n"
                + "      ,[fullname]\n"
                + "      ,[email]\n"
                + "      ,[phone]\n"
                + "      ,[gender]\n"
                + "      ,[avatar]\n"
                + "  FROM [Wish].[dbo].[Account] "
                + "where [user] = ? and pass = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6),
                        (rs.getString(7) == null) ? " " : rs.getString(7),
                        (rs.getString(8) == null) ? " " : rs.getString(8),
                        (rs.getString(9) == null) ? "" : rs.getString(9),
                        (rs.getString(10) == null) ? "" : rs.getString(10));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Account getAccountById(int id) {
        String sql = "SELECT [uID]\n"
                + "      ,[user]\n"
                + "      ,[pass]\n"
                + "      ,[isSell]\n"
                + "      ,[isAdmin]\n"
                + "      ,[fullname]\n"
                + "      ,[email]\n"
                + "      ,[phone]\n"
                + "      ,[gender]\n"
                + "      ,[avatar]\n"
                + "  FROM [Wish].[dbo].[Account] "
                + "where [uID] = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6),
                        (rs.getString(7) == null) ? "" : rs.getString(7),
                        (rs.getString(8) == null) ? "" : rs.getString(8),
                        (rs.getString(9) == null) ? "" : rs.getString(9),
                        (rs.getString(10) == null) ? "" : rs.getString(10));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Account checkAccountExist(String user) {
        String sql = "SELECT [uID]\n"
                + "      ,[user]\n"
                + "      ,[pass]\n"
                + "      ,[isSell]\n"
                + "      ,[isAdmin]\n"
                + "      ,[fullname]\n"
                + "      ,[email]\n"
                + "      ,[gender]\n"
                + "      ,[avatar]\n"
                + "      ,[gender]\n"
                + "  FROM [Wish].[dbo].[Account]";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5), rs.getString(6),
                        (rs.getString(7) == null) ? "" : rs.getString(7),
                        (rs.getString(8) == null) ? "" : rs.getString(8),
                        (rs.getString(9) == null) ? "" : rs.getString(9),
                        (rs.getString(10) == null) ? "" : rs.getString(10));

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean updateAccount(String name, String email, String phone, String gender, String avatar, int uID) {
        String sql = "UPDATE [dbo].[Account]\n"
                + "   SET [fullname] = ? \n"
                + "      ,[email] = ?\n"
                + "      ,[phone] = ?\n"
                + "      ,[gender] = ?\n"
                + "      ,[avatar] = ?\n"
                + " WHERE uID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, email);
            st.setString(3, phone);
            st.setString(4, gender);
            st.setString(5, avatar);
            st.setInt(6, uID);
            st.executeUpdate();
            return true;
        } catch (Exception e) {
            e.getMessage();
        }
        return false;
    }

    public void SignUp(String user, String pass) {
        try {
            String sql = "INSERT INTO [dbo].[Account]\n"
                    + "           ([user]\n"
                    + "           ,[pass]\n"
                    + "           ,[isSell]\n"
                    + "           ,[isAdmin])\n"
                    + "           VALUES(?,?,0,0)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public List<Product> getProductBySellID(int id) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT  [id]\n"
                + "      ,[name]\n"
                + "      ,[image]\n"
                + "      ,[price]\n"
                + "      ,[title]\n"
                + "      ,[description]\n"
                + "      ,[quantity]\n "
                + "FROM [Wish].[dbo].[product]"
                + "where sell_ID = ?"
                + " order by id desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7)
                ));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public void deleteProductById(int id) {
        try {
            String sql = "delete from product where id = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }

    }

    public void InsertProduct(String name, String image, String price,
            String title, String description, String category, int sid, String quantity) {
        String sql = "INSERT [dbo].[product] "
                + "([name], [image], [price],"
                + "[title], [description], [cateID], [sell_ID],[quantity]) "
                + "VALUES(?,?,?,?,?,?,?,?)";
        PreparedStatement st;
        try {
            st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, image);
            st.setString(3, price);
            st.setString(4, title);
            st.setString(5, description);
            st.setString(6, category);
            st.setInt(7, sid);
            st.setString(8, quantity);
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public void EditProduct(String name, String image, String price, String quantity,
            String title, String description, String category, String pid) {
        String sql = "UPDATE [dbo].[product]\n"
                + "   SET [name] = ?\n"
                + "      ,[image] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[quantity]=?\n"
                + "      ,[title] = ?\n"
                + "      ,[description] = ? \n"
                + "      ,[cateID] = ?\n"
                + "        WHERE id = ?";

        PreparedStatement st;
        try {
            st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, image);
            st.setString(3, price);
            st.setString(4, quantity);
            st.setString(5, title);
            st.setString(6, description);
            st.setString(7, category);
            st.setString(8, pid);
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public int getCategoryId(int id) {
        String sql = "SELECT \n"
                + "   [cateID]\n"
                + "  FROM [Wish].[dbo].[product] where id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("cateId");
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return -2;
    }

    public int getNumberPage() {
        String sql = "SELECT COUNT(*)\n"
                + "  FROM [dbo].[product]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int total = rs.getInt(1);
                int countPage = 0;
                countPage = total / 6;
                if (total % 6 != 0) {
                    countPage++;
                }
                return countPage;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public List<Product> getPaging(int index) {
        String sql = "SELECT * FROM [dbo].[product]\n"
                + "order by id\n"
                + "OFFSET ? ROWS\n"
                + "FETCH FIRST 6 ROWS ONLY";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, (index - 1) * 6);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(9)));
            }
            return list;
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public Category getCategory(int cid) {
        String sql = "SELECT  [cid]\n"
                + "      ,[cname]\n"
                + "  FROM [Wish].[dbo].[Category] where cid = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Category(rs.getInt(1), rs.getString(2));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public void buyProduct(int quantity, int id) {
        String sql = "UPDATE [dbo].[product]\n"
                + "   SET quantity = quantity - ? \n"
                + "	where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, quantity);
            st.setInt(2, id);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public ArrayList<Integer> getSizeId(int cateId) {
        ArrayList<Integer> sizeIds = new ArrayList<>();
        String sql = "SELECT  [CategoryID]\n"
                + "      ,[sizeID]\n"
                + "  FROM [Wish].[dbo].[CategorySizes]\n"
                + "  where CategoryID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cateId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                sizeIds.add(rs.getInt(2));
            }
            return sizeIds;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public ArrayList<Integer> getSize(ArrayList<Integer> sizeIds) {
        ArrayList<Integer> sizes = new ArrayList<>();

        String sql = "SELECT [SizeID]\n"
                + "      ,[Size]\n"
                + "  FROM [Wish].[dbo].[ShoeSizes]\n"
                + "  where SizeID in (?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            for (Integer i : sizeIds) {
                st.setInt(1, i);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    sizes.add(rs.getInt(2));
                }
            }

            return sizes;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean findExistUser(String user, String oldPass) {
        String sql = "SELECT\n"
                + "	[user]\n"
                + "	,[pass]\n"
                + "  FROM [Wish].[dbo].[Account]\n"
                + "  where [user] = ? and pass = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, oldPass);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public void changePass(String user, String pass) {
        String sql = "UPDATE [dbo].[Account]\n"
                + "   SET [pass] = ?\n"
                + " WHERE [user] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pass);
            st.setString(2, user);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public String getUserByID(String id) {
        String sql = "SELECT [uID]\n"
                + "      ,[user]\n"
                + "  FROM [Wish].[dbo].[Account] "
                + "where [uID] = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getString(2);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean checkEmailExist(String email) {
        String sql = "SELECT [uID]\n"
                + "      ,[user]\n"
                + "      ,[pass]\n"
                + "      ,[isSell]\n"
                + "      ,[isAdmin]\n"
                + "      ,[fullname]\n"
                + "      ,[email]\n"
                + "      ,[phone]\n"
                + "      ,[gender]\n"
                + "      ,[avatar]\n"
                + "  FROM [Wish].[dbo].[Account]\n"
                + "  where email = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public void getNewPass(String email, String pass) {
        String sql = "UPDATE [dbo].[Account]\n"
                + "   SET [pass] = ?\n"
                + " WHERE [email] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pass);
            st.setString(2, email);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
