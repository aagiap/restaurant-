/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Dao.DiscountItemDAO;
import Entity.DiscountItem;
import Entity.MenuItems;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "DiscountServlet", urlPatterns = {"/DiscountServlet", "/CreateDiscount", "/RemoveDiscount", "/ApplyDiscount", "/DeleteDiscount"})
public class DiscountServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DiscountServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DiscountServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
        String path = request.getServletPath();
        if (path.equals("/CreateDiscount")) {
            doCreateDiscount(request, response);
        } else if (path.equals("/RemoveDiscount")) {
            doRemoveDiscount(request, response);
        } else if (path.equals("/ApplyDiscount")) {
            doApplyDiscount(request, response);
        } else if (path.equals("/DeleteDiscount")) {
            doDeleteDiscount(request, response);
        }
    }

    protected void doDeleteDiscount(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int discountId = Integer.parseInt(request.getParameter("discountId"));
            DiscountItemDAO dD = new DiscountItemDAO();
            if (dD.checkDiscountCondition()) {
                String msg = "Hãy đặt lại mã đã áp dụng trước!!";
                request.setAttribute("msg", msg);
                request.getRequestDispatcher("AdminHome.jsp").forward(request, response);
            } else {
                dD.deleteDiscount(discountId);
                response.sendRedirect("AdminHome.jsp");
            }

        } catch (Exception e) {
        }
    }

    protected void doCreateDiscount(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int discountPercent = Integer.parseInt(request.getParameter("discountPercent"));
            DiscountItemDAO dD = new DiscountItemDAO();
            dD.insertDiscountItem(discountPercent, "not apply");
            response.sendRedirect("AdminHome.jsp");
        } catch (Exception e) {
        }
    }

    protected void doRemoveDiscount(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int discountId = Integer.parseInt(request.getParameter("discountId"));
            int discountPercent = Integer.parseInt(request.getParameter("discountPercent"));
            String condition = request.getParameter("condition");
            DiscountItem d = new DiscountItem(discountId, discountPercent, condition);
            DiscountItemDAO dD = new DiscountItemDAO();
            if (!dD.checkDiscountCondition()) {
                String msg = "Chưa có mã nào được áp dụng!!";
                request.setAttribute("msg", msg);
                request.getRequestDispatcher("AdminHome.jsp").forward(request, response);
            } else {
                if (dD.checkDiscountConditionOfDiscount(discountId)) {
                    dD.removeDiscount(d);
                    dD.updateDiscountCondition(discountId, "not apply");
                    response.sendRedirect("AdminHome.jsp");
                } else {
                    String msg = "Mã này chưa được áp dụng";
                    Boolean check = true;
                    request.setAttribute("msg", msg);
                    request.setAttribute("check", check);
                    request.getRequestDispatcher("AdminHome.jsp").forward(request, response);
                }

            }

        } catch (Exception e) {
        }
    }

    protected void doApplyDiscount(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int discountId = Integer.parseInt(request.getParameter("discountId"));
            int discountPercent = Integer.parseInt(request.getParameter("discountPercent"));
            String condition = request.getParameter("condition");
            DiscountItemDAO dD = new DiscountItemDAO();
            DiscountItem d = new DiscountItem(discountId, discountPercent, condition);
            if (dD.checkDiscountCondition()) {
                String msg = "Hãy đặt lại mã đã áp dụng trước!!";
                request.setAttribute("msg", msg);
                request.getRequestDispatcher("AdminHome.jsp").forward(request, response);
            } else {
                dD.applyDiscount(d);
                response.sendRedirect("AdminHome.jsp");
            }
        } catch (Exception e) {
        }
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
