<%@page import="javaBeans.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  
    String email = (String) session.getAttribute("email");
    if (email == null)  response.sendRedirect("../index.html");
 
    String minhafoto = "";
    boolean existeUser = false;

    Usuario user = new Usuario();
    user.email = email;
    if ( user.buscarEmail()) existeUser = true;
%>


<html lang = "pt-br"><head>
        <title> Cadastro de Usuários </title> <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"></head>
    <body style="background-color: greenyellow;" onload="formCad.nome.focus()">
        <br><br> <h1 align = center> Atualização Cadastral de Usuários </h1> <br>
        <div align = center>   

            <form action="../CadUser" name = formCad method=post enctype="multipart/form-data" >
             
                <%/* COMENTÁRIO IMPORTANTE - Eeste ScriptLet é configurado somente para arquivos JPEG  
Para outros formatos necessário alterar a tag SRC  
JPEG Ficará assim => <img src="data:image/jpeg;base64,foto.jpg">
PNG Ficará assim => <img src="data:image/png;base64,foto.png">
No TomCat o tamanhanho máximo padrão de imagem é de 2mb
Acima de 2MB necessário alterar o arquivo web.xml */%>

<table border="1" >
<tr><td align = center>FOTO(Formato.JPG até 2MB )</td></tr>
<tr><td align = center>
<img src="data:image/jpeg;base64,<%if(user.imagemBase64 != null)out.print(user.imagemBase64);%>" 
style="height: 100px;width: 100px;" alt="Foto" ></td></tr>
<tr><td> <input type="file" name="arquivo" id = "arq"></td></tr>
</table>


                <table align = center style="border-style: solid;">
                    <tr><td></td><td></tr>
                    <tr><td align="right">Digite seu nome...:</td><td><input type="text" name = nome size = 40 
                  value = "<%if (!(user.nome == null)) out.print(user.nome);%>"> </td></tr>

                    <tr><td align="right">Digite seu email..:</td><td><input type="email" name = email size = 40
                     value = "<% if (!(user.email == null)) out.print(user.email); %>"> </td></tr>

                    <tr><td align="right">Digite seu Celular:</td><td>
                            <input type="text" name = celular size = 40 
                                   value = "<%if (!(user.celular == null)) out.print(user.celular); %>"> </td></tr>

                    <tr><td align="right">Digite sua Senha..:</td><td>
                            <input type="password" name = senha size = 40
                                   value = "<%if (!(user.senha == null)) out.print(user.senha); %>"> </td></tr>

                    <tr>  <td align="right">Tipo de acesso....:</td><td><select name="nivel" id="idnivel" >
                                <option value = "<%if (!(user.nivel == null)) out.print(user.nivel); %>" selected>
                                    <%if (!(user.nivel == null)) out.print(user.nivel); %> </option>
                                <option value="administrador"> Administrador </option>
                                <option value="gerente"> Gerente </option>
                                <option value="normal"> Normal </option>
                            </select> </td></tr> 
                </table><br>
                <table align="center">
                    <tr>
                        
                        <td align="center">
                            <input type="submit" value="Gravar" name ="gravar" 
                                   style="height: 30px; width: 70px;background-color: rgba(92, 117, 116, 0.26);border-radius: 20%;">
                        </td>
                        
                        <td align="center">
                            <input type="submit" value="Deletar"  name ="deletar"
                                   style="height: 30px; width: 70px;background-color: rgba(92, 117, 116, 0.26);border-radius: 20%;">
                        </td>
                                                
                        <td align="center">
                            <input type="button" value="Voltar" 
                                   onclick="window.location.href = '../index.html';" 
                                   style="height: 30px; width: 70px;background-color: rgba(92, 117, 116, 0.26);border-radius: 20%;">
                        </td>   
                    </tr>
                </table>
            </form>
    </div></body></html>