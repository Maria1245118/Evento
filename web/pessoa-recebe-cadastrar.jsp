<%-- 
    Document   : pessoa-recebe-cadastrar
    Created on : 27/02/2021, 23:35:11
    Author     : Maria
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="classes.Pessoa" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistema Eventos</title>
        <link rel="shortcut icon" href="imagens/sala_evento.png" type="">
        <link rel="stylesheet" href="styles/estilos.css">
    </head>
    <body>
         <div id="interface">

        <section id="corpo">
            <article>
                <h1>Cadastro de Pessoas</h1>
                <hr/>
                <%
                    request.setCharacterEncoding("UTF-8"); //para não desconfigurar a acentuação
                    
                    String nome = request.getParameter("nome");
                    String sobrenome = request.getParameter("sobrenome");
                    
                    Pessoa pessoa= new Pessoa();
                    pessoa.setNome(nome.toLowerCase());
                    pessoa.setSobrenome(sobrenome.toLowerCase());
                  
                    
                    try {
                        pessoa.salvar();
                        out.write("Dados Cadastrados com Sucesso");
                    } catch (Exception ex) {
                        out.write("Erro: " + ex.getMessage());
                    }
                %>
            </article>
        </section>
        <footer id="rodape">
            <script src="scripts/rodape.js"></script>
        </footer>
    </div>
    </body>
</html>

    