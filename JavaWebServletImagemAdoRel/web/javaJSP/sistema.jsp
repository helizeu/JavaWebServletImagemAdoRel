<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  String nomeUser = (String) session.getAttribute("nome");
  String nivelUser = (String) session.getAttribute("nivel");
  if (nomeUser == null) response.sendRedirect("../index.html");
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Atualização Cadastral </title>
</head>
<body style="background-color: greenyellow;" >
    <center>
    <br> <br> <br> 
    <h2 style="color:black;"> *** Bem vindo ao Sistema Java Web Servlet Uploader *** </h2>
    <%   if (nomeUser != null) %> 
         Usuário Logado <%=nomeUser%> - <%=nivelUser%> 
    <br> <br> <br>
    <div>
              <table >
                <tr><td>
                    <a href="../javaJSP\cadastro.jsp">
                        <img src="../javaIMG\cadastro.png" alt="Atualizar cadastro " height="100px" width="100px"></a>     

                </td>
                <td>&nbsp;&nbsp;&nbsp;</td>
                <td>
                    <a href="../relatorio.jsp">
                        <img src="../javaIMG\relatorio.jfif" alt="Listar Usuários " height="100px" width="100px"></a>
                   
                </td>
            
                <td>&nbsp;&nbsp;&nbsp;</td>
                <td>
                    <a href="../index.html">
                        <img src="../javaIMG\saida.png" alt="Sair" height="100px" width="100px"></a>
                   
                </td></tr>
               </table>
    </div>
    </center>
</body>
</html>
