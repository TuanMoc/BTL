/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin;

import dal.DAO;
import dal.OrderDAO;
import dal.ProductDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.http.HttpServlet;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Category;
import model.OrderDateDetail;
import model.Product;

/**
 *
 * @author ADMIN
 */
@WebServlet(name="ChartDetail", urlPatterns={"/chartdetail"})
public class ChartDetail extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ChartDetail</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChartDetail at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       ProductDAO d = new ProductDAO();
        List<Product> list = d.getAll();
        
        DAO ct = new DAO();
        List<Category> ls = ct.getAll();
        
        OrderDAO ord = new OrderDAO();
        
        UserDAO u = new UserDAO();
        List<OrderDateDetail> listod = new ArrayList<>();
        String searchbyday = request.getParameter("searchchartdetail");
        String xDays = null;
        if ("1".equals(searchbyday)) {
            listod = ord.OrderDateDetailInXDays(0);
            xDays="Today";
        }
        if ("2".equals(searchbyday)) {
            listod = ord.OrderDateDetailInXDays(2);
            xDays="Last 3 Days";
        }
        if ("3".equals(searchbyday)) {
            listod = ord.OrderDateDetailInXDays(6);
            xDays="Last 7 Days";
        }
        if ("4".equals(searchbyday)) {
            listod = ord.OrderDateDetailInAllDays();
            xDays="All Days";
        }
        request.setAttribute("alldate", ord.AllDate());
//        request.setAttribute("getDate", searchbyday);
        request.setAttribute("ord", listod);
        request.setAttribute("searchbyday", xDays);
        request.getRequestDispatcher("chartdetail.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
