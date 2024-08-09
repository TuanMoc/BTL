/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;

import java.sql.SQLException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "SortByServlet", urlPatterns = {"/sort"})
public class SortByPriceServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SortByPriceServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SortByPriceServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String sortby = request.getParameter("sortby");
        String cid = request.getParameter("cid");
        ProductDAO p = new ProductDAO();
        try {
            ArrayList<Product> list = null;
            switch (sortby) {
                case "prup":
                    list = (ArrayList<Product>) p.sortProductByPriceUp(cid);
                    break;
                case "prdown":
                    list = (ArrayList<Product>) p.sortProductByPriceDown(cid);
                    break;
                case "nameup":
                    list = (ArrayList<Product>) p.sortProductByNameUp(cid);
                    break;
                case "namedown":
                    list = (ArrayList<Product>) p.sortProductByNameDown(cid);
                    break;

            }

            request.setAttribute("prod", list);
        } catch (SQLException e) {
            request.setAttribute("error", "Could not find that products!!!");
            request.getRequestDispatcher("searchproduct.jsp").forward(request, response);
        }
//            request.setAttribute("size", s);
        request.getRequestDispatcher("searchproduct.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
