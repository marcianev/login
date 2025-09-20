<%-- 
    Document   : index
    Created on : 12 de set. de 2025, 20:01:08
    Author     : marci
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <head>
        <title>Formulário de Login e Registro com HTML5 e CSS3</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="estilo.css"/>
    </head>
    <body>
        <div class="container">            
            <div class="content">               
                <div id="cadastro">
                    <form name="frmCadastrarLogin" method="post" action="CadastroLogin">
                        <h1>CADASTRO</h1>
                        <p>
                            <label for="nome">Seu nome</label>
                            <input type ="hidden" name="acao" value="salvar"/>
                            <input id="nome" name="nome" required="required"
                                   type="text" placeholder="nome"/>                
                        </p>
                        <p>
                            <label for="email">Sua email</label>
                            <input id="email" name="email" required="required"
                                   type="email" placeholder="ex. contato@projecaoceilandia.com"/>
                        </p>
                        <p>
                            <label for="senha">Sua senha</label>
                            <input id="senha" name="senha" required="required" 
                                   type="password" placeholder="ex.1234"
                                   maxlength="8"/>                                
                        </p>
                        <p>
                            <input type="submit" value="cadastrar" onclick="return validarCad()"/>                            
                        </p>
                        <p class="link">
                            Já tem conta?
                            <a href="login.jsp">Ir para Login</a>
                        </p>
                    </form>
                </div>
            </div>            
        </div>
        
        <script>
            function validarCad(){
                var nome_cadastro = frmCadastrarLogin.nome.value;
                var email_cadastro = frmCadastrarLogin.email.value;
                var senha_cadastro = frmCadastrarLogin.senha.value;
                
                if(nome_cadastro === ""){
                    alert('Preencha o campo com seu nome!');
                    frmCadastroLogin.nome.focus();
                    return false;
                }                
                else if(email_cadastro === ""){
                    alert('Preencha o campo com seu email!');
                    frmCadastroLogin.email.focus();
                    return false;
                }                
                else if(senha_cadastro === "" || senha_cadastro.length < 6){
                    alert('Preencha o campo com sua senha. \n (Mínimo de 6 e máximo de 8 dígitos.)');
                    frmCadastroLogin.email.focus();
                    return false;
                }
                else{
                    alert('Usuário cadastrado com sucesso \nO email ' 
                            + email_cadastro + 'foi cadastrado com sucesso e terá de ser validado!Favor confirmar o cadastro em seu email.');
                }
                
            }
            
            
            }            
            
        </script>
    </body>
</html>

<!--DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Cadastrar Login</h1>
        <table>
            <form name="frmCadastrarLogin" action="CadastroLogin" method="post">
                <tr>
                    <td>Nome:</td>
                    <td><input type="text" name="nome"/></td>
                    <td>Email:</td>
                    <td><input type="text" name="email"/></td>
                    <td>Senha:</td>
                    <td><input type="password" name="senha"</td>
                    <td colspan="2"><input type="submit" value="cadastrar"/></td>
                </tr>
            </form>
        </table>
    </body>
</html-->
