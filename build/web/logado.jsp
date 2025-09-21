<%-- 
    Document   : logado
    Created on : 12 de set. de 2025, 20:32:56
    Author     : marci
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@page import="br.com.login.Usuario"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="br.com.login.UsuarioDao"%>
<%@page import="br.com.conexao.CriarConexao"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" type="text/css" href="estilo.css"/>
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" 
               integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <title>Logado</title>
    </head>
    <body>
        
        <div class="mr-5 ml-5 mt-5">
        <%
            String email = (String) session.getAttribute("email");
        %>
        Seja Bem-vindo: <%=email%> | <a href="remover.jsp">Sair</a>
        <h1>Logado</h1>     
            <div class="d-flex content-justify-center">
            <form name="frmAtualizar" action="CadastroLogin" method="post">    
                 <input type="hidden" id="acao" name="acao" value=""/>
                <table>
                    <tr class="row">
                       <td class="col-1"><strong>Id</strong></td>
                       <td class="col-2"><strong>Nome</strong></td>
                       <td class="col-2"><strong>Email</strong></td>
                       <td class="col-2"><strong>Senha</strong></td>
                    </tr>
                    <tr class="row">                   
                        <td class="col-1"><input type="text" name="id" size="1" value="${usuario.id}" readonly/></td>    
                        <td class="col-2"><input type="text" name="nome" size="35" value="${usuario.nome}"/></td>
                        <td class="col-2"><input type="text" name="email" size="35" value="${usuario.email}"/></td>
                        <td class="col-2"><input type="text" name="senha" size="5" value="${usuario.senha}"/></td>
                        <td class="col-2"><input type="submit" name="excluir" value="Excluir" onclick="document.getElementById('acao').value='excluir'"/></td>
                        <td class="col-2"><input type="submit" name="atualizar" value="Atualizar" onclick="document.getElementById('acao').value='atualizar'"/></td>
                    </tr>                   
                </table>   
            </form>      
            </div>
        <h3>Usuários cadastrados no sistema:</h3>
        <br>   
       <div class="row table-responsive" style="width: 1300px; height: 200px; overflow-y: auto;">
        <table class="table table-hover" >
            <thead class="sticky-top bg-light" >
                <tr>
                    <th><strong>Id</strong></th>
                    <th><strong>Nome</strong></th>
                    <th><strong>Email</strong></th>
                    <th><strong>Senha</strong></th>
                    <th><strong></strong></th>
                </tr>
            </thead>
            <tbody>
            <%                
                int id=0;
                String nome="";
                String emaill="";
                String senha="";               
                
                Connection con = CriarConexao.getConexao();               
                UsuarioDao uDao = new UsuarioDao(con);                
                List<Usuario> user = uDao.listar();              
               
                for(int i=0; i < user.size(); i++){
                Usuario u = user.get(i);   
            %>    
           
            <tr>
                <td style="width: 5%;"><%=u.getId()%></td>
                <td style="width: 30%;"><%=u.getNome()%></td>    
                <td style="width: 30%"><%=u.getEmail()%></td>
                <td style="width: 30%"><%=u.getSenha()%></td>
                <td style="width: 5%"><a href="CadastroLogin?id=<%=u.getId()%>">Editar</a></td>
            </tr>            
             <%}%> 
            </tbody>
        </table>       
        <br><br>      
        </div>
        </div>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </body>
</html>
