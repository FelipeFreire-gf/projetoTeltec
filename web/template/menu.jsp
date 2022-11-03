<%@page language="java" contentType="text/html; utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="controller.GerenciarLogin" %>
<%@page import="model.Usuario" %>

<!DOCTYPE html>
<html>

<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>PROJETO TELTEC</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link rel="stylesheet" href="css/styles.css">
        <link rel="stylesheet" href="css/menus.css">
</head>


<%
    Usuario ulogado = GerenciarLogin.verificarAcesso(request, response);
    request.setAttribute("ulogado", ulogado);


%>

<c:choose>
    <c:when test="${ulogado != null}">
        <div class="d-grip gap-1 d-sm-flex justify-content-sm-between mt-4"
             style>
            <h6 class="mt-1">Bem-vindo, ${ulogado.nome}</h6>
            <a href="gerenciarLogin?"
               class="btn btn-primary btn-sm" role="button">
                Sair&nbsp;<i class="fa-solid fa-user-lock"></i>
            </a>
        </div>
    </c:when>

    <c:otherwise>

        <% response.sendRedirect("index.jsp");%>

            <div class="wrapper fadeInDown">
                <div id="formContent">

                    <!-- ICONE -->
                    <div class="fadeIn first">
                        <img src="imagens/qwer.PNG" id="icon" alt="icone" />
                    </div>


                    <!-- FORM DO LOGIN -->
                    <form action="gerenciarLogin" method="POST"accept-charset="iso-8859-1,utf-8" >
                        <label for="idLogin" class="fadeIn second"></label>
                        <input type="text" id="idLogin" class="fadeIn second" name="login" placeholder="Credencial">

                        <label for="idsenha" class="fadeIn second"></label>
                        <input type="password" id="idSenha" class="fadeIn third" name="senha" placeholder="Senha">

                        <input type="submit" class="fadeIn fourth" value="Entrar">
                    </form>


                    <!-- ALGUMAS MENSSAGENS -->
                    <div id="formFooter">
                        <a class="underlineHover" href="#">ÁREA RESTRITA</a>
                    </div>

                </div>
            </div>





    </c:otherwise>


</c:choose>


<header class="mt-auto">
    <nav class="navbar navbar-expand-lg navbar-light">
        <button class="navbar-toggler" type="button" data-toggle="collapse" 
                data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" 
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" 
             id="navbarSupportedContent">
            <ul class="navbar-nav"> 
                <c:if test="${ulogado != null && ulogado.perfil != null}">

                    <c:forEach var="menu" items="${ulogado.perfil.menus}">
                        <c:if test="${menu.exibir == 1}">
                            <li class="nav-item">
                                <a class="nav-link" href="${menu.link}">${menu.nome}</a>
                            </li>
                        </c:if>

                    </c:forEach>

                </c:if>

            </ul>

        </div>
    </nav>





</header>



       <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
    </body>

</html>