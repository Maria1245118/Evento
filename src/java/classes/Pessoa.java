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
public class Pessoa {
    private int idpessoa;
    private String nome;
    private String sobrenome;
    //Sobrecarga do metodo construtor
     public boolean salvar(){
       String sql = "insert into pessoa(nome,sobrenome)";
                  sql += "values(?,?,)";
       Connection con = Conexao.conectar();
       
       try {
           PreparedStatement stm = con.prepareStatement(sql);
           stm.setInt(1, this.idpessoa);
           stm.setString(2, this.nome);
           stm.setString(3, this.sobrenome);
           stm.execute();           
       } catch (SQLException ex) {
           System.out.println("Erro: " + ex.getMessage()+ sql);
           return false;
       }        
       return true;
   }
     
     public Pessoa consultar(String nome){
        Connection con = Conexao.conectar();
        String sql = "select pessoa,from pessoa where nome = ?" ;   
        Pessoa pessoa= null;
       try {
           PreparedStatement stm = con.prepareStatement(sql);
           stm.setString(1, nome);
           ResultSet rs = stm.executeQuery();
           if(rs.next()){
             pessoa  = new Pessoa();
             pessoa.setNome(rs.getString("nome"));
            
           }
           
       } catch (SQLException ex) {
           System.out.println("Erro: " + ex.getMessage()+ sql);
       }       
        return pessoa;  
    }
     

    public static List<Pessoa> consultarNome(String nome) {
        Connection con = Conexao.conectar();
        String sql = "select * from idpessoa where nome like ?";
        List<Pessoa> listaPessoa = new ArrayList<>();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, nome + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Pessoa pessoa = new Pessoa();
                pessoa.setIdpessoa(Integer.parseInt(rs.getString("idPessoa")));
                pessoa.setNome(rs.getString("nome"));
                pessoa.setSobrenome("sobrenome");
                listaPessoa.add(pessoa);
            }
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
        }
        return listaPessoa;
    }

    public int getIdPessoa() {
        return idpessoa;
    }

    public void setIdPessoa(int idPessoa) {
        this.idpessoa = idpessoa;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getSobrenome() {
        return sobrenome;
    }

    public void setSobrenome(String sobrenome) {
        this.sobrenome = sobrenome;
    }

    public void setIdpessoa(int idpessoa) {
        this.idpessoa = idpessoa;
    }
    }
