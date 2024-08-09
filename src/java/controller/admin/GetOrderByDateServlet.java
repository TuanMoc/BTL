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

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Category;
import model.OrderDateDetail;
import model.Product;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "GetOrderByDateServlet", urlPatterns = {"/getorderbydate"})
public class GetOrderByDateServlet extends HttpServlet {

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
            out.println("<title>Servlet GetOrderByDateServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GetOrderByDateServlet at " + request.getContextPath() + "</h1>");
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
        String getdate = request.getParameter("date");
//        String split[] = getdate1.split("/");
//        String day = split[1];
//        String month = split[0];
//        String year = split[2];
//        String getdate = year + "/" + month + "/" + day;
        

        ProductDAO d = new ProductDAO();
        List<Product> list = d.getAll();

        DAO ct = new DAO();
        List<Category> ls = ct.getAll();

        OrderDAO ord = new OrderDAO();
//        String split1[] = getdate.split("-");
//        String split2[]=ord.currentDate().split("-");

        UserDAO u = new UserDAO();
        if (getdate == null) {
            getdate = ord.currentDate();
        }
//        if( Integer.parseInt(split1[2]) > Integer.parseInt(split2[2])){
//            String ms;
//            ms = "No orders in " + getdate;
//            request.setAttribute("errdate", ms);
//        }

//        String split[] = dob.split("-");
//        String day = split[1];
//        String month = split[0];
//        String year = split[2];
//        String date = year + "-" + month +"-"+day;
        ArrayList<OrderDateDetail> listod = new ArrayList<>();

        listod.addAll(ord.OrderDateDetail(getdate));
        request.setAttribute("currentdate", getdate);

        request.setAttribute("ord", listod);

        int count = ord.getNumOfOrder();

        request.setAttribute("alldate", ord.AllDate());
        request.setAttribute("highestEarningP", d.getHighestEarningProduct());
        request.setAttribute("lowestEarningP", d.getLowestEarningProduct());
        request.setAttribute("prod", list.size());
        request.setAttribute("cate", ls.size());
        request.setAttribute("pricemin", d.getMinPrice().getPrice());
        request.setAttribute("pricemax", d.getMaxPrice().getPrice());
        request.setAttribute("numOfOrd", count);
        request.setAttribute("totalRevenue", (int) ord.getTotalRevenue());
        request.setAttribute("customerBuyMost", u.getCustomerBuyMost());
        request.setAttribute("order", ord.numProductPerDay());
        request.setAttribute("mostOrderPerDay", ord.mostOrderPerDay());
        request.setAttribute("leastOrderPerDay", ord.leastOrderPerDay());
        request.setAttribute("date", getdate);
        request.setAttribute("searchdate", getdate);

        int sum = 0;
        for (int i = 0; i < list.size(); i++) {
            sum += list.get(i).getPrice();
        }
        int sumOrd = 0;
        for (int i = 0; i < ord.numProductPerDay().size(); i++) {
            sumOrd += ord.numProductPerDay().get(i).getNum();

        }
        int avgOrd = sumOrd / ord.numProductPerDay().size();

        double avg = (double) sum / (double) list.size();
        DecimalFormat df = new DecimalFormat("#.###");
        request.setAttribute("avg", df.format(avg));
        request.setAttribute("avgOrd", avgOrd);

        request.getRequestDispatcher("orderstatistic.jsp").forward(request, response);
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
        processRequest(request, response);
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
