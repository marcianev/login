<%-- 
    Document   : erroDeUsuario
    Created on : 12 de set. de 2025, 20:22:48
    Author     : marci
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style type="text/css">
            body{ background-color: #fff;}
            #cabecalho{
                background-color: #fff;
                width: 800px;
                height: 100px;
            }
            #corpo{
                background-color: #fff;
                width: 800px;
                height: 450px;
            }
            #rodape{
                background-color: #fff;
                width: 800px;
                height: 100px;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Erro</title>
    </head>
    <body>
        <div align="center">
            <div id="cabecalho">    </div>
            <div id="corpo">
                <img src ="imagens/erro.jpg"/>
                <br>
                <h3> Email e senha incorretos </h3>
                <br>
                <br>
                <a href="login.jsp">Tentar Novamente</a>
                <a href="index.jsp">Cadastre-se</a>
            </div>
            <div id="rodape">   </div>
        </div>
    </body>
</html>
