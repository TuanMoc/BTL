/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.User;
import model.Item;
import model.Order;
import model.OrderDateDetail;
//import model.Product;

/**
 *
 * @author dell
 */
public class OrderDAO extends DBContext {

   public void addOrder(User u, Cart cart) {
    LocalDate curDate = java.time.LocalDate.now();
    String date = curDate.toString();
    try {
        // Insert the order into the Order table
        String sql = "INSERT INTO `Order` (date, userId, totalmoney) VALUES (?, ?, ?)";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, date);
        ps.setInt(2, u.getId());
        ps.setDouble(3, cart.getTotalMoney());
        ps.executeUpdate();

        // Retrieve the last inserted order ID
        String sql1 = "SELECT LAST_INSERT_ID()";
        PreparedStatement ps1 = connection.prepareStatement(sql1);
        ResultSet rs = ps1.executeQuery();
        if (rs.next()) {
            int oid = rs.getInt(1);
            for (Item i : cart.getItems()) {
                // Insert each item into the OrderLine table
                String sql2 = "INSERT INTO OrderLine (oid, pid, quantity, price) VALUES (?, ?, ?, ?)";
                PreparedStatement ps2 = connection.prepareStatement(sql2);
                ps2.setInt(1, oid);
                ps2.setString(2, i.getProduct().getId());
                ps2.setInt(3, i.getQuantity());
                ps2.setDouble(4, i.getPrice());
                ps2.executeUpdate();
            }
        }
    } catch (SQLException e) {
        System.out.println(e);
    }
}


    public int getNumOfOrder() {
    String sql = "SELECT COUNT(*) AS count " +
                 "FROM `Order` " +
                 "WHERE totalmoney != 0";

    int count = 0;

    try {
        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();

        if (rs.next()) {
            count = rs.getInt("count");
        }
    } catch (SQLException e) {
        System.out.println(e);
    }

    return count;
}


    public double getTotalRevenue() {
    String sql = "SELECT SUM(totalmoney) AS total " +
                 "FROM `Order` " +
                 "WHERE totalmoney != 0";

    double sum = 0;

    try {
        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();

        if (rs.next()) {
            sum = rs.getDouble("total");
        }
    } catch (SQLException e) {
        System.out.println(e);
    }

    return sum;
}

