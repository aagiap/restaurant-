/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control;

import Dao.MenuItemDao;
import Entity.MenuItems;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "AdminMenu", urlPatterns = {"/AdminMenu","/AddItems","/DeleteItem","/UpdateItem"})
public class AdminMenu extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {

           // request.getRequestDispatcher("Admin.jsp").include(request, response);
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
        if (path.equals("/AddItems")) {
            doAddItems(request, response);
        }else if(path.equals("/DeleteItem")){
            doDeleteItem(request, response);
        }else if(path.equals("/UpdateItem")){
            doUpdateItem(request, response);
        }
    }
    protected void doUpdateItem(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int itemId = Integer.parseInt(request.getParameter("itemId"));
        String category = request.getParameter("category");
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));

        MenuItemDao mD = new MenuItemDao();
        try {
            mD.updateMenuItem(category, price, itemId, name);
        } catch (SQLException ex) {
            Logger.getLogger(AdminMenu.class.getName()).log(Level.SEVERE, null, ex);
        }
 response.sendRedirect("AdminMenu.jsp");

    }
    protected void doDeleteItem(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int itemId = Integer.parseInt(request.getParameter("itemId"));
        MenuItemDao mD = new MenuItemDao();
        try {
            mD.deleteMenuItem(itemId);
        } catch (SQLException ex) {
            Logger.getLogger(AdminMenu.class.getName()).log(Level.SEVERE, null, ex);
        }
 response.sendRedirect("AdminMenu.jsp");

    }
    protected void doAddItems(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String category = request.getParameter("categoryFilter");
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String imageUrl = request.getParameter("image");

            MenuItems m = new MenuItems(name, "", price, category, imageUrl);
            //MenuItems m = new MenuItems("test", "", 100000, "Món chính", "cc");
            MenuItemDao mD = new MenuItemDao();
            try {
                mD.insertMenuItem(m);
            } catch (SQLException ex) {
                Logger.getLogger(AdminMenu.class.getName()).log(Level.SEVERE, null, ex);
            }
            response.sendRedirect("AdminMenu.jsp");
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
