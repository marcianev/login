/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.login;

import br.com.conexao.CriarConexao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author marci
 */
public class CadastroLoginServlet extends HttpServlet{
    private static final long serialVersionUID = 1L;
    private Connection con;
    private UsuarioDao uDao;
    private Usuario u;
    
    public CadastroLoginServlet(){
        super();
    }
        
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
         //response.setContentType("text/html");
         PrintWriter out = response.getWriter();        
        String acao = request.getParameter("acao");   
         out.println("<h1>"+acao+"</h1>");
        if("salvar".equals(acao)){             
            salvar(request,response);
        }else if ("atualizar".equals(acao)){              
            atualizar(request, response);
        }else if ("excluir".equals(acao)){
            excluir(request, response);
        }else{
            response.sendRedirect("erroDeUsuario.jsp");
        }
    }
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException{
        PrintWriter w = response.getWriter();
        int id = Integer.parseInt(request.getParameter("id"));       
        try {
            con = CriarConexao.getConexao();
            u = new Usuario();
            uDao = new UsuarioDao(con);
            u = uDao.pesId(id);     
            request.setAttribute("usuario", u);
            request.getRequestDispatcher("logado.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    //metodo salvar usuario
    private void salvar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        PrintWriter write = response.getWriter();
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        String nome = request.getParameter("nome");    
        
        try {
            con = CriarConexao.getConexao();
            
            u = new Usuario();
            u.setEmail(email);
            u.setSenha(senha);
            u.setNome(nome);            
            uDao = new UsuarioDao(con);
            uDao.adicionar(u);
            request.setAttribute("email", u.getEmail());
            request.getRequestDispatcher("cadastro.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CadastroLoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    //metodo para editar o usuario
    private void atualizar(HttpServletRequest request, HttpServletResponse response)
            throws IOException{
        PrintWriter out = response.getWriter();        
        try {
            con = CriarConexao.getConexao();
            uDao = new UsuarioDao(con);
            u = new Usuario();
            u.setId(Integer.parseInt(request.getParameter("id")));
            u.setNome(request.getParameter("nome"));
            u.setEmail(request.getParameter("email"));
            u.setSenha(request.getParameter("senha"));            
            uDao.editar(u);
            response.sendRedirect("logado.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void excluir (HttpServletRequest request, HttpServletResponse response)
            throws IOException{
        PrintWriter w = response.getWriter();
        try {
            con = CriarConexao.getConexao();
            uDao = new UsuarioDao(con);   
            uDao.excluir(Integer.parseInt(request.getParameter("id")));
            response.sendRedirect("logado.jsp");
        } catch (Exception e) {
        }
    }
}
