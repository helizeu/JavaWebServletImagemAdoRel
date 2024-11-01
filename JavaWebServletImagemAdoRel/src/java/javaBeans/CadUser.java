package javaBeans;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javaBeans.Usuario;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet(name = "CadUser", urlPatterns = {"/CadUser"})
@MultipartConfig
public class CadUser extends HttpServlet {

    private String statusSQL;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String sHTML = "";

        HttpSession session = request.getSession(true);
        if (String.valueOf(session.getAttribute("nome")) == null) 
            response.sendRedirect("../index.html");
        
        Usuario user = new Usuario(); // Instancia o objeto Usuario
        user.email = request.getParameter("email");
        user.nome = request.getParameter("nome");
        user.celular = request.getParameter("celular");
        user.senha = request.getParameter("senha");
        user.nivel = request.getParameter("nivel");
/* Código para trazer a requisição do arquivo e colocar na objeto user */
        Part part = request.getPart("arquivo");
        InputStream arquivo = part.getInputStream();
        user.tamanho = part.getSize();
        user.foto = arquivo;
/* Código para trazer a requisição do arquivo e colocar na objeto user */

        if (request.getParameter("gravar") != null) {
            user.gravar();
            if (user.statusSQL == null) statusSQL = "Registro Alterado com Sucesso !";}
        
        if (request.getParameter("deletar") != null) {
            user.deletar();
            session.invalidate();
            statusSQL = "Você deletou seu usuário, sua sessão foi fechada!";}

        try (PrintWriter out = response.getWriter()) {
          sHTML = "<!DOCTYPE html>"
                    + "<html><head><title>Cadastro de Usuários</title>"
                    + "</head><body style=\"background-color: greenyellow;\">"
                    + "<br><br><center> " + statusSQL + "<br>"
                    + "<a href ='" + request.getContextPath() + "/" + "javaJSP/cadastro.jsp"
                    + "'> Voltar </a></center></body></html>";
                    out.print(sHTML);

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
