<%-- 
    Document   : sala-recebe-cadastrar
    Created on : 28/02/2021, 16:10:45
    Author     : Maria
--%>

<%@page import="classes.Sala"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistema de Eventos</title>
        <link rel="shortcut icon" href="imagens/sala_evento.png" type="">
        <link rel="stylesheet" href="styles/estilos.css">
    
    <body>
         <div id="interface">

        <section id="corpo">
            <article>
                <h1>Cadastro de Salas</h1>
                <hr/>
                <%
                    request.setCharacterEncoding("UTF-8"); //para não desconfigurar a acentuação
                    
                    String nome = request.getParameter("nome");
                    String quantidade= request.getParameter("quantidade");
                    
                    Sala sala = new Sala();
                    sala.setNomeSala(nome.toLowerCase());
                    sala.setQuantidade(Float.parseFloat(quantidade.toLowerCase()));
                  
                    try {
                       sala.salvar();
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
</head>
</html>
