/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import com.mysql.cj.jdbc.CallableStatement;
import java.util.ArrayList;
import java.util.List;
import model.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Category;

public class ProductDAO extends DBContext {

public List<Product> getAll() {
    List<Product> ls = new ArrayList<>();
    String sql = "SELECT ID, name, price, `describe`, image, cid FROM Product";
    
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Product p = new Product();
            p.setId(rs.getString("ID"));
            p.setName(rs.getString("name"));
            p.setPrice(rs.getInt("price"));
            p.setDescribe(rs.getString("describe"));
            p.setImage(rs.getString("image"));
            p.setCid(rs.getInt("cid"));
            ls.add(p);
        }
    } catch (SQLException e) {
        System.out.println(e);
    }
    return ls;
}


   public Product getLast() {
    String sql = "SELECT * FROM Product\n"
               + "ORDER BY id DESC\n"
               + "LIMIT 1";
    Product c = new Product();
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();

        if (rs.next()) {
            c.setId(rs.getString("id"));
            c.setName(rs.getString("name"));
            c.setPrice(rs.getInt("price"));
            c.setCid(rs.getInt("cid"));
            c.setDescribe(rs.getString("description"));
            c.setImage(rs.getString("image"));
        }
    } catch (SQLException e) {
        System.out.println(e);
    }
    return c;
}


    public Product getMinPrice() {
    String sql = "SELECT `ID`, `name`, `price`, `cid`, `image`, `describe`\n"
               + "FROM `Product`\n"
               + "ORDER BY `price`\n"
               + "LIMIT 1";
    Product c = new Product();
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();

        if (rs.next()) {
            c.setId(rs.getString("ID"));
            c.setName(rs.getString("name"));
            c.setPrice(rs.getInt("price"));
            c.setCid(rs.getInt("cid"));
            c.setDescribe(rs.getString("describe"));
            c.setImage(rs.getString("image"));
        }
    } catch (SQLException e) {
        System.out.println(e);
    }
    return c;
}


   public Product getMaxPrice() {
    String sql = "SELECT `ID`, `name`, `price`, `cid`, `image`, `describe`\n"
               + "FROM `Product`\n"
               + "ORDER BY `price` DESC\n"
               + "LIMIT 1";
    Product c = new Product();
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();

        if (rs.next()) {
            c.setId(rs.getString("ID"));
            c.setName(rs.getString("name"));
            c.setPrice(rs.getInt("price"));
            c.setCid(rs.getInt("cid"));
            c.setDescribe(rs.getString("describe"));
            c.setImage(rs.getString("image"));
        }
    } catch (SQLException e) {
        System.out.println(e);
    }
    return c;
}


    public Product getProductById(String id) {
    String sql = "SELECT `ID`, `name`, `price`, `describe`, `image`, `cid`\n"
               + "FROM `Product` WHERE `ID` = ?";
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, id);
        ResultSet rs = st.executeQuery();
        if (rs.next()) {
            Product c = new Product();
            c.setId(rs.getString("ID"));
            c.setName(rs.getString("name"));
            c.setPrice(rs.getInt("price"));
            c.setDescribe(rs.getString("describe"));
            c.setImage(rs.getString("image"));
            c.setCid(rs.getInt("cid"));
            return c;
        }
    } catch (SQLException e) {
        System.out.println(e);
    }
    return null;
}

    //xoa
   public void delete(String id) {
    String sql = "DELETE FROM `Product`\n"
               + "WHERE `ID` = ?";
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, id);
        st.executeUpdate();
    } catch (SQLException e) {
        System.out.println(e);
    }
}


