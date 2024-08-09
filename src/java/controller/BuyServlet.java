/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;
import model.Item;
import model.Product;

/**
 *
 * @author Can Duy Khanh
 */
@WebServlet(name = "BuyServlet", urlPatterns = {"/buy"})
public class BuyServlet extends HttpServlet {

    /**
     * Xử lý yêu cầu cho cả hai phương thức HTTP <code>GET</code> và <code>POST</code>.
     *
     * @param request yêu cầu gửi từ client
     * @param response phản hồi trả về cho client
     * @throws ServletException nếu xảy ra lỗi đặc thù của Servlet
     * @throws IOException nếu xảy ra lỗi I/O
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO: hiển thị mã HTML mẫu */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BuyServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BuyServlet tại " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click vào dấu + để chỉnh sửa mã.">
    /**
     * Xử lý phương thức HTTP <code>GET</code>.
     *
     * @param request yêu cầu gửi từ client
     * @param response phản hồi trả về cho client
     * @throws ServletException nếu xảy ra lỗi đặc thù của Servlet
     * @throws IOException nếu xảy ra lỗi I/O
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Chuyển tiếp yêu cầu đến URL "list"
        request.getRequestDispatcher("list").forward(request, response);
    }

    /**
     * Xử lý phương thức HTTP <code>POST</code>.
     *
     * @param request yêu cầu gửi từ client
     * @param response phản hồi trả về cho client
     * @throws ServletException nếu xảy ra lỗi đặc thù của Servlet
     * @throws IOException nếu xảy ra lỗi I/O
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(); // Lấy phiên làm việc hiện tại
        Cart cart; // Khởi tạo đối tượng giỏ hàng
        Object o = session.getAttribute("cart");
        
        // Kiểm tra giỏ hàng có tồn tại trong phiên làm việc không
        if (o != null) {
            cart = (Cart) o; // Nếu có, lấy giỏ hàng từ phiên làm việc
        } else {
            cart = new Cart(); // Nếu không, tạo giỏ hàng mới
        }
        
        // Lấy thông tin số lượng và ID sản phẩm từ yêu cầu
        String num = request.getParameter("num");
        String id = request.getParameter("id");

        try {
            int inum = Integer.parseInt(num); // Chuyển đổi số lượng từ chuỗi sang số nguyên
            ProductDAO pdb = new ProductDAO(); // Tạo đối tượng DAO để truy cập cơ sở dữ liệu
            Product p = pdb.getProductById(id); // Lấy thông tin sản phẩm từ cơ sở dữ liệu theo ID
            int price = p.getPrice(); // Lấy giá sản phẩm
            Item t = new Item(p, inum, price); // Tạo đối tượng Item mới
            cart.addItem(t); // Thêm sản phẩm vào giỏ hàng
        } catch (NumberFormatException e) {
            // Xử lý lỗi chuyển đổi số lượng sản phẩm (nếu có)
        }
        
        // Lấy danh sách các mặt hàng trong giỏ hàng
        List<Item> list = cart.getItems();
        // Cập nhật giỏ hàng và số lượng mặt hàng trong phiên làm việc
        session.setAttribute("cart", cart);
        session.setAttribute("size", list.size());
        // Chuyển hướng người dùng đến trang danh sách sản phẩm
        response.sendRedirect("list");
    }

    /**
     * Trả về mô tả ngắn gọn về servlet.
     *
     * @return Chuỗi chứa mô tả ngắn gọn về servlet
     */
    @Override
    public String getServletInfo() {
        return "Mô tả ngắn gọn về BuyServlet";
    }// </editor-fold>

}
