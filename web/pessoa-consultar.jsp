<%-- 
    Document   : pessoa-consultar
    Created on : 27/02/2021, 15:35:04
    Author     : Maria
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page = "header.jsp">
<jsp:param name="tituloPagina" value="Relação de Salas Cadastrados" />
</jsp:include>

                <h1>Relação de Pessoa Cadastrados</h1>
                <%
                    request.setCharacterEncoding("UTF-8"); //para não desconfigurar a acentuação

                    String pesquisa = request.getParameter("pesquisa");
                    String txtPesquisa = "";
                    List <Pessoa> pessoas = null;
                    if (pesquisa == null || "".equals(pesquisa)) {
                        pessoas= Pessoa.consultarNome("nome");
                    }
                    else {
                        txtPesquisa = request.getParameter("txtPesquisa").toUpperCase();
                        switch(pesquisa){
                            case "idpessoa":
                                pessoas = Pessoa.consultarNome(txtPesquisa);
                                pessoas = new ArrayList<>();
                                
                                break;
                            case "nome":
                                pessoas = Pessoa.consultarNome(txtPesquisa);
                                break;
                            case "sobrenome":
                                pessoas = Pessoa.consultarNome(txtPesquisa);
                                break;
                        }
                    }
                %>

                <form method="POST" class="form-pesquisa">
                    <label>Pesquisar: </label>
                    <select class="form-campo" name="pesquisa">
                        <option value="" <%out.write("".equals(pesquisa) || pesquisa == null ? " selected='selected'" : "");%> > </option> <!-- retorna a lista completa cadastrada -->
                        <option value="idpessoa" <%out.write("idpessoa".equals(pesquisa) ? " selected='selected'" : "");%> >Código</option> <!-- fixa a opção de consulta no código após busca -->
                        <option value="nome" <%out.write("nome".equals(pesquisa) ? " selected='selected'" : "");%> >Pessoa</option>
                        <option value="sobrenome" <%out.write("sobrenome".equals(pesquisa) ? " selected='selected'" : "");%> >Sobrenome</option>
                    </select>
                    <input class="form-campo" type="text" name="txtPesquisa" value="<%out.write(txtPesquisa);%>"/>
                    <button type="submit" class="btn btn-azul btn-sm"><i class="fas fa-search"></i> Buscar</button>
                </form>
                    
                <table class="tabela-consulta"> <!-- Indicação do início da tabela -->
                    <thead> <!-- Indicação de início do cabeçalho da tabela -->
                        <th class="direita">Código</th> <!-- Item do cabeçalho da tabela -->
                        <th class="esquerda">Nome</th>
                        <th class="centro">Sobrenome</th>
                        <th class="centro">Ações</th> 
                    </thead> <!-- Indicação de final do cabeçalho da tabela -->
                    <tbody class="consulta"> <!-- Indicação de início do corpo da tabela -->
                        <% for (Pessoa pes : pessoas) { %>
                            <tr id="botao"> <!-- Indicação do início dos itens que formarão as linhas da tabela -->
                                <td class="direita"><%out.write(String.valueOf(pes.getIdPessoa()));%></td>
                                <td class="esquerda"><%out.write(pes.getNome());%></td> 
                                <td class="centro"><%out.write(pes.getSobrenome());%></td>
                                <td class="centro"><%out.write("<a href=pessoa-cadastro-alterar.jsp?idpessoa="+String.valueOf(pes.getIdPessoa())
                                        +"><i class='fas fa-edit' title='Editar'></i></a>");%>&nbsp;&nbsp;&nbsp;<%out.write("<a href=\"javascript:if(confirm('Confirma Exclusão?')){document.location='pessoa-excluir.jsp?"
                                        + "idcliente="+String.valueOf(pes.getIdPessoa())+"';}\"><i class='fas fa-trash-alt' title='Excluir'></i></a>");%></td>
                            </tr> <!-- Indicação do fim dos itens que formarão as linhas da tabela -->
                        <% } %>
                    </tbody> <!-- Indicação de final do corpo da tabela -->
                </table> <!-- Indicação do final da tabela -->

                <div class="grupo-botoes">
                    <button type="reset" class="btn btn-vermelho" onclick="document.location='index.jsp';">Cancelar</button>
                </div>
<jsp:include page = "footer.jsp"/>

               