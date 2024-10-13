<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <title>Reservation Details</title>
</head>
<body>
<h2>Reservation Details</h2>

<% 
    Integer userId = (Integer) request.getAttribute("userId");
    Date reservationDate = (Date) request.getAttribute("reservationDate");
    Integer numberOfPeople = (Integer) request.getAttribute("numberOfPeople");
    Integer tableId = (Integer) request.getAttribute("tableId");

    // Kiểm tra null trước khi định dạng
    String formattedDate = "Not Available"; // Giá trị mặc định
    if (reservationDate != null) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        formattedDate = dateFormat.format(reservationDate);
    }
%>

<p>User ID: <%= userId != null ? userId : "Not Available" %></p>
<p>Reservation Date: <%= formattedDate %></p>
<p>Number of People: <%= numberOfPeople != null ? numberOfPeople : "Not Available" %></p>
<p>Table ID: <%= tableId != null ? tableId : "Not Available" %></p>

</body>
</html>
