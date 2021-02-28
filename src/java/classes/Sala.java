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
public class Sala {
    private int idSala;
    private String nomeSala;
    private float quantidade;
    //Sobrecarga do metodo construtor
     public boolean salvar(){
       String sql = "insert into idsala(nomeSala,quantidade)";
                  sql += "values(?,?,)";
       Connection con = Conexao.conectar();
       
       try {
           PreparedStatement stm = con.prepareStatement(sql);
           stm.setInt(1, this.idSala);
           stm.setString(2, this.nomeSala);
           stm.setFloat(3, this.quantidade);
           stm.execute();           
       } catch (SQLException ex) {
           System.out.println("Erro: " + ex.getMessage()+ sql);
           return false;
       }        
       return true;
   }
     public Sala consultar(String nomeSala){
        Connection con = Conexao.conectar();
        String sql = "select nomeSala,quantidade,from sala where nomesala = ?" ;   
        Sala sala= null;
       try {
           PreparedStatement stm = con.prepareStatement(sql);
           stm.setString(1, nomeSala);
           ResultSet rs = stm.executeQuery();
           if(rs.next()){
             sala = new Sala();
             sala.setNomeSala(rs.getString("nomesala"));
             sala.setQuantidade(rs.getFloat("quantidade"));
            
           }
           
       } catch (SQLException ex) {
           System.out.println("Erro: " + ex.getMessage()+ sql);
       }       
        return sala;  
    }
     public static List<Sala> consultarSala(String Sala) throws Exception {
        Connection con = Conexao.conectar();
        String sql = "select * from idsala where nome like ?";
        List<Sala> listaSala = new ArrayList<>();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, Sala + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Sala salas = new Sala();
                salas.setIdSala(Integer.parseInt(rs.getString("idSala")));
                salas.setNomeSala(rs.getString("nomesala"));
                salas.setQuantidade(Float.parseFloat("quantidade"));
                listaSala.add(salas);
            }
        } catch (SQLException ex) {
            throw new Exception(ex.getMessage());
        }
        return listaSala;
    }

    public int getIdSala() {
        return idSala;
    }

    public void setIdSala(int id) {
        this.idSala = id;
    }

    public String getNomeSala() {
        return nomeSala;
    }

    public void setNomeSala(String nomeSala) {
        this.nomeSala = nomeSala;
    }

    public float getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(float quantidade) {
        this.quantidade = quantidade;
    }

    }