//    public double getMostBuy() {
//        ArrayList<Order> ls = new ArrayList<>();
//        String sql = "SELECT  [id]\n"
//                + "      ,[date]\n"
//                + "      ,[cid]\n"
//                + "      ,[totalmoney]\n"
//                + "  FROM [PRJ301].[dbo].[Order]\n"
//                + " where totalmoney!=0";
//
//        double sum = 0;
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            ResultSet rs = st.executeQuery();
//
//            while (rs.next()) {
//                Order c = new Order();
//                c.setTotalmoney(rs.getDouble("totalmoney"));
//                ls.add(c);
//            }
//        } catch (SQLException e) {
//        }
//        for (int i = 0; i < ls.size(); i++) {
//            sum += ls.get(i).getTotalmoney();
//        }
//
//        return sum;
//    }
    public List<Order> getAll() {
    List<Order> ls = new ArrayList<>();
    String sql = "SELECT id, date, cid, totalmoney " +
                 "FROM `Order` " +
                 "WHERE totalmoney != 0 " +
                 "ORDER BY date";
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Order c = new Order();
            c.setId(rs.getInt("id"));
            c.setDate(rs.getString("date"));
            c.setCusid(rs.getInt("cid"));
            c.setTotalmoney(rs.getDouble("totalmoney"));
            ls.add(c);
        }
    } catch (SQLException e) {
        System.out.println(e);
    }
    return ls;
}

  public List<Order> numProductPerDay() {
    List<Order> ls = new ArrayList<>();
    String sql = "SELECT COUNT(date) AS Num, date " +
                 "FROM `Order` " +
                 "WHERE totalmoney != 0 " +
                 "GROUP BY date";

    try {
        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();

        while (rs.next()) {
            Order c = new Order();
            c.setDate(rs.getString("date"));
            c.setNum(rs.getInt("Num"));
            ls.add(c);
        }
    } catch (SQLException e) {
        System.out.println(e);
    }

    return ls;
}


    public List<Order> Date() {
    List<Order> ls = new ArrayList<>();
    String sql = "SELECT date " +
                 "FROM `Order` " +
                 "WHERE totalmoney != 0";

    try {
        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();

        while (rs.next()) {
            Order c = new Order();
            c.setDate(rs.getString("date"));
            ls.add(c);
        }
    } catch (SQLException e) {
        System.out.println(e);
    }

    return ls;
}

   public List<OrderDateDetail> OrderDateDetail(String date) {
    ArrayList<OrderDateDetail> ls = new ArrayList<>();

    try {
        String sql = "SELECT o.date, p.name, ol.quantity, p.price, o.totalmoney " +
                     "FROM `Order` o " +
                     "JOIN OrderLine ol ON o.id = ol.oid " +
                     "JOIN Product p ON ol.pid = p.ID " +
                     "WHERE o.totalmoney != 0 AND o.date = ?";
        
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, date);
        ResultSet rs = st.executeQuery();

        while (rs.next()) {
            OrderDateDetail c = new OrderDateDetail();
            c.setDate(rs.getString("date"));
            c.setpName(rs.getString("name"));
            c.setQuantity(rs.getInt("quantity"));
            c.setPrice(rs.getInt("price"));
            c.setTotal(rs.getInt("totalmoney"));
            ls.add(c);
        }
    } catch (SQLException e) {
        System.out.println(e);
    }

    return ls;
}


   public List<Order> mostOrderPerDay() {
    ArrayList<Order> ls = new ArrayList<>();
    String sql = "SELECT COUNT(date) AS Num, date " +
                 "FROM `Order` " +
                 "WHERE totalmoney != 0 " +
                 "GROUP BY date " +
                 "ORDER BY Num DESC " +
                 "LIMIT 1";

    try {
        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Order c = new Order();
            c.setNum(rs.getInt("Num"));
            c.setDate(rs.getString("date"));
            ls.add(c);
        }
    } catch (SQLException e) {
        System.out.println(e);
    }

    return ls;
}


  public List<Order> leastOrderPerDay() {
    ArrayList<Order> ls = new ArrayList<>();
    String sql = "SELECT COUNT(date) AS Num, date " +
                 "FROM `Order` " +
                 "WHERE totalmoney != 0 " +
                 "GROUP BY date " +
                 "ORDER BY Num ASC " +
                 "LIMIT 1";

    try {
        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Order c = new Order();
            c.setNum(rs.getInt("Num"));
            c.setDate(rs.getString("date"));
            ls.add(c);
        }
    } catch (SQLException e) {
        // Xử lý ngoại lệ nếu cần
    }
    return ls;
}


    public List<Order> AllDate() {
    ArrayList<Order> ls = new ArrayList<>();
    String sql = "SELECT `date` FROM `Order` GROUP BY `date`";

    try {
        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Order c = new Order();
            c.setDate(rs.getString("date"));
            ls.add(c);
        }
    } catch (SQLException e) {
        // Xử lý ngoại lệ nếu cần
    }
    return ls;
}

    public String currentDate() {
    String sql = "SELECT `date` FROM `Order` GROUP BY `date` ORDER BY `date` DESC LIMIT 1";
    String date = null;

    try {
        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        if (rs.next()) {
            date = rs.getString("date");
        }
    } catch (SQLException e) {
        // Xử lý ngoại lệ nếu cần
    }
    return date;
}


   public List<OrderDateDetail> OrderDateDetailInXDays(int day) {
    ArrayList<OrderDateDetail> ls = new ArrayList<>();

    try {
        String sql = "SELECT o.date, p.name, ol.quantity, p.price, o.totalmoney " +
                     "FROM `Order` o " +
                     "JOIN OrderLine ol ON o.id = ol.oid " +
                     "JOIN Product p ON ol.pid = p.ID " +
                     "WHERE o.totalmoney != 0 " +
                     "AND DAY(o.date) <= DAY(CURDATE()) " +
                     "AND DAY(o.date) >= DAY(CURDATE() - INTERVAL ? DAY)";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setInt(1, day);
        ResultSet rs = st.executeQuery();

        while (rs.next()) {
            OrderDateDetail c = new OrderDateDetail();
            c.setDate(rs.getString("date"));
            c.setpName(rs.getString("name"));
            c.setQuantity(rs.getInt("quantity"));
            c.setPrice(rs.getInt("price"));
            c.setTotal(rs.getInt("totalmoney"));
            ls.add(c);
        }
    } catch (SQLException e) {
        // Xử lý ngoại lệ nếu cần
    }

    return ls;
}


   public List<OrderDateDetail> OrderDateDetailInAllDays() {
    ArrayList<OrderDateDetail> ls = new ArrayList<>();

    try {
        String sql = "SELECT o.date, p.name, ol.quantity, p.price, o.totalmoney " +
                     "FROM `Order` o " +
                     "JOIN OrderLine ol ON o.id = ol.oid " +
                     "JOIN Product p ON ol.pid = p.ID " +
                     "WHERE o.totalmoney != 0";
        PreparedStatement st = connection.prepareStatement(sql);

        ResultSet rs = st.executeQuery();

        while (rs.next()) {
            OrderDateDetail c = new OrderDateDetail();
            c.setDate(rs.getString("date"));
            c.setpName(rs.getString("name"));
            c.setQuantity(rs.getInt("quantity"));
            c.setPrice(rs.getInt("price"));
            c.setTotal(rs.getInt("totalmoney"));
            ls.add(c);
        }
    } catch (SQLException e) {
        // Xử lý ngoại lệ nếu cần
    }

    return ls;
}


    public List<OrderDateDetail> RevenueUp() {
    ArrayList<OrderDateDetail> ls = new ArrayList<>();

    try {
        String sql = "SELECT o.date, p.name, ol.quantity, p.price, o.totalmoney " +
                     "FROM `Order` o " +
                     "JOIN OrderLine ol ON o.id = ol.oid " +
                     "JOIN Product p ON ol.pid = p.ID " +
                     "WHERE o.totalmoney != 0 " +
                     "ORDER BY o.totalmoney";
        PreparedStatement st = connection.prepareStatement(sql);

        ResultSet rs = st.executeQuery();

        while (rs.next()) {
            OrderDateDetail c = new OrderDateDetail();
            c.setDate(rs.getString("date"));
            c.setpName(rs.getString("name"));
            c.setQuantity(rs.getInt("quantity"));
            c.setPrice(rs.getInt("price"));
            c.setTotal(rs.getInt("totalmoney"));
            ls.add(c);
        }
    } catch (SQLException e) {
        // Xử lý ngoại lệ nếu cần
    }

    return ls;
}


   public List<OrderDateDetail> RevenueDown() {
    ArrayList<OrderDateDetail> ls = new ArrayList<>();

    try {
        String sql = "SELECT o.date, p.name, ol.quantity, p.price, o.totalmoney " +
                     "FROM `Order` o " +
                     "JOIN OrderLine ol ON o.id = ol.oid " +
                     "JOIN Product p ON ol.pid = p.ID " +
                     "WHERE o.totalmoney != 0 " +
                     "ORDER BY o.totalmoney DESC";
        PreparedStatement st = connection.prepareStatement(sql);

        ResultSet rs = st.executeQuery();

        while (rs.next()) {
            OrderDateDetail c = new OrderDateDetail();
            c.setDate(rs.getString("date"));
            c.setpName(rs.getString("name"));
            c.setQuantity(rs.getInt("quantity"));
            c.setPrice(rs.getInt("price"));
            c.setTotal(rs.getInt("totalmoney"));
            ls.add(c);
        }
    } catch (SQLException e) {
        // Xử lý ngoại lệ nếu cần
    }

    return ls;
}


    public List<Order> OrderPerDayUp() {
    List<Order> ls = new ArrayList<>();

    try {
        String sql = "SELECT COUNT(`date`) AS Num, `date` " +
                     "FROM `Order` " +
                     "WHERE totalmoney != 0 " +
                     "GROUP BY `date` " +
                     "ORDER BY Num";

        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();

        while (rs.next()) {
            Order c = new Order();
            c.setDate(rs.getString("date"));
            c.setNum(rs.getInt("Num"));
            ls.add(c);
        }
    } catch (SQLException e) {
        // Xử lý ngoại lệ nếu cần
    }

    return ls;
}

   public List<Order> OrderPerDayDown() {
    List<Order> ls = new ArrayList<>();

    try {
        String sql = "SELECT COUNT(`date`) AS Num, `date` " +
                     "FROM `Order` " +
                     "WHERE totalmoney != 0 " +
                     "GROUP BY `date` " +
                     "ORDER BY Num DESC";

        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();

        while (rs.next()) {
            Order c = new Order();
            c.setDate(rs.getString("date"));
            c.setNum(rs.getInt("Num"));
            ls.add(c);
        }
    } catch (SQLException e) {
        // Xử lý ngoại lệ nếu cần
    }

    return ls;
}

    public List<OrderDateDetail> leastRevenuePerDay() {
    ArrayList<OrderDateDetail> ls = new ArrayList<>();

    try {
        String sql = "SELECT o.date, p.name, ol.quantity, p.price, o.totalmoney " +
                     "FROM `Order` o " +
                     "JOIN OrderLine ol ON o.id = ol.oid " +
                     "JOIN Product p ON ol.pid = p.ID " +
                     "WHERE o.totalmoney != 0 " +
                     "ORDER BY o.totalmoney " +
                     "LIMIT 1";

        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();

        while (rs.next()) {
            OrderDateDetail c = new OrderDateDetail();
            c.setDate(rs.getString("date"));
            c.setpName(rs.getString("name"));
            c.setQuantity(rs.getInt("quantity"));
            c.setPrice(rs.getInt("price"));
            c.setTotal(rs.getInt("totalmoney"));
            ls.add(c);
        }
    } catch (SQLException e) {
        // Xử lý ngoại lệ nếu cần
    }

    return ls;
}

    
    public List<OrderDateDetail> mostRevenuePerDay() {
    ArrayList<OrderDateDetail> ls = new ArrayList<>();

    try {
        String sql = "SELECT o.date, p.name, ol.quantity, p.price, o.totalmoney " +
                     "FROM `Order` o " +
                     "JOIN OrderLine ol ON o.id = ol.oid " +
                     "JOIN Product p ON ol.pid = p.ID " +
                     "WHERE o.totalmoney != 0 " +
                     "ORDER BY o.totalmoney DESC " +
                     "LIMIT 1";

        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();

        while (rs.next()) {
            OrderDateDetail c = new OrderDateDetail();
            c.setDate(rs.getString("date"));
            c.setpName(rs.getString("name"));
            c.setQuantity(rs.getInt("quantity"));
            c.setPrice(rs.getInt("price"));
            c.setTotal(rs.getInt("totalmoney"));
            ls.add(c);
        }
    } catch (SQLException e) {
        // Xử lý ngoại lệ nếu cần
    }

    return ls;
}
}
