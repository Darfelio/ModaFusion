package Servlets;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CrudNegocioDAO;
import modelo.*;
public class control extends HttpServlet {
	private static final long serialVersionUID = 1L;
   CrudNegocioDAO obj =new CrudNegocioDAO();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int op=Integer.parseInt(request.getParameter("opc"));
        if(op==1)adicion(request, response);
        if(op==2)adicion2(request, response);
        if(op==3)adicion3(request, response);
        
        //cliente
        if(op==4)consulta(request, response);
        if(op==5)cambia(request, response);
        
          //producto
        if(op==6)consulta1(request, response);
        if(op==7)cambia1(request, response);
        
        //tienda
        if(op==8)consulta2(request, response);
        if(op==9)cambia2(request, response);
        
        //borrar - cliente
        if(op==10)anular(request, response);
        
        //borrar - producto
        if(op==11)anular1(request, response);
        
        
        //borrar - tienda
        if(op==12)anular2(request, response);
        
     // eliminar producto con AJAX
        if(op == 13) eliminarProductoAjax(request, response);

     }
//adicionar
  protected void adicion(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    // if(!obj.busNombre(request.getParameter("cliente"))){
    Cliente p = new Cliente();
    p.setNombre(request.getParameter("nombre"));
    p.setApellido(request.getParameter("apellido"));
    p.setDireccion(request.getParameter("direccion"));
    obj.adicion(p);
    response.sendRedirect("Cliente.jsp");
    // }
  }
  
//producto - eliminar definitivo vía AJAX
protected void eliminarProductoAjax(HttpServletRequest request, HttpServletResponse response)
       throws ServletException, IOException {
   int id = Integer.parseInt(request.getParameter("cod"));
   obj.eliminarProducto(id);  // nuevo método DAO
   response.setContentType("text/plain");
   response.getWriter().write("ok");  // respuesta simple para que SweetAlert detecte éxito
}

  protected void adicion2(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    // if(!obj.busNombre(request.getParameter("cliente"))){
    Tienda p = new Tienda();
    p.setNombre_tienda(request.getParameter("nombre"));
    p.setDireccion(request.getParameter("direccion"));
    obj.adicion4(p);
    response.sendRedirect("Tienda.jsp");
   
}
   
  protected void adicion3(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    // Crear producto
	  Producto p = new Producto();
	    
	    p.setTienda_id(Integer.parseInt(request.getParameter("tienda_id")));
	    p.setCategoria_id(Integer.parseInt(request.getParameter("categoria_id")));
	    p.setNombre_producto(request.getParameter("nombre"));
	    p.setCantidad_disponible(Integer.parseInt(request.getParameter("cantidad")));
	    p.setPrecio_unitario(Double.parseDouble(request.getParameter("precio_unitario")));
	    obj.adicion6(p);

	    response.sendRedirect("Productos.jsp");
	}
 
   
   //cliente
       protected void consulta(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
           int nro=Integer.parseInt(request.getParameter("cod"));
           Cliente p=obj.consulta(nro);
           //reenviar el dato encontrado a la pagina pagEditar.jsp
           request.setAttribute("dato", p);
        String pag="/ClienteEditar.jsp";
        request.getRequestDispatcher(pag).forward(request, response);     
    }
       
       protected void cambia(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Cliente p=new Cliente();
     p.setCliente_id(Integer.parseInt(request.getParameter("cliente_id")));
    p.setNombre(request.getParameter("nombre"));
    p.setApellido(request.getParameter("apellido"));
    p.setDireccion(request.getParameter("direccion"));
        obj.modifica(p);
        String pag="/Cliente.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }
       
       
       
           //producto
         protected void consulta1(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
           int nro=Integer.parseInt(request.getParameter("cod"));
           Producto p=obj.consulta2(nro);
           //reenviar el dato encontrado a la pagina pagEditar.jsp
           request.setAttribute("dato", p);
        String pag="/ProductosEditar.jsp";
        request.getRequestDispatcher(pag).forward(request, response);     
    }
       
     protected void cambia1(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    Producto p = new Producto();
    p.setProducto_id(Integer.parseInt(request.getParameter("producto_id")));
    p.setTienda_id(Integer.parseInt(request.getParameter("tienda_id")));
    p.setCategoria_id(Integer.parseInt(request.getParameter("categoria_id")));
    p.setNombre_producto(request.getParameter("nombre_producto"));
    p.setCantidad_disponible(Integer.parseInt(request.getParameter("cantidad_disponible")));
    p.setPrecio_unitario(Double.parseDouble(request.getParameter("precio_unitario")));
    obj.modifica2(p);
    String pag = "/Productos.jsp";
    request.getRequestDispatcher(pag).forward(request, response);
}
     
       
       //tienda
       protected void consulta2(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
           int nro=Integer.parseInt(request.getParameter("cod"));
           Tienda p=obj.consulta3(nro);
           //reenviar el dato encontrado a la pagina pagEditar.jsp
           request.setAttribute("dato", p);
        String pag="/TiendaEditar.jsp";
        request.getRequestDispatcher(pag).forward(request, response);     
    }
       
      protected void cambia2(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    Tienda p = new Tienda();
    p.setTienda_id(Integer.parseInt(request.getParameter("tienda_id")));
    p.setNombre_tienda(request.getParameter("nombre_tienda"));
    p.setDireccion(request.getParameter("direccion"));
    obj.modifica3(p);
    String pag = "/Tienda.jsp";
    request.getRequestDispatcher(pag).forward(request, response);
}
      
      
      // cliente - borrar
      protected void anular(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         int nro=Integer.parseInt(request.getParameter("cod"));
         obj.anula(nro);
           String pag="/Cliente.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
        }
         
      // producto - borrar
        protected void anular1(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         int nro=Integer.parseInt(request.getParameter("cod"));
         obj.anula1(nro);
           String pag="/Productos.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
  
    }
         
     
      //tienda - borrar
         protected void anular2(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         int nro=Integer.parseInt(request.getParameter("cod"));
         obj.anula2(nro);
           String pag="/Tienda.jsp";
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
