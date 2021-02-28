<%-- 
    Document   : espacogurmet-cadastrar
    Created on : 27/02/2021, 19:45:57
    Author     : Maria
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8"); //para não desconfigurar a acentuação
%>
<jsp:include page = "header.jsp">
    <jsp:param name="tituloPagina" value="Cadastro de Espacogourmet" />
</jsp:include>
                <h1>Cadastro de Espacogourmet</h1>
                
                <form action="espacogurmet-recebe-cadastrar.jsp" method="POST" onsubmit="return enviarForm()">
                                        
                    <div class="form-grupo">
                        <label>Nome do Espacogourmet <span class="asterisco">*</span></label>
                        <input class="form-campo" type="text" name="nome"/>
                        <div class="alerta alerta-vermelho d-none" id="erroNome"></div>
                    </div>

                    <div class="form-grupo">
                        <label>Quantidade de Pessoa <span class="asterisco">*</span></label>
                        <input class="form-campo form-campo-w250" type="text" name="tipo" placeholder="Quantidade"/>
                        <div class="alerta alerta-vermelho d-none" id="erroQuantidade"></div>
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
                    document.getElementById("erroNome").innerHTML = "Informar o Nome do Espacogourmet";
                    document.getElementById("erroNome").style = "display: block";
                    semErros = false;
                }
                else {
                    document.getElementById("erroNome").style = "";
                }

                var quantidade = document.getElementsByName("quantidade");
                if (quantidade[0].value === "") {
                    document.getElementById("erroQuantidade").innerHTML = "Informar a quantidade de Pessoa";
                    document.getElementById("erroQuantidae").style = "display: block";
                    semErros = false;
                }
                else {
                    document.getElementById("erroQuantidade").style = "";
                }
                
                return semErros; 
            }
        </script>
<jsp:include page = "footer.jsp"/>

