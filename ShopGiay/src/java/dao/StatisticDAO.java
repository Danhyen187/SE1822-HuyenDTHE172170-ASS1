package dao;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Product;
import model.StatisticProduct;

/**
 *
 * @author DELL
 */
public class StatisticDAO extends DBContext{
    
    public ArrayList<StatisticProduct> getStatisticProduct(){
        ArrayList<StatisticProduct> list = new ArrayList<>();
         String sql = "SELECT [pId] ,SUM(od.quantity)\n"
                + "  FROM [Wish].[dbo].[orderDetail] od\n"
                + "  JOIN product p ON od.pId = p.id\n"
                + "  GROUP BY [pId]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            DAO d = new DAO();
            while(rs.next()){
                Product p = d.getProductById(rs.getInt(1));
                list.add(new StatisticProduct(p, rs.getInt(2)));
            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
}
