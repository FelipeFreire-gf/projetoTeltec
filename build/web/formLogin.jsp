
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
     
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        
           <link rel="stylesheet" href="css/menu.css" type="text/css">
        <link rel="stylesheet" href="css/styles.css" type="text/css">
        
        <title>LOGIN TESTE</title>
    </head>
    <body>
        <%
            String msg = (String) request.getAttribute("msg");
            if(msg != null){
                out.println(
                        "<script type='text/javascript'>" +
                        "alert('" +msg+ "');" +
                        "history.back();" +
                        "</script>"                
                );
            }
            
         %>
         <% 
            String mensagem = 
                (String)request.getSession().getAttribute("mensagem");
            
            if(mensagem != null){
                
                request.getSession().removeAttribute("mensagem");
        %>
        
        <div class="alert alert-info" role="alert">
             <%= mensagem %>
         </div>
         
        <% 
            }
        %>
         
         
         
        
        <div id="container">
            
            
            <div id="menu">
                <jsp:include page="template/menu.jsp"></jsp:include>
            </div>
  
            
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
 <%-- ========================================================================================================= --%>                    
                    
             
                
            </div>
            
       </div>
        
        <!--JQuery.js -->
        <script src="js/jquery.min.js"></script>
        <!--Popper.js via cdn -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha512-Ua/7Woz9L5O0cwB/aYexmgoaD7lw3dWe9FvXejVdgqu71gRog3oJgjSWQR55fwWx+WKuk8cl7UwA1RS6QCadFA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <!-- Bootstrap.js -->
        <script src="js/bootstrap.min.js"></script>
            
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
        
    </body>
</html>
