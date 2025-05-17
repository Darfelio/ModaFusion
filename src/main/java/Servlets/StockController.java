package Servlets;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CrudNegocioDAO;
import modelo.Articulo;


public class StockController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener la lista de productos
        List<Articulo> listaProductos = CrudNegocioDAO.obtenerListaProductos();
        
        // Verificar si la lista de productos no está vacía
        if (listaProductos != null) {
            System.out.println("Lista de productos obtenida correctamente. Total productos: " + listaProductos.size());
        } else {
            System.out.println("La lista de productos es nula.");
        }
        
        // Pasar la lista al JSP
        request.setAttribute("listaProductos", listaProductos);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/stock.jsp");
        dispatcher.forward(request, response);
    }
}
