package Servlets;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import modelo.TarjetaPago;

import java.io.IOException;

@WebServlet("/Control3Servlet")
public class InteresesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener los parámetros del formulario
        String tipoTarjeta = request.getParameter("tipoTarjeta");
        double valorCompra = Double.parseDouble(request.getParameter("valorCompra"));
        
        // Crear una instancia de la clase control3
        TarjetaPago calculo = new TarjetaPago();
        calculo.setTipoTarjeta(tipoTarjeta);
        calculo.setValorCompra(valorCompra);
        
        // Realizar el cálculo del interés y el total a pagar
        calculo.calcularInteres();
        
        // Pasar los resultados a la JSP
        request.setAttribute("interes", calculo.getInteres());
        request.setAttribute("totalPagar", calculo.getTotalPagar());
        
        // Redirigir a la JSP que mostrará los resultados
        request.getRequestDispatcher("intereses.jsp").forward(request, response);
    }
}

