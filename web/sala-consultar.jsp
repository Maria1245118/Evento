<%-- 
    Document   : sala-consultar
    Created on : 27/02/2021, 16:52:42
    Author     : Maria
--%>




<%@page import="classes.Sala"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page = "header.jsp">
<jsp:param name="tituloPagina" value="Relação de Salas Cadastrados" />
</jsp:include>

                <h1>Relação de Salas Cadastrados</h1>
                <%
                    request.setCharacterEncoding("UTF-8"); //para não desconfigurar a acentuação

                    String pesquisa = request.getParameter("pesquisa");
                    String txtPesquisa = "";
                    List <Sala> salas = null;
                    if (pesquisa == null || "".equals(pesquisa)) {
                        salas= Sala.consultarSala("sala");
                    }
                    else {
                        txtPesquisa = request.getParameter("txtPesquisa").toUpperCase();
                        switch(pesquisa){
                            
                            case "nome":
                                salas = Sala.consultarSala(txtPesquisa);
                                break;
                            case "quantidae":
                                salas = Sala.consultarSala(txtPesquisa);
                                break;
                        }
                    }
                %>

                <form method="POST" class="form-pesquisa">
                    <label>Pesquisar: </label>
                    <select class="form-campo" name="pesquisa">
                        <option value="" <%out.write("".equals(pesquisa) || pesquisa == null ? " selected='selected'" : "");%> > </option> <!-- retorna a lista completa cadastrada -->
                        <option value="idsala" <%out.write("idsala".equals(pesquisa) ? " selected='selected'" : "");%> >Código</option> <!-- fixa a opção de consulta no código após busca -->
                        <option value="nome" <%out.write("nome".equals(pesquisa) ? " selected='selected'" : "");%> >Nome</option>
                        <option value="quantidade" <%out.write("quantidade".equals(pesquisa) ? " selected='selected'" : "");%> >Quantidade)</option>
                    </select>
                    <input class="form-campo" type="text" name="txtPesquisa" value="<%out.write(txtPesquisa);%>"/>
                    <button type="submit" class="btn btn-azul btn-sm"><i class="fas fa-search"></i> Buscar</button>
                </form>
                    
                <table class="tabela-consulta"> <!-- Indicação do início da tabela -->
                    <thead> <!-- Indicação de início do cabeçalho da tabela -->
                        <th class="direita">Código</th> <!-- Item do cabeçalho da tabela -->
                        <th class="esquerda">Nome</th>
                        <th class="centro">Quantidae</th>
                        <th class="centro">Ações</th> 
                    </thead> <!-- Indicação de final do cabeçalho da tabela -->
                    <tbody class="consulta"> <!-- Indicação de início do corpo da tabela -->
                        <% for (Sala sl : salas) { %>
                            <tr id="botao"> <!-- Indicação do início dos itens que formarão as linhas da tabela -->
                                <td class="direita"><%out.write(String.valueOf(sl.getIdSala()));%></td>
                                <td class="esquerda"><%out.write(sl.getNomeSala());%></td> 
                                <td class="centro"><%out.write(String.valueOf(sl.getQuantidade()));%></td>
                                <td class="centro"><%out.write("<a href=sala-cadastro-alterar.jsp?idsala="+String.valueOf(sl.getIdSala())
                                        +"><i class='fas fa-edit' title='Editar'></i></a>");%>&nbsp;&nbsp;&nbsp;<%out.write("<a href=\"javascript:if(confirm('Confirma Exclusão?')){document.location='sala-excluir.jsp?"
                                        + "idsala="+String.valueOf(sl.getIdSala())+"';}\"><i class='fas fa-trash-alt' title='Excluir'></i></a>");%></td>
                            </tr> <!-- Indicação do fim dos itens que formarão as linhas da tabela -->
                        <% } %>
                    </tbody> <!-- Indicação de final do corpo da tabela -->
                </table> <!-- Indicação do final da tabela -->

                <div class="grupo-botoes">
                    <button type="reset" class="btn btn-vermelho" onclick="document.location='index.jsp';">Cancelar</button>
                </div>
<jsp:include page = "footer.jsp"/>

              