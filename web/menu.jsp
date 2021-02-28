<%-- 
    Document   : menu
    Created on : 27/02/2021, 23:24:58
    Author     : Maria
--%>
package classes;
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<nav id="menu">
            <ul class="menu">
                <li><a href="index.jsp">Início</a></li> 

                <li><a href="#">EspacoGourmet</a>
                    <ul>
                        <li><a href="espacogourmet-cadastrar.jsp">Cadastro</a></li>
                        <li><a href="espacogourmet-consultar.jsp">Consulta</a></li>
                        <li><a href="espacogourmet-recebe-cadastrar.jsp">Consulta</a></li> 
                    </ul>
                </li>

                <li><a href="#">Pessoa</a>
                    <ul>
                        <li><a href="pessoa-cadastrar.jsp">Cadastro</a></li>
                        <li><a href="pessoa-consultar.jsp">Consulta</a></li>
                        <li><a href="pessoa-recebe-cadastrar.jsp">Cadastro</a></li>
                    </ul>
                </li>

                <li><a href="#">Sala</a>
                    <ul>
                        <li><a href="sala-cadastrar.jsp">Cadastro</a></li> 
                        <li><a href="sala-consultar.jsp">Consulta</a></li>
                        <li><a href="sala-recebe-cadastrar.jsp">Cadastro</a></li>
                    </ul>            
                </li>
                
               

            </ul>
        </nav>

