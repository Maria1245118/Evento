package classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.Conexao;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Maria
 */
public class EspacoGourmet {
    private int idEspacogourmet;
    private String nome ;
    private float quantidade;
    private EspacoGourmet espacogourmet;
    
    public boolean salvar(){
       String sql = "insert into espacogourmet(nomeEspaco,quantidade)";
                  sql += "values(?,?,)";
       Connection con = Conexao.conectar();
       
       try {
           PreparedStatement stm = con.prepareStatement(sql);
           stm.setInt(1, this.idEspacogourmet);
           stm.setString(2, this.nome);
           stm.setFloat(3, this.quantidade);
           stm.execute();           
       } catch (SQLException ex) {
           System.out.println("Erro: " + ex.getMessage()+ sql);
           return false;
       }        
       return true;
   }
    
    public void editar()throws Exception {
        Connection con = Conexao.conectar();
        String sql = "update espacogourmet set nome = ?, quantidade = ?, where idEspacogourmet = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.nome);
            stm.setFloat(2, this.quantidade);
            stm.setInt(3, this.idEspacogourmet);
            stm.execute();
        } catch (SQLException ex) {
            throw new Exception(ex.getMessage());
        }
    }
     public EspacoGourmet consultar(String nome){
        Connection con = Conexao.conectar();
        String sql = "select nome,quantidade,from espacogurmet where nome = ?" ;   
         EspacoGourmet espacogurmet= null;
       try {
           PreparedStatement stm = con.prepareStatement(sql);
           stm.setString(1,nome);
           ResultSet rs = stm.executeQuery();
           if(rs.next()){
             espacogourmet = new EspacoGourmet();
             espacogourmet.setNome(rs.getString("nome"));
             espacogourmet.setQuantidade(rs.getFloat("quantidade"));
            
           }
           
       } catch (SQLException ex) {
           System.out.println("Erro: " + ex.getMessage()+ sql);
       }       
        return espacogurmet;  
    
    }
     
    public static List<EspacoGourmet> consultarNome(String nome)  {
        Connection con = Conexao.conectar();
        String sql = "select * from idEspacogourmet where nome like ?";
        List<EspacoGourmet> listaEspacogourmet = new ArrayList<>();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, nome + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                EspacoGourmet espacogourmets = new EspacoGourmet();
                espacogourmets.setIdEspacogourmet(Integer.parseInt(rs.getString("idEspacogourmet")));
                espacogourmets.setNome(rs.getString("nome"));
                espacogourmets.setQuantidade(Float.parseFloat("quantidade"));
                listaEspacogourmet.add(espacogourmets);
            }
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
        }
        return listaEspacogourmet;
    }
    public int getIdEspacogourmet() {
        return idEspacogourmet;
    }

    public void setIdEspacogourmet(int idEspacogourmet) {
        this.idEspacogourmet = idEspacogourmet;
    }

    public float getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(float quantidade) {
        this.quantidade = quantidade;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String Nome) {
        this.nome = nome;
    }

    
}