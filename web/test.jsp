<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%@ page import="Entity.Users"%>
<%@ page import="java.util.List" %>
<%@ page import="Entity.MenuItems" %>
<%@ page import="Entity.Tables" %>
<%@ page import="Dao.TablesDAO" %>
<!DOCTYPE html>

<html>
    <head>
        <title>Reservation Details</title>
    </head>
    <body>
        <h2>Reservation Details</h2>

        <% 
        String category = request.getParameter("categoryFilter");
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String imageUrl = request.getParameter("image");
  
        %>

        <p>category: <%= category %></p>
        <p> name <%= name %></p>
        <p> price <%= price %></p>
        <p> imageUrl <%= imageUrl %></p>


    </body>
</html>
