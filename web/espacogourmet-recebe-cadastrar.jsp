<%-- 
    Document   : espacogourmet-recebe-cadastrar
    Created on : 28/02/2021, 09:42:56
    Author     : Maria
--%>

<%@page import="classes.EspacoGourmet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="classes.EspacoGourmet" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistema de Eventos</title>
        <link rel="shortcut icon" href="imagens/sala_evento.png" type="image/x-icon">
        <link rel="stylesheet" href="styles/estilos.css">
    </head>
    <body>
         <div id="interface">

        <section id="corpo">
            <article>
                <h1>Cadastro de Espacogourmet</h1>
                <hr/>
                <%
                    request.setCharacterEncoding("UTF-8"); //para não desconfigurar a acentuação
                    
                    String nome = request.getParameter("nome");
                    String quantidade= request.getParameter("quantidade");
                    
                    EspacoGourmet espacogourmet = new EspacoGourmet();
                    espacogourmet.setNome(nome.toLowerCase());
                    espacogourmet.setQuantidade(Float.parseFloat(quantidade.toLowerCase()));
                  
                    
                    try {
                        espacogourmet.salvar();
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
