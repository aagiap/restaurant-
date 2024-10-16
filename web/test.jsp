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
  boolean checkTableType = (boolean) session.getAttribute("tableTypes");
  int tableId = (int) session.getAttribute("tableId");
  
%>

<p>check tabke type: <%= checkTableType %></p>
<p> table id <%= tableId %></p>


</body>
</html>
