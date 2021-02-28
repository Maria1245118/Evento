<%-- 
    Document   : index
    Created on : 27/02/2021, 21:03:39
    Author     : Maria
--%>
package classes;
<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <style>
            .info{
                position: relative;
                background-color: white;
                width: 220px;
                height: 270px;
                margin-top: 150px;
                margin-left: 140px;
                overflow: auto;
                padding: 3px;
            }
            p.uppercase{
                text-transform: uppercase;
            }
            h1{
                text-align: center;
            }
            .sala{
                background-image: url(imagens/sala_evento.png);
                background-repeat: no-repeat;
                background-size: 100%100%;
                display: flex;
                width: 500px;                
                height: 500px;
                margin-left: auto;
                margin-right: auto;
                margin-top: auto;
                margin-bottom: auto;             
            }
        </style>
<nav id="menu">
            <ul class="menu">
                <li><a href="index.jsp">Inicio</a></li> 

                <li><a href="#">EspacoGourmet</a>
                    <ul>
                        <li><a href="espacogourmet-cadastrar.jsp">Cadastro</a></li>
                        <li><a href="espacogourmet-consultar.jsp">Consulta</a></li> 
                         <li><a href="espacogourmet-recebe-cadastar.jsp">Consulta</a></li> 
                        
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