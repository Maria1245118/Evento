<%-- 
    Document   : header
    Created on : 27/02/2021, 20:25:50
    Author     : Maria
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8"); //para não desconfigurar a acentuação
    
    String tituloPagina = request.getParameter("tituloPagina");
%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Espaço de Eventos - <%=tituloPagina%></title>
        <link href="./styles/fontawesome/css/fontawesome.css" rel="stylesheet">
        <link href="./styles/fontawesome/css/solid.css" rel="stylesheet">
        <link rel="icon" href="./imagens/sala_evento.png">
    </head>
    <body>    
    <header>
      <nav class="navbar">
        <div class="container">
        <a class="nome-sistema" href="#">Espaço de Eventos</a>
        <div class="d-flex">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item ativo">
              <a class="nav-link" href="./index.jsp">Home</a>
            </li>
            <li class="nav-item dropdown">
                <div class="dropdown-menu" aria-labelledby="dropdown01">
                <a class="dropdown-item" href="./espacogourmet-cadastrar.jsp">Cadastro do espacogourmet</a><tr/>
                <a class="dropdown-item" href="./espacogourmet-consultar.jsp">Consulta do espacogourmet</a><tr/>
                <a class="dropdown-item" href="./espacogourmet-recebe-cadastrar.jsp">Cadastro do espacogourmet</a><tr/>
                
                <div class="divisor-menu"></div>
                <a class="dropdown-item" href="./pessoa-cadastrar.jsp">Cadastro de pessoa</a><tr/>
                <a class="dropdown-item" href="./pessoa-consultar.jsp">Consulta de pessoa</a><tr/>
                <a class="dropdown-item" href="./pessoa-recebe-cadastrar.jsp">Cadastro de pessoa</a><tr/>
                
                <div class="divisor-menu"></div>
                <a class="dropdown-item" href="./sala-cadastrar.jsp">Cadastro de salas</a><tr/>
                <a class="dropdown-item" href="./sala-consultar.jsp">Consulta de salas</a> <tr/> 
                <a class="dropdown-item" href="./sala-recebe-cadastrar.jsp">Cadastro de salas</a><tr/>
                
              </div>        
             </li>
          </ul>
          <ul class="navbar-nav">
            <li class="nav-item dropdown">
            <%-- <a class="nav-link dropdown-toggle" href="#" id="dropdown05" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><%=session.getAttribute("nomeUsuario")%> <i class="fas fa-angle-down"></i></a>--%>
              <div class="dropdown-menu" aria-labelledby="dropdown05">
               
              </div>
            </li>
          </ul>
        </div>
      </div>
      </nav>
    </header>
    
    <main role="main" class="flex-shrink-0">
      <div class="container">
