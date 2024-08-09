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

import model.User;

/**
 *
 * @author ASUS
 */
public class UserDAO extends DBContext {

    //check tài khoản
  public User check(String username, String password) {
    String sql = "SELECT id, name, fullname, email, phonenum, role, address, password " +
                 "FROM User WHERE name = ? AND password = ?";
    
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, username);
        st.setString(2, password);

        ResultSet rs = st.executeQuery();
        if (rs.next()) {
            return new User(
                rs.getString("name"),
                rs.getString("password"),
                rs.getString("fullname"),
                rs.getString("email"),
                rs.getString("phonenum"),
                rs.getString("address"),
                rs.getInt("role"),
                rs.getInt("id")
            );
        }
    } catch (SQLException e) {
        System.out.println(e);
    }
    return null;
}


   public User getCustomerBuyMost() {
    String sql = "SELECT COUNT(o.cid) as NumOfOrds,\n"
               + "       o.cid,\n"
               + "       u.fullname,\n"
               + "       u.email,\n"
               + "       u.phonenum,\n"
               + "       u.address\n"
               + "FROM `Order` o\n"
               + "JOIN `User` u ON u.id = o.cid\n"
               + "WHERE o.totalmoney != 0\n"
               + "GROUP BY o.cid, u.fullname, u.email, u.phonenum, u.address\n"
               + "ORDER BY COUNT(o.cid) DESC\n"
               + "LIMIT 1";

    try {
        PreparedStatement st = connection.prepareStatement(sql);

        ResultSet rs = st.executeQuery();
        if (rs.next()) {
            User c = new User();
            c.setId(rs.getInt("cid"));
            c.setAddress(rs.getString("address"));
            c.setPhonenum(rs.getString("phonenum"));
            c.setEmail(rs.getString("email"));
            c.setFullname(rs.getString("fullname"));
            c.setNumOfOrds(rs.getInt("NumOfOrds"));
            return c;
        }
    } catch (SQLException e) {
        System.out.println(e);
    }
    return null;
}


    public List<User> getAll() {
    List<User> list = new ArrayList<>();
    String sql = "SELECT `name`, `password` FROM `User`";
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            User c = new User();
            c.setUsername(rs.getString("name"));
            c.setPassword(rs.getString("password"));
            list.add(c);
        }
    } catch (SQLException e) {
        System.out.println(e);
    }
    return list;
}

    public void change(User a) {
    String sql = "UPDATE `User`\n"
               + "SET `password` = ?\n"
               + "WHERE `name` = ?";
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, a.getPassword());
        st.setString(2, a.getUsername());
        st.executeUpdate();
    } catch (SQLException e) {
        System.out.println(e);
    }
}


    public void changePro(User a) {
    String sql = "UPDATE `User`\n"
               + "SET `fullname` = ?,\n"
               + "    `email` = ?,\n"
               + "    `phonenum` = ?,\n"
               + "    `address` = ?\n"
               + "WHERE `name` = ?";
    try {
        PreparedStatement st = connection.prepareStatement(sql);

        st.setString(1, a.getFullname());
        st.setString(2, a.getEmail());
        st.setString(3, a.getPhonenum());
        st.setString(4, a.getAddress());
        st.setString(5, a.getUsername());

        st.executeUpdate();
    } catch (SQLException e) {
        System.out.println(e);
    }
}


    public boolean existedUs(String username) {
    String sql = "SELECT `name`\n"
               + "FROM `User`\n"
               + "WHERE `name` = ?";
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, username);
        ResultSet rs = st.executeQuery();
        if (rs.next()) {
            return true;
        }
    } catch (SQLException e) {
        System.out.println(e);
    }
    return false;
}


    public boolean existedEmail(String email) {
    String sql = "SELECT `name`\n"
               + "FROM `User`\n"
               + "WHERE `email` = ?";
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, email);
        ResultSet rs = st.executeQuery();
        if (rs.next()) {
            return true;
        }
    } catch (SQLException e) {
        System.out.println(e);
    }
    return false;
}


    public boolean existedPhoneNum(String phonenum) {
    String sql = "SELECT `name`\n"
               + "FROM `User`\n"
               + "WHERE `phonenum` = ?";
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, phonenum);
        ResultSet rs = st.executeQuery();
        if (rs.next()) {
            return true;
        }
    } catch (SQLException e) {
        System.out.println(e);
    }
    return false;
}


    // dang ki
    public void register(User a) {
    String sql = "INSERT INTO `User`\n"
               + "(`name`, `password`, `fullname`, `email`, `phonenum`)\n"
               + "VALUES (?, ?, ?, ?, ?)";
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, a.getUsername());
        st.setString(2, a.getPassword());
        st.setString(3, a.getFullname());
        st.setString(4, a.getEmail());
        st.setString(5, a.getPhonenum());
        st.executeUpdate();
    } catch (SQLException e) {
        System.out.println(e);
    }
}
}