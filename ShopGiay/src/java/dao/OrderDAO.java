package dao;

import context.DBContext;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import model.Account;
import model.Cart;
import model.Category;
import model.Information;
import model.Item;
import model.Order;
import model.OrderDetail;
import model.Product;

/**
 *
 * @author DELL
 */
public class OrderDAO extends DBContext {

    public void addOrder(String name, String phone, String address, Account a, Cart cart) {

        Date date = new Date();
        System.out.println(date);
        Timestamp timestamp = new Timestamp(date.getTime());
        System.out.println(timestamp);
        try {
            String sqlInfo = "INSERT [dbo].[information]\n"
                    + "           ([fullName]\n"
                    + "           ,[phoneNumber]\n"
                    + "           ,[address])\n"
                    + "     VALUES(?\n"
                    + "           ,?\n"
                    + "           ,?)";

            PreparedStatement stInfor = connection.prepareStatement(sqlInfo);
            stInfor.setString(1, name);
            stInfor.setString(2, phone);
            stInfor.setString(3, address);
            stInfor.executeUpdate();
            //
            String sqlinfoID = "select top 1 [inforID] from [information] order by [inforID] desc";
            PreparedStatement stInforID = connection.prepareStatement(sqlinfoID);
            ResultSet rsInfoID = stInforID.executeQuery();
            if (rsInfoID.next()) {
                int inforId = rsInfoID.getInt(1);
                String sqlOrder = "INSERT INTO [dbo].[Order]\n"
                        + "           ([dateBuy]\n"
                        + "           ,[amount]\n"
                        + "           ,[inforId]\n"
                        + "           ,[uid])\n"
                        + "     VALUES\n"
                        + "           (?,?,?,?)";
                PreparedStatement st = connection.prepareStatement(sqlOrder);
                st.setTimestamp(1, timestamp);
                st.setDouble(2, cart.getTotalMoney());
                st.setInt(3, inforId);
                st.setInt(4, a.getId());
                st.executeUpdate();
            }

            //Lay ra id cua order vua add
            String sql1 = "select top 1 orderID from [Order] order by orderID desc";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();
            //Add vao bang orderline
            if (rs.next()) {
                int oid = rs.getInt(1);
                for (Item i : cart.getList()) {
                    String sql2 = "INSERT INTO [dbo].[orderDetail]\n"
                            + "           ([orderId]\n"
                            + "           ,[pId]\n"
                            + "           ,[quantity]\n"
                            + "           ,[price]\n"
                            + "           ,[size])\n"
                            + "     VALUES (?,?,?,?,?)";
                    PreparedStatement st2 = connection.prepareStatement(sql2);
                    st2.setInt(1, oid);
                    st2.setInt(2, i.getProduct().getId());
                    st2.setInt(3, i.getQuantity());
                    st2.setDouble(4, i.getPrice());
                    st2.setInt(5, i.getSize());
                    st2.executeUpdate();
                }
            }

            //update so luong trong bang Product sau khi ban
            String sql3 = "update Product set quantity = quantity - ? "
                    + "where id = ?";
            PreparedStatement st3 = connection.prepareStatement(sql3);
            for (Item i : cart.getList()) {
                st3.setInt(1, i.getQuantity());
                st3.setInt(2, i.getProduct().getId());
                st3.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public ArrayList<Order> getOrders() {
        ArrayList<Order> orders = new ArrayList<>();
        String sql = "SELECT o.[orderId]\n"
                + "      ,[dateBuy]\n"
                + "      ,[amount]\n"
                + "      ,i.[inforId]\n"
                + "      ,[uid]\n"
                + "      ,i.fullName\n"
                + "  FROM [Wish].[dbo].[Order] o\n"
                + "  JOIN information i ON i.inforId = o.inforId";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order o = new Order(rs.getInt(1),
                        rs.getTimestamp(2) + "",
                        rs.getDouble(3),
                        rs.getInt(4),
                        rs.getInt(5), rs.getString(6));
                orders.add(o);
            }
            return orders;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public ArrayList<OrderDetail> getOrderDetail(String oid) {
        ArrayList<OrderDetail> orderDetails = new ArrayList<>();
        String sql = "SELECT [orderId]\n"
                + "      ,[pId]\n"
                + "      ,[quantity]\n"
                + "      ,[price]\n"
                + "      ,[size]\n"
                + "  FROM [Wish].[dbo].[orderDetail]\n"
                + "  WHERE orderId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, oid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                DAO d = new DAO();
                Product p = d.getProductById(rs.getInt(2));
                Category c = d.getCategory(d.getCidById(p.getId()));
                OrderDetail od = new OrderDetail(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(5),
                        p,
                        c,
                        rs.getInt(4));
                orderDetails.add(od);
            }
            return orderDetails;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Information getInfo(String oid) {
        String sql = "SELECT i.[inforID]\n"
                + "      ,[fullName]\n"
                + "      ,[phoneNumber]\n"
                + "      ,[address]\n"
                + "  FROM [Wish].[dbo].[information] i\n"
                + "  JOIN [Order] o ON o.inforId = i.inforId\n"
                + "  where o.orderId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, oid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Information i = new Information(Integer.parseInt(oid), rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
                return i;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
}
