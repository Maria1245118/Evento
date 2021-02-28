<%-- 
    Document   : espacogourmet-consultar
    Created on : 27/02/2021, 19:51:19
    Author     : Maria
--%>

<%@page import="classes.EspacoGourmet"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page = "header.jsp">
<jsp:param name="tituloPagina" value="Relação de Espacogourmet Cadastrados" />
</jsp:include>

                <h1>Relação do Espacogourmet Cadastrados</h1>
                <%
                    request.setCharacterEncoding("UTF-8"); //para não desconfigurar a acentuação

                    String pesquisa = request.getParameter("pesquisa");
                    String txtPesquisa = "";
                    List <EspacoGourmet> espacogourmets = null;
                    if (pesquisa == null || "".equals(pesquisa)) {
                        espacogourmets= EspacoGourmet.consultarNome("nome");
                    }
                    else {
                        txtPesquisa = request.getParameter("txtPesquisa").toUpperCase();
                        switch(pesquisa){
                            
                            case "nome":
                                espacogourmets = EspacoGourmet.consultarNome(txtPesquisa);
                                break;
                            case "quantidae":
                                espacogourmets = EspacoGourmet.consultarNome(txtPesquisa);
                                break;
                        }
                    }
                %>

                <form method="POST" class="form-pesquisa">
                    <label>Pesquisar: </label>
                    <select class="form-campo" name="pesquisa">
                        <option value="" <%out.write("".equals(pesquisa) || pesquisa == null ? " selected='selected'" : "");%> > </option> <!-- retorna a lista completa cadastrada -->
                        <option value="idespacogourmet" <%out.write("idespacogourmet".equals(pesquisa) ? " selected='selected'" : "");%> >Código</option> <!-- fixa a opção de consulta no código após busca -->
                        <option value="nome" <%out.write("nome".equals(pesquisa) ? " selected='selected'" : "");%> >Nome</option>
                        <option value="quantidade" <%out.write("quantidade".equals(pesquisa) ? " selected='selected'" : "");%> >Quantidade</option>
                    </select>
                    <input class="form-campo" type="text" name="txtPesquisa" value="<%out.write(txtPesquisa);%>"/>
                    <button type="submit" class="btn btn-azul btn-sm"><i class="fas fa-search"></i> Buscar</button>
                </form>
                    
                <table class="tabela-consulta"> <!-- Indicação do início da tabela -->
                    <thead> <!-- Indicação de início do cabeçalho da tabela -->
                        <th class="direita">Código</th> <!-- Item do cabeçalho da tabela -->
                        <th class="esquerda">Nome</th>
                        <th class="centro">Quantidade</th> 
                    </thead> <!-- Indicação de final do cabeçalho da tabela -->
                    <tbody class="consulta"> <!-- Indicação de início do corpo da tabela -->
                        <% for (EspacoGourmet eg : espacogourmets) { %>
                            <tr id="botao"> <!-- Indicação do início dos itens que formarão as linhas da tabela -->
                                <td class="direita"><%out.write(String.valueOf(eg.getIdEspacogourmet()));%></td>
                                <td class="esquerda"><%out.write(eg.getNome());%></td> 
                                <td class="centro"><%out.write(String.valueOf(eg.getQuantidade()));%></td>
                                <td class="centro"><%out.write("<a href=sala-recebe-cadastrar.jsp?idsala="+String.valueOf(eg.getNome())
                                        +"><i class='fas fa-edit' title='Editar'></i></a>");%>&nbsp;&nbsp;&nbsp;<%out.write("<a href=\"javascript:if(confirm('Confirma Exclusão?')){document.location='espacogourmet-excluir.jsp?"
                                        + "idsala="+String.valueOf(eg.getIdEspacogourmet())+"';}\"><i class='fas fa-trash-alt' title='Excluir'></i></a>");%></td>
                            </tr> <!-- Indicação do fim dos itens que formarão as linhas da tabela -->
                        <% } %>
                    </tbody> <!-- Indicação de final do corpo da tabela -->
                </table> <!-- Indicação do final da tabela -->

                <div class="grupo-botoes">
                    <button type="reset" class="btn btn-vermelho" onclick="document.location='index.jsp';">Cancelar</button>
                </div>
<jsp:include page = "footer.jsp"/>

             