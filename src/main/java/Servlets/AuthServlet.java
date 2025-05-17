package Servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.LoginDAO;
import modelo.Persona;
import modelo.Usuario;
import modelo.UsuarioModel;

@WebServlet("/AuthServlet")
public class AuthServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	 private LoginDAO usuarioDAO = new LoginDAO();
	 @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        String action = request.getParameter("action");

	        if ("register".equals(action)) {
	            registrarUsuario(request, response);
	        }
	    }

	    private void registrarUsuario(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        String nombre = request.getParameter("nombre");
	        String apellido = request.getParameter("apellido");
	        String dni = request.getParameter("dni");
	        String password = request.getParameter("password");

	        // Validación simple (ya está en el formulario, pero se puede reforzar aquí)
	        if (nombre == null || apellido == null || dni == null || password == null) {
	            request.setAttribute("error", "Faltan datos del formulario.");
	            request.getRequestDispatcher("/Inicio.jsp").forward(request, response);
	            return;
	        }
	        if (usuarioDAO.dniExiste(dni)) {
	            request.setAttribute("error", "El DNI ingresado ya está registrado.");
	            request.getRequestDispatcher("/Inicio.jsp").forward(request, response);
	            return;
	        }
	        Persona persona = new Persona();
	        persona.setNombre(nombre);
	        persona.setApellido(apellido);
	        persona.setDni(dni);

	        Usuario usuario = new Usuario();
	        usuario.setPassword(password);
	        usuario.setEstado(1);
	        usuario.setIdRol(2);

	        boolean registrado = usuarioDAO.registrarUsuario(persona, usuario);

	        if (registrado) {
	            UsuarioModel user = usuarioDAO.ingresar(dni, password);
	            if (user != null) {
	                request.getSession().setAttribute("usuario", user);
	                request.getSession().setAttribute("nombrecliente", user.getNombre());
	                response.sendRedirect("Inicio.jsp"); 
	                System.out.println("BIENVENIDO USUARIO");
	            } else {
	                request.setAttribute("error", "Error al iniciar sesión después del registro.");
	                request.getRequestDispatcher("/Inicio.jsp").forward(request, response);
	                System.out.println("OCURRIO UN PROBLEMA");

	            }

	        } else {
	            request.setAttribute("error", "No se pudo registrar el usuario. DNI ya existe u otro error.");
	            request.getRequestDispatcher("/Inicio.jsp").forward(request, response);
	        }
	    }
	        
}
