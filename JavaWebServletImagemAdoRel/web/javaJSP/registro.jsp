<%@page import="javaBeans.Usuario"%>
<%  
    
   Usuario user = new Usuario(); // Instancia o objeto Usuario
    if (!(user.statusSQL == null)) {
        out.println(user.statusSQL);
    }

    String oper = request.getParameter("oper");
    user.nome = request.getParameter("nome");
    user.email = request.getParameter("email");
    user.celular = request.getParameter("celular");
    user.senha = request.getParameter("senha");
    user.nivel = request.getParameter("nivel");
    String sHTML = "";

    if (oper.equals("gravar")) {
        if (user.buscarEmail()) {
            user.alterar();
            sHTML = "<br><br><center>Usuário alterado com Sucesso!<br>"
                    + "<a href = '../index.html'> Voltar </a></center>";
        } else {
            user.incluir();
            sHTML = "<br><br><center>Usuário criado com Sucesso!<br>"
                    + "<a href = '../index.html'> Voltar </a></center>";
        }
    }

%>
<html lang = "pt-br">
    <head>
        <title> Registro de Usuários </title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body style="background-color: greenyellow;" >
        <%
            if (!(user.statusSQL == null)) {
                out.println(user.statusSQL);
            } else {
                out.println(sHTML);
            }
        %>
    </body>
</html>
