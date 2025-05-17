package Servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoriaDAO;
import dao.TiendaDAO;
import modelo.Categoria;
import modelo.Tienda;




@WebServlet({ "/ProductoRegistroController", "/buscar" })
public class ProductoRegistroController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	private void prepararComboBox(HttpServletRequest request) {
		TiendaDAO tiendaDAO = new TiendaDAO();
		List<Tienda> listaDeTiendas = tiendaDAO.listarTodo();

		request.setAttribute("atrListaDeTiendas", listaDeTiendas);


	}

	private void prepararComboBoxCate(HttpServletRequest request) {
		CategoriaDAO categoriaDAO = new CategoriaDAO();
		List<Categoria> listaDeCategoria = categoriaDAO.listarTodo();

		request.setAttribute("atrListaDeCategorias", listaDeCategoria);


	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		prepararComboBox(request);
		prepararComboBoxCate(request);
		request.getRequestDispatcher("ProductosRegistro.jsp").forward(request, response);
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("ProductosRegistro.jsp").forward(request, response);
	}

}
