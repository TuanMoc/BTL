/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.Category;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Quang Anh
 */
public class CategoryDAO extends DBContext {

    public List<Category> getAll() {
    List<Category> ls = new ArrayList<>();
    String sql = "SELECT `id`, `name` FROM `Category`";
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Category c = new Category();
            c.setId(rs.getInt("id"));
            c.setName(rs.getString("name"));
            ls.add(c);
        }
    } catch (SQLException e) {
        // Handle SQLException
        System.out.println(e);
    }
    return ls;
}


    public Category getCategoryById(int id) {
    String sql = "SELECT `id`, `name` FROM `Category` WHERE id = ?";
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
        // Handle SQLException
        System.out.println(e);
    }
    return null;
}


    //xoa
    public void delete(int id) {
    String sql = "DELETE FROM `Category` WHERE id = ?";
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        st.setInt(1, id);
        st.executeUpdate();
    } catch (SQLException e) {
        // Handle SQLException
        System.out.println(e);
    }
}


//    public void insert(Category c) {
//        String sql = "insert into Category values(?,?,?)";
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
    public void insert(Category c) {
    String sql = "INSERT INTO `Category` (`name`) VALUES (?)";
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, c.getName());
        st.executeUpdate();
    } catch (SQLException e) {
        // Handle SQLException
        System.out.println(e);
    }
}


    // update 
   public void update(Category c) {
    String sql = "UPDATE `Category` SET `name` = ? WHERE `id` = ?";
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, c.getName());
        st.setInt(2, c.getId());
        st.executeUpdate();
    } catch (SQLException e) {
        // Handle SQLException
        System.out.println(e);
    }
}

  public static void main(String[] args) {
    CategoryDAO d = new CategoryDAO();
    List<Category> ls = d.getAll();

    // Chèn một bản ghi mới vào bảng Category
    Category newCategory = new Category(6, "Chay");
    d.insert(newCategory);

    // Xóa một bản ghi từ bảng Category (nếu cần)
    // d.delete(6);
}
}
