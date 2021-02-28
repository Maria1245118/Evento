/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Maria
 */
public class Conexao {
    public static Connection conectar(){
        Connection con = null;
            String url = "jdbc:postgresql://localhost:5432/evento";
            String user = "postgres";
            String password = "123";
            try {
                con = DriverManager.getConnection(url, user, password);
            } catch (SQLException ex) {
                System.out.println("Erro de conexão");
            }
        
        return con;
    }
    
}
