package Servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.LoginDAO;
import modelo.UsuarioModel;

public class LoginControl extends HttpServlet {

    private static final long serialVersionUID = 1L;
    LoginDAO loginDAO = new LoginDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int op = Integer.parseInt(request.getParameter("opc"));

        // Si es una solicitud de inicio de sesión
        if (op == 1) {
            login(request, response);
        }
        // Si es una solicitud de cierre de sesión
        else if (op == 2) {
            logout(request, response);
        }
        // Agregar más operaciones si es necesario
    }

    protected void login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String dni = request.getParameter("dni");
        String password = request.getParameter("password");
        System.out.println("DNI recibido: " + dni);
        System.out.println("Password recibido: " + password);
        UsuarioModel usuario = loginDAO.ingresar(dni, password);

        if (usuario != null) {
            // Obtener la sesión
            HttpSession session = request.getSession();
            
            // Guardar los datos del usuario en la sesión
            session.setAttribute("usuario", usuario);
            session.setAttribute("nombrecliente", usuario.getNombre());
            
            // IMPORTANTE: Guardar el rol del usuario en la sesión
            session.setAttribute("idRol", usuario.getIdRol());
            session.setAttribute("usuarioVal", usuario);
            
            String pag = "/Inicio.jsp";
            request.getRequestDispatcher(pag).forward(request, response);
        } else {
            request.setAttribute("error", "Credenciales inválidas o usuario inactivo.");
            String pag = "/Inicio.jsp";
            request.getRequestDispatcher(pag).forward(request, response);
        }
    }
    
    // Método para cerrar sesión
    protected void logout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Invalidar la sesión actual
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        
        // Redirigir a la página de inicio
        response.sendRedirect("Inicio.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet de login para manejar la autenticación de usuarios.";
    }
}