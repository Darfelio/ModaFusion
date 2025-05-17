package Servlets;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.CarritoDAO;
import modelo.Articulo;
import modelo.Compra;
import modelo.TarjetaCliente;

import java.util.*;
import javax.servlet.http.HttpSession;
public class tiendaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    CarritoDAO obj=new CarritoDAO();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
     int op=Integer.parseInt(request.getParameter("opc"));
   
     if(op==2)DetalleArt(request, response);
     if(op==3)carrito(request, response);
     if(op==4)borraItem(request, response);
     if(op==5)login(request, response);
     if(op==6)grabar(request, response);
   
    }
    
 protected void DetalleArt(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String cod=request.getParameter("id");
      request.setAttribute("dato", obj.busArticulo(cod));
      String pag="/pagDetalle.jsp";
      request.getRequestDispatcher(pag).forward(request, response);
     }
 
 protected void carrito(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String cod=request.getParameter("coda");
       boolean existe=false;
       int can=Integer.parseInt(request.getParameter("cantidad"));
       Articulo a=obj.busArticulo(cod);
       
       Compra c=new Compra();
       
       c.setCantidad(can);  
       c.setIdArticulo(a.getIdArticulo());
       c.setDescripcion(a.getDescripcion());
       c.setPrecioUnidad(a.getPrecioUnidad());
       
       List<Compra> lista;
       HttpSession ses = request.getSession();
       if (ses.getAttribute("canasta") == null) {
           lista = new ArrayList<Compra>();
       } else {
           @SuppressWarnings("unchecked")
           List<Compra> temp = (List<Compra>) ses.getAttribute("canasta");
           lista = temp;
       }
       //agregar la compra a la canasta
       for (Compra x : lista) {
           if (x.getIdArticulo().equals(cod)) {
               existe = true;
               break;
           }
       }

        if(!existe)
        lista.add(c);
        
       ses.setAttribute("canasta", lista);
      String pag="/pagCompra.jsp";
      request.getRequestDispatcher(pag).forward(request, response);
     } 
 
 
 
 //borra item
 protected void borraItem(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    int ind = Integer.parseInt(request.getParameter("ind"));
	    HttpSession ses = request.getSession();

	    @SuppressWarnings("unchecked")
	    List<Compra> lista = (List<Compra>) ses.getAttribute("canasta");

	    lista.remove(ind);
	    ses.setAttribute("canasta", lista);
	    String pag = "/pagCompra.jsp";
	    request.getRequestDispatcher(pag).forward(request, response);
	}

 
 
 protected void login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String usr=request.getParameter("user").trim();
        String pas=request.getParameter("pas").trim();
        TarjetaCliente cli=obj.busCli(usr, pas);
        HttpSession ses=request.getSession();
        String pag="";
        if(cli==null){
        request.setAttribute("dato", "tarjeta o clave no existe");
         pag="/pagLogin.jsp";
        }else{
            ses.setAttribute("cli", cli);
            pag="/pagConfirma.jsp";
        }
      request.getRequestDispatcher(pag).forward(request, response);
     } 
 
 
 protected void grabar(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    HttpSession ses = request.getSession();

	    @SuppressWarnings("unchecked")
	    List<Compra> lista = (List<Compra>) ses.getAttribute("canasta");

	    TarjetaCliente cli = (TarjetaCliente) ses.getAttribute("cli");

	    String fac = obj.grabaFac(cli.getTarjeta(), lista);

	    double sm = 0;
	    for (Compra x : lista) sm += x.Total();

	    request.setAttribute("nombre", cli.getNombre());
	    request.setAttribute("factura", fac);
	    request.setAttribute("total", sm);
	    ses.setAttribute("canasta", null);
	    ses.setAttribute("cli", null);
	    String pag = "/pagResumen.jsp";

	    request.getRequestDispatcher(pag).forward(request, response);
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
        return "Short description";
    }

}