//    public void insert(Product c) {
//        String sql = "insert into Categories values(?,?,?)";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setInt(1, c.getId());
//            st.setString(2, c.getName());
//            st.setString(3, c.getDescribe());
//            st.executeUpdate();
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//    }
    // check id da ton tai chua
   public void insert(Product c) {
    String sql = "INSERT INTO `Product`\n"
               + "           (`name`, `price`, `cid`, `describe`, `image`)\n"
               + "     VALUES\n"
               + "           (?, ?, ?, ?, ?)";
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, c.getName());
        st.setInt(2, c.getPrice());
        st.setInt(3, c.getCid());
        st.setString(4, c.getDescribe());
        st.setString(5, c.getImage());

        st.executeUpdate();
    } catch (SQLException e) {
        System.out.println(e);
    }
}


    // update 
    public void update(Product c) {
    String sql = "UPDATE `Product`\n"
               + "SET `name` = ?, `price` = ?, `describe` = ?, `image` = ?\n"
               + "WHERE `ID` = ?";
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, c.getName());
        st.setInt(2, c.getPrice());
        st.setString(3, c.getDescribe());
        st.setString(4, c.getImage());
        st.setString(5, c.getId());
        st.executeUpdate();
    } catch (SQLException e) {
        System.out.println(e);
    }
}


 public List<Product> searchProductByname(String name) {
    ArrayList<Product> ls = new ArrayList<>();
    String sql = "SELECT ID, name, price, cid, `describe`, image FROM Product WHERE name LIKE ?";
    
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, "%" + name + "%");
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Product c = new Product();
            c.setId(rs.getString("ID"));
            c.setName(rs.getString("name"));
            c.setPrice(rs.getInt("price"));
            c.setCid(rs.getInt("cid"));
            c.setDescribe(rs.getString("describe"));
            c.setImage(rs.getString("image"));
            ls.add(c);
        }
    } catch (SQLException e) {
        // Handle exceptions properly (logging, throwing, etc.)
        e.printStackTrace();
    }
    return ls;
}


    public List<Product> sortProductByPriceUp(String cid) throws SQLException {
    List<Product> ls = new ArrayList<>();
    String sql = "SELECT `ID`, `name`, `price`, `cid`, `image`, `describe` FROM `Product` WHERE `cid` = ? ORDER BY `price`";
    
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, cid);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Product c = new Product();
            c.setId(rs.getString("ID"));
            c.setName(rs.getString("name"));
            c.setPrice(rs.getInt("price"));
            c.setCid(rs.getInt("cid"));
            c.setDescribe(rs.getString("describe"));
            c.setImage(rs.getString("image"));
            ls.add(c);
        }
    } catch (SQLException e) {
        // Handle exceptions properly (logging, throwing, etc.)
        System.out.println(e);
    }
    return ls;
}

public List<Product> sortProductByPriceDown(String cid) throws SQLException {
    List<Product> ls = new ArrayList<>();
    String sql = "SELECT `ID`, `name`, `price`, `cid`, `image`, `describe` FROM `Product` WHERE `cid` = ? ORDER BY `price` DESC";
    
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, cid);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Product c = new Product();
            c.setId(rs.getString("ID"));
            c.setName(rs.getString("name"));
            c.setPrice(rs.getInt("price"));
            c.setCid(rs.getInt("cid"));
            c.setDescribe(rs.getString("describe"));
            c.setImage(rs.getString("image"));
            ls.add(c);
        }
    } catch (SQLException e) {
        // Handle exceptions properly (logging, throwing, etc.)
        System.out.println(e);
    }
    return ls;
}


   public List<Product> sortProductByNameUp(String cid) throws SQLException {
    List<Product> ls = new ArrayList<>();
    String sql = "SELECT `ID`, `name`, `price`, `cid`, `image`, `describe` FROM `Product` WHERE `cid` = ? ORDER BY `name`";
    
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, cid);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Product c = new Product();
            c.setId(rs.getString("ID"));
            c.setName(rs.getString("name"));
            c.setPrice(rs.getInt("price"));
            c.setCid(rs.getInt("cid"));
            c.setDescribe(rs.getString("describe"));
            c.setImage(rs.getString("image"));
            ls.add(c);
        }
    } catch (SQLException e) {
        // Handle exceptions properly (logging, throwing, etc.)
        System.out.println(e);
    }
    return ls;
}


    public List<Product> sortProductByNameDown(String cid) throws SQLException {
    List<Product> ls = new ArrayList<>();
    String sql = "SELECT `ID`, `name`, `price`, `cid`, `image`, `describe` FROM `Product` WHERE `cid` = ? ORDER BY `name` DESC";
    
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, cid);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Product c = new Product();
            c.setId(rs.getString("ID"));
            c.setName(rs.getString("name"));
            c.setPrice(rs.getInt("price"));
            c.setCid(rs.getInt("cid"));
            c.setDescribe(rs.getString("describe"));
            c.setImage(rs.getString("image"));
            ls.add(c);
        }
    } catch (SQLException e) {
        // Handle exceptions properly (logging, throwing, etc.)
        System.out.println(e);
    }
    return ls;
}

