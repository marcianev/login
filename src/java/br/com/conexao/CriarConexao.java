package br.com.conexao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author marci
 */
public class CriarConexao {
    public static Connection getConexao() throws SQLException, ClassNotFoundException{
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.print("conectou");
            return DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root", "");
        } catch (SQLException e) {
            throw new SQLException(e);
        } catch (ClassNotFoundException e1){
            throw new SQLException(e1);
        }
    } 
    
}
