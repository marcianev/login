<%-- 
    Document   : login
    Created on : 12 de set. de 2025, 20:06:56
    Author     : marci
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>     
         <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="estilo.css"/>
        <title>Acessar</title>
    </head>
    <div class="container">           
            <div class="content">
                <!--formulario de login-->
                <div id="login">
                    <form name="formLogin" method="post" action="Login">
                        <h1>LOGIN</h1>
                        <p>
                            <label for="email">Seu e-mail</label>
                            <input id="email" name="email" required="required"
                                   type="text" placeholder="ex. contato@projecaoceilandia.com"/>                
                        </p>
                        <p>
                            <label for="senha">Sua senha</label>
                            <input id="senha" name="senha" required="required"
                                   type="password" placeholder="ex. senha"
                                   maxlength="8"/>
                        </p>
                        <p>
                            <input type="checkbox" name="manterlogado" id="manterlogado" value=""/>
                            <label for="manterlogado">Manter-se logado</label>
                        </p>
                        <p>
                            <input type="submit" value="Logar" onclick="return validarLog()"/>                            
                        </p>
                        <p class="link">Ainda não tem conta?
                            <a href="index.jsp">Cadastre-se</a>
                        </p>
                    </form>
                </div>    
            </div>            
        </div>
        
        <script>                       
            function validarLog(){
                
                var email_login = formLogin.email_login.value;
                var senha_login = formLogin.senha_login.value;                             
                
                if(email_login === ""){
                    alert('Preencha o campo com seu email!');
                    formLogin.email_login.focus();
                    return false;
                }
                
                if(senha_login === "" || senha_login.length < 6){
                    alert('Preencha o campo com sua senha. \n(Mínimo de 6 e máximo de 8 dígitos.');
                    formLogin.email_login.focus();
                    return false;
                }
            }            
            
        </script>
    </body>
</html>
