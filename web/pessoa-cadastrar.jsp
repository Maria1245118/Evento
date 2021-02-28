<%-- 
    Document   : cadastropessoa
    Created on : 27/02/2021, 15:15:09
    Author     : Maria
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="classes.Pessoa"%>

<%
    request.setCharacterEncoding("UTF-8"); //para não desconfigurar a acentuação
%>
<jsp:include page = "header.jsp">
<jsp:param name="tituloPagina" value="Cadastro de Pessoa" />
</jsp:include>
                <h1>Cadastro de Pessoa</h1>
                
                <form action="pessoa-recebe-cadastrar.jsp" method="POST" onsubmit="return enviarForm()">
                                        
                    <div class="form-grupo">
                        <label>Nome da Pessoa <span class="asterisco">*</span></label>
                        <input class="form-campo" type="text" name="nome"/>
                        <div class="alerta alerta-vermelho d-none" id="erroNome"></div>
                    </div>

                    <div class="form-grupo">
                        <label>Sobrenome da Pessoa <span class="asterisco">*</span></label>
                        <input class="form-campo form-campo-w250" type="text" name="sobrenome" placeholder="Sobrenome"/>
                        <div class="alerta alerta-vermelho d-none" id="erroSobrenome"></div>
                    </div>

                    <div class="grupo-botoes">
                        <button class="btn btn-verde" type="submit">Salvar</button>
                        <button class="btn btn-vermelho" type="reset" onclick="document.location='index.jsp';"/>Cancelar</button>
                    </div>
                </form>

        <script>
            function enviarForm() {
                var semErros = true;

                var nome = document.getElementsByName("nome");
                if (nome[0].value === "") {
                    document.getElementById("erroNome").innerHTML = "Informar o Nome da Pessoa";
                    document.getElementById("erroNome").style = "display: block";
                    semErros = false;
                }
                else {
                    document.getElementById("erroNome").style = "";
                }

                var sobrenome = document.getElementsByName("sobrenome");
                if (sobrenome[0].value === "") {
                    document.getElementById("erroSobrenome").innerHTML = "Informar o sobrenome da Pessoa";
                    document.getElementById("erroSobrenome").style = "display: block";
                    semErros = false;
                }
                else {
                    document.getElementById("erroSobrenome").style = "";
                }
                
                return semErros; 
            }
        </script>
<jsp:include page = "footer.jsp"/>
