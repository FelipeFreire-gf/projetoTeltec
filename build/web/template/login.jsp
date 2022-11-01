<%-- 
    Document   : login
    Created on : 01/11/2022, 11:32:48
    Author     : felip
--%>

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
    </head>

    <body>

        <div class="wrapper fadeInDown">
            <div id="formContent">

                <!-- ICONE -->
                <div class="fadeIn first">
                    <img src="imagens/qwer.PNG" id="icon" alt="icone" />
                </div>

                <!-- FORM DO LOGIN -->
                <form action="gerenciarLogin" method="POST"accept-charset="iso-8859-1,utf-8" >
                    <label for="idlogin" class="fadeIn second"></label>
                    <input type="text" id="idlogin" class="fadeIn second" name="credencial" placeholder="Credencial">
                   
                    <label for="idsenha" class="fadeIn second"></label>
                    <input type="password" id="idsenha" class="fadeIn third" name="login" placeholder="Senha">
                    
                    <input type="submit" class="fadeIn fourth" value="Entrar">
                </form>

                <!-- ALGUMAS MENSSAGENS -->
                <div id="formFooter">
                    <a class="underlineHover" href="#">ÁREA RESTRITA</a>
                </div>

            </div>
        </div>
      
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
    </body>

</html>