public List<Product> searchProductByPrice(String pricehead, String priceend) {
    List<Product> ls = new ArrayList<>();
    String sql = "SELECT `ID`, `name`, `price`, `cid`, `describe`, `image` FROM `Product` WHERE `price` >= ? AND `price` < ?";
    
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, pricehead);
        st.setString(2, priceend);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Product c = new Product();
            c.setId(rs.getString("ID"));
            c.setName(rs.getString("name"));
            c.setPrice(rs.getInt("price"));
            c.setCid(rs.getInt("cid"));
            c.setDescribe(rs.getString("describe"));
            c.setImage(rs.getString("image"));
            ls.add(c);
        }
    } catch (SQLException e) {
        // Handle exceptions properly (logging, throwing, etc.)
        System.out.println(e);
    }
    return ls;
}


  public List<Product> getProductByCidPrice(String cid, String head, String end) throws SQLException {
    List<Product> list = new ArrayList<>();
    
    if (head == null && end == null && cid != null) {
        String sql = "SELECT `ID`, `name`, `price`, `cid`, `describe`, `image` FROM `Product` WHERE `cid` = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product c = new Product();
                c.setId(rs.getString("ID"));
                c.setName(rs.getString("name"));
                c.setPrice(rs.getInt("price"));
                c.setCid(rs.getInt("cid"));
                c.setDescribe(rs.getString("describe"));
                c.setImage(rs.getString("image"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    if (cid == null && head != null && end != null) {
        String sql = "SELECT `ID`, `name`, `price`, `cid`, `describe`, `image` FROM `Product` WHERE `price` >= ? AND `price` < ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, head);
            st.setString(2, end);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product c = new Product();
                c.setId(rs.getString("ID"));
                c.setName(rs.getString("name"));
                c.setPrice(rs.getInt("price"));
                c.setCid(rs.getInt("cid"));
                c.setDescribe(rs.getString("describe"));
                c.setImage(rs.getString("image"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    } 
    
    if (cid != null && head != null && end != null) {
        String sql = "SELECT `ID`, `name`, `price`, `cid`, `describe`, `image` FROM `Product` WHERE `cid` = ? AND `price` >= ? AND `price` < ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, cid);
            st.setString(2, head);
            st.setString(3, end);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product c = new Product();
                c.setId(rs.getString("ID"));
                c.setName(rs.getString("name"));
                c.setPrice(rs.getInt("price"));
                c.setCid(rs.getInt("cid"));
                c.setDescribe(rs.getString("describe"));
                c.setImage(rs.getString("image"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    return list;
}


  public List<Product> randomRelative(String id, String cid) throws SQLException {
    List<Product> ls = new ArrayList<>();
    try {
        String sql = "SELECT `ID`, `name`, `price`, `cid`, `image`, `describe` "
                   + "FROM `Product` "
                   + "WHERE `ID` != ? AND `cid` = ? "
                   + "ORDER BY RAND() "
                   + "LIMIT 4";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, id);
        st.setString(2, cid);
        ResultSet rs = st.executeQuery();

        while (rs.next()) {
            Product c = new Product();
            c.setId(rs.getString("ID"));
            c.setName(rs.getString("name"));
            c.setPrice(rs.getInt("price"));
            c.setCid(rs.getInt("cid"));
            c.setDescribe(rs.getString("describe"));
            c.setImage(rs.getString("image"));
            ls.add(c);
        }
    } catch (SQLException e) {
        System.out.println(e);
    }
    return ls;
}

//san pham moi dc add vao db

   public List<Product> topNew() throws SQLException {
    List<Product> ls = new ArrayList<>();
    try {
        String sql = "SELECT `ID`, `name`, `price`, `cid`, `image`, `describe` "
                   + "FROM `Product` "
                   + "ORDER BY `ID` DESC "
                   + "LIMIT 4";
        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();

        while (rs.next()) {
            Product c = new Product();
            c.setId(rs.getString("ID"));
            c.setName(rs.getString("name"));
            c.setPrice(rs.getInt("price"));
            c.setCid(rs.getInt("cid"));
            c.setDescribe(rs.getString("describe"));
            c.setImage(rs.getString("image"));
            ls.add(c);
        }

    } catch (SQLException e) {
        System.out.println(e);
    }
    return ls;
}

//so luong ban duoc nhieu nhat

    public List<Product> mostSold() throws SQLException {
    List<Product> ls = new ArrayList<>();
    try {
        String sql = "SELECT p.`ID` as pid, p.`name`, p.`price`, p.`cid`, p.`image`, p.`describe` "
                   + "FROM `OrderLine` ol "
                   + "JOIN `Product` p ON ol.`pid` = p.`ID` "
                   + "GROUP BY pid "
                   + "ORDER BY SUM(ol.`quantity`) DESC "
                   + "LIMIT 4";
        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();

        while (rs.next()) {
            Product c = new Product();
            c.setId(rs.getString("pid"));
            c.setName(rs.getString("name"));
            c.setPrice(rs.getInt("price"));
            c.setCid(rs.getInt("cid"));
            c.setDescribe(rs.getString("describe"));
            c.setImage(rs.getString("image"));
            ls.add(c);
        }

    } catch (SQLException e) {
        System.out.println(e);
    }
    return ls;
}

//tong doanh thu cao nhat

    public List<Product> topFeature() throws SQLException {
    List<Product> ls = new ArrayList<>();
    try {
        String sql = "SELECT p.`ID` AS pid, p.`name`, p.`price`, p.`cid`, p.`image`, p.`describe` "
                   + "FROM `OrderLine` ol "
                   + "JOIN `Product` p ON ol.`pid` = p.`ID` "
                   + "JOIN `Order` o ON o.`id` = ol.`oid` "
                   + "ORDER BY o.`totalmoney` DESC "
                   + "LIMIT 4";
        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();

        while (rs.next()) {
            Product c = new Product();
            c.setId(rs.getString("pid"));
            c.setName(rs.getString("name"));
            c.setPrice(rs.getInt("price"));
            c.setCid(rs.getInt("cid"));
            c.setDescribe(rs.getString("describe"));
            c.setImage(rs.getString("image"));
            ls.add(c);
        }

    } catch (SQLException e) {
        System.out.println(e);
    }
    return ls;
}


   public Product getHighestEarningProduct() {
    String sql = "SELECT ol.`pid` AS pid, p.`name`, p.`price`, p.`cid`, p.`image`, p.`describe`, o.`totalmoney` "
               + "FROM `OrderLine` ol "
               + "JOIN `Product` p ON ol.`pid` = p.`ID` "
               + "JOIN `Order` o ON o.`id` = ol.`oid` "
               + "ORDER BY o.`totalmoney` DESC "
               + "LIMIT 1";
    
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        
        if (rs.next()) {
            Product c = new Product();
            c.setId(rs.getString("pid"));
            c.setName(rs.getString("name"));
            c.setPrice(rs.getInt("price"));
            c.setDescribe(rs.getString("describe"));
            c.setImage(rs.getString("image"));
            c.setCid(rs.getInt("cid"));
            c.setTotal(rs.getInt("totalmoney"));
            
            return c;
        }
    } catch (SQLException e) {
        System.out.println(e);
    }
    return null;
}


  public Product getLowestEarningProduct() {
    String sql = "{CALL getLowestEarningProduct()}";
    try (CallableStatement cs = (CallableStatement) connection.prepareCall(sql)) {
        ResultSet rs = cs.executeQuery();
        if (rs.next()) {
            Product c = new Product();
            c.setId(rs.getString("pid"));
            c.setName(rs.getString("name"));
            c.setPrice(rs.getInt("price"));
            c.setDescribe(rs.getString("describe"));
            c.setImage(rs.getString("image"));
            c.setCid(rs.getInt("cid"));
            c.setTotal(rs.getInt("totalmoney"));
            return c;
        }
    } catch (SQLException e) {
        System.out.println(e);
    }
    return null;
}


    //so luong nhieu nhat ngay hnay
    // ngay hnay last =0, 3 ngay qua: last=2, 7 ngay qua: last =6
   public List<Product> mostSoldInXDay(int last) throws SQLException {
    ArrayList<Product> ls = new ArrayList<>();
    try {
        String sql = "SELECT p.date, p.cid, p.ID, p.name, p.price, p.image, p.describe, ol.quantity, o.totalmoney " +
                     "FROM `Order` o " +
                     "JOIN OrderLine ol ON o.id = ol.oid " +
                     "JOIN Product p ON p.ID = ol.pid " +
                     "WHERE o.date BETWEEN (CURRENT_DATE() - INTERVAL ? DAY) AND CURRENT_DATE() " +
                     "AND o.totalmoney != 0 " +
                     "ORDER BY ol.quantity DESC " +
                     "LIMIT 4";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setInt(1, last);
        ResultSet rs = st.executeQuery();

        while (rs.next()) {
            Product c = new Product();
            c.setId(rs.getString("ID"));
            c.setName(rs.getString("name"));
            c.setPrice(rs.getInt("price"));
            c.setCid(rs.getInt("cid"));
            c.setDescribe(rs.getString("describe"));
            c.setImage(rs.getString("image"));
            c.setDate(rs.getString("date"));
            c.setQuantity(rs.getInt("quantity"));
            c.setTotal(rs.getInt("totalmoney"));
            ls.add(c);
        }

    } catch (SQLException e) {
        // Log the exception
        e.printStackTrace();
    }
    return ls;
}


   public List<Product> mostRevenueInXDay(int last) throws SQLException {
    ArrayList<Product> ls = new ArrayList<>();
    try {
        String sql = "SELECT p.date, p.cid, p.ID, p.name, p.price, p.image, p.describe, ol.quantity, o.totalmoney " +
                     "FROM `Order` o " +
                     "JOIN OrderLine ol ON o.id = ol.oid " +
                     "JOIN Product p ON p.ID = ol.pid " +
                     "WHERE o.date BETWEEN (CURRENT_DATE() - INTERVAL ? DAY) AND CURRENT_DATE() " +
                     "AND o.totalmoney != 0 " +
                     "ORDER BY o.totalmoney DESC " +
                     "LIMIT 4";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setInt(1, last);
        ResultSet rs = st.executeQuery();

        while (rs.next()) {
            Product c = new Product();
            c.setId(rs.getString("ID"));
            c.setName(rs.getString("name"));
            c.setPrice(rs.getInt("price"));
            c.setCid(rs.getInt("cid"));
            c.setDescribe(rs.getString("describe"));
            c.setImage(rs.getString("image"));
            c.setDate(rs.getString("date"));
            c.setQuantity(rs.getInt("quantity"));
            c.setTotal(rs.getInt("totalmoney"));
            ls.add(c);
        }

    } catch (SQLException e) {
        // Log the exception
        e.printStackTrace();
    }
    return ls;
}


   

}
