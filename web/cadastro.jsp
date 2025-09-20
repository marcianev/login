<%-- 
    Document   : cadastro
    Created on : 12 de set. de 2025, 20:16:34
    Author     : marci
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script language="Javascript">
            var timer = 2;
            function countdown(){
                if(timer > 0){
                    timer -= 1;
                    setTimeout("countdown()", 3000);
                } else {
                    location.href = 'login.jsp';
                }
            }
            countdown();
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro</title>
    </head>
    <body>
        <%  String email = (String) request.getAttribute("email");
            out.println("<h4>Email "+ email + " Cadastro com sucesso<h4>");
            out.println("Você será redirecionado para página de login");
        %>
    </body>
</html>
