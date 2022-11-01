
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0,
              shrink-to-fit=no">
        <link rel="stylesheet" href="bootstrap/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="fonts/css/all.css" type="text/css">
        <link rel="stylesheet" href="css/menu.css" type="text/css">
        <link rel="stylesheet" href="css/styles.css" type="text/css">
        <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css" type="text/css">
        <link rel="stylesheet" href="datatables/css/jquery.dataTables.min.css" type="text/css">
        <title>Cadastro de Perfil</title>
    </head>
    <body>
        <%
            String msg = (String) request.getAttribute("msg");
            if(msg != null){
                out.println(
                   "<script type='text/javascript'>" +
                   "alert('" + msg + "');" +
                   "</script>");
            }
            
        %>
        <div id="container">
            
            <div id="header">
                <jsp:include page="template/banner.jsp"></jsp:include>
            </div>
            <div id="menu">
                <jsp:include page="template/menu.jsp"></jsp:include>
            </div>
            <div id="conteudo" class="bg-background">
                <form action="gerenciarMenuPerfil" method="POST" 
                      accept-charset="iso-8859-1,utf-8">
                    <h3 class="text-center mt-5">Cadastro de Menu e Perfil</h3>
                    
                    <input type="hidden" id="idperfil" name="idPerfil" 
                           value="${perfilv.idPerfil}">
                    
                    <div class="form-group row offset-md-2 mt-4">
                        <label for="idnome" 
                               class="col-md-2 form-label btn btn-primary btn-md">Nome</label>
                        <div class="col-md-6">
                            <input type="text" name="nome" id="idnome" 
                                   class="form-control" readonly value="${perfilv.nome}">
                            
                        </div>
                    </div>
                    <div class="form-group row offset-md-2 mt-3">
                        <label for="idMenu" 
                               class="col-md-2 form-label btn btn-primary btn-md">Menu</label>
                        <div class="col-md-6">
                            <select id="idMenu" name="idMenu"
                                    class="form-control-sm mt-3">
                                <option value="" selected>Escolha um Menu</option>
                                <c:forEach var="m" items="${perfilv.naoMenus}">
                                    <option value="${m.idMenu}">${m.nome}</option>
                                </c:forEach>
                                
                                
                            </select>
                            
                        </div>
                    </div>
                    <div class="d-md-flex justify-content-md-end mr-3">
                        <button  class="btn btn-primary btn-md mr-2">
                            Vincular&nbsp;
                            <i class="fa-solid fa-floppy-disk"></i>
                        </button>
                        <a href="gerenciarPerfil?acao=listar"
                           class="btn btn-secondary btn-md" 
                           role="button">
                           Voltar&nbsp;
                           <i class="fa-solid fa-rotate-left"></i>
                            
                        </a>
                        
                    </div>
                </form>
                <div class="h-100 justify-content-center align-items-center">
                    <h3 class="text-center">Menus Vinculados ao Perfi</h3>
                    <div class="table-responsive">
                        <table class="table table-hover table-bordered"
                               id="listarMenuPerfil">
                            <thead class="bg-primary">
                                <tr class="text-white">
                                    <th>Código</th>
                                    <th>Nome</th>
                                    <th>Link</th>
                                    <th>Icone</th>
                                    <th>exibir</th>
                                    <th>Ação</th>
                                </tr>
                                
                            </thead>
                            <tbody>
                                <c:forEach var="m" items="${perfilv.menus}">
                                <tr>
                                    <td>${m.idMenu}</td>
                                    <td>${m.nome}</td>
                                    <td>${m.link}</td>
                                    <td>${m.icone}</td>
                                    <td>
                                        <c:if test="${m.exibir == 1}">
                                            Sim
                                        </c:if>
                                        <c:if test="${m.exibir == 0}">
                                            Não
                                        </c:if>
                                    </td>
                                    <td>
                                        <script type="text/javascript">
                                            function confirmDesvincular(idMenu, nome, idPerfil){
                                                if(confirm("Deseja desvincular o menu " +nome+ " ?")){
                                                    location.href="gerenciarMenuPerfil?acao=desvincular&idMenu="+idMenu+"&idPerfil="+idPerfil;
                                                }
                                            }
                                        </script>
                                       <button class="btn btn-danger btn-sm"
                                          onclick="confirmDesvincular('${m.idMenu}','${m.nome}','${perfilv.idPerfil}')">
                                           Desvincular&nbsp;<i class="fas fa-trash"></i>
                                       </button>
                                    </td>
                                </tr>
                                </c:forEach>
                            </tbody>
                            
                        </table>
                    </div>
                </div>
                
            </div><!-- fim da div conteúdo-->
            
       </div><!-- fim da div container -->
        
        <!--JQuery.js -->
        <script src="js/jquery.min.js"></script>
        <script src="datatables/js/jquery.dataTables.min.js"></script>
        <!--Popper.js via cdn -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha512-Ua/7Woz9L5O0cwB/aYexmgoaD7lw3dWe9FvXejVdgqu71gRog3oJgjSWQR55fwWx+WKuk8cl7UwA1RS6QCadFA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <!-- Bootstrap.js -->
        <script src="js/bootstrap.min.js"></script>
        <script src="datatables/js/dataTables.bootstrap4.min.js"></script>
        <script type="text/javascript">
             $(document).ready(function () {
                $("#listarMenuPerfil").DataTable({
                    "bJQueryUI": true,
                    "lengthMenu": [[5, 10, 20, 25, -1], [5, 10, 20, 25, "Todos"]],
                        "oLanguage": {
                            "sProcessing": "Processando..",
                            "sLengthMenu": "Mostrar _MENU_ registros",
                            "sZeroRecords": "Não foram encontrados resultados",
                            "sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registros",
                            "sInfoEmpty": "Mostrando de 0 até 0 de 0 registros",
                            "sInfoFiltered": "",
                            "sInfoPostFix": "",
                            "sSearch": "Pesquisar",
                            "sUrl": "",
                        "oPaginate": {
                            "sFirst": "Primeiro",
                            "sPrevious": "Anterior",
                            "sNext": "Próximo",
                            "sLast": "Último"
                            }
                        }
                    });
                }); 
            </script>    
    </body>
</html>

