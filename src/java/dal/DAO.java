/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Product;

/**
 *
 * @author ADMIN
 */
public class DAO extends DBContext {

    //lay het ca bang categories
    public List<Category> getAll() {
        List<Category> list = new ArrayList<>();
        String sql = "select * from Category";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));

                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Category getCategoryById(int id) {
        String sql = "select * from Category where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Category c = new Category();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));

                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //lay product theo cid
    public List<Product> getProductsByCid(int cid) {
    List<Product> list = new ArrayList<>();
    String sql = "SELECT `id`, `name`, `price`, `describe`, `image`, `cid` " +
                 "FROM `Product` " +
                 "WHERE cid = ?";
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        st.setInt(1, cid);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Product p = new Product();
            p.setId(rs.getString("id"));
            p.setName(rs.getString("name"));
            p.setPrice(rs.getInt("price"));
            p.setDescribe(rs.getString("describe"));
            p.setImage(rs.getString("image"));
            // Assuming getCategoryById method retrieves Category based on cid
            Category c = getCategoryById(rs.getInt("cid"));
            p.setCategory(c);
            list.add(p);
        }
    } catch (SQLException e) {
        // Handle SQLException
    }
    return list;
}


    public List<Product> randomProducts() throws SQLException {
    ArrayList<Product> ls = new ArrayList<>();
    try {
        String sql = "SELECT `ID`, `name`, `price`, `cid`, `image`, `describe` " +
                     "FROM `Product` " +
                     "ORDER BY RAND() " +
                     "LIMIT 4";
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
        // Handle SQLException
    }
    return ls;
}

    public static void main(String[] args) {
        DAO d = new DAO();
        List<Category> list = d.getAll();
        System.out.println(list.get(0).getId());
    }
}
