/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author marci
 */
public class UsuarioDao {
    private Connection con;
    public UsuarioDao(Connection conn){
        this.con = conn;
    }
    public void adicionar(Usuario u) throws SQLException{
        String sql = "insert into tb_login(email, senha, nome) values (?, ?, ?)";
        
        try {
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, u.getEmail());
            stmt.setString(2, u.getSenha());
            stmt.setString(3, u.getNome());
            
            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
            con.close();
        }
    }
    
    public ArrayList<Usuario>listar() throws SQLException, ClassNotFoundException{
        ArrayList<Usuario> usuario = new ArrayList<Usuario>();
        try {
            String sql="select * from tb_login";           
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            Usuario u;
            while(rs.next()){
                u = new Usuario();
                u.setId(rs.getInt("id"));
                u.setEmail(rs.getString("email"));
                u.setNome(rs.getString("nome"));
                u.setSenha(rs.getString("senha"));
                usuario.add(u);               
            }
             stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            con.close();
        }
        return usuario;
    }
    
    public void editar(Usuario u) throws Exception{
        try {
            String sql = "UPDATE tb_login set nome=?, email=?, senha=? where id=? ";
            PreparedStatement stmt = con.prepareStatement(sql);
            
            stmt.setString(1, u.getNome());
            stmt.setString(2, u.getEmail());
            stmt.setString(3, u.getSenha());
            stmt.setInt(4, u.getId());
            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException e) {
             e.printStackTrace();
        }finally{
            con.close();
        }
    }
    
    public Usuario pesId(int id) throws Exception{
        try {
            Usuario u = null;
            String sql = "Select * from tb_login where id = ?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    u = new Usuario();
                    u.setId(rs.getInt("id"));
                    u.setNome(rs.getString("nome"));
                    u.setEmail(rs.getString("email"));
                    u.setSenha(rs.getString("senha"));
                }
            }
            return u;
        }  finally {
            con.close();
        }
    }

    public void excluir(int id) throws Exception{
        try {
            String sql = "Delete from tb_login where id=? ";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, id);
            stmt.executeUpdate();
            stmt.close();
        } catch (Exception e) {
             e.printStackTrace();
        } finally {
            con.close();
        }
    }
}
