<%-- 
    Document   : remover
    Created on : 12 de set. de 2025, 20:35:55
    Author     : marci
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Remover</title>
    </head>
    <body>
        <%
            session.removeAttribute("email");
            response.sendRedirect("login.jsp");
        %>
    </body>
</html>
