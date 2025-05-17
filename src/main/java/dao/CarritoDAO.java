package dao;
import dao.interfaces.InterTienda;
import modelo.Articulo;
import modelo.Compra;
import modelo.TarjetaCliente;

import java.util.*;
import java.sql.*;

import util.MySQLConexion;

public class CarritoDAO implements InterTienda{

    @Override
    public List<Articulo> lisArticulo() {
    List<Articulo> lis= new ArrayList<>();
    Connection cn=MySQLConexion.getConexion();
    try{
     String sql="SElect IdArticulo,Descripcion,PrecioUnidad,Stock from articulos";   
     PreparedStatement st=cn.prepareStatement(sql);
     ResultSet rs=st.executeQuery();
     while(rs.next()){
       Articulo p=new Articulo();
       p.setIdArticulo(rs.getString(1));
       p.setDescripcion(rs.getString(2));
       p.setPrecioUnidad(rs.getDouble(3));
       p.setStock(rs.getInt(4));
       lis.add(p);
     }
    }catch(Exception ex){
      ex.printStackTrace();
    }
    return lis;   
    }

 
   @Override
    public Articulo busArticulo(String id) {
    Articulo p=null;
    Connection cn=MySQLConexion.getConexion();
    try{
     String sql="SELECT IdArticulo, Descripcion, PrecioUnidad, Stock FROM articulos WHERE IdArticulo=?";   
     PreparedStatement st=cn.prepareStatement(sql);
     st.setString(1, id);
     ResultSet rs=st.executeQuery();
     if(rs.next()){
        p=new Articulo();
         p.setIdArticulo(rs.getString(1));
         p.setDescripcion(rs.getString(2));
         p.setPrecioUnidad(rs.getDouble(3));
         p.setStock(rs.getInt(4));
      }
    }catch(Exception ex){
      ex.printStackTrace();
    }
    return p;   
    }    
   
    
    
    @Override
    public TarjetaCliente busCli(String usr, String pwd) {
    TarjetaCliente p = null;
    Connection cn = MySQLConexion.getConexion();
    try {
        String sql = "SELECT nombre, credito FROM clientes WHERE tarjeta = ? AND PassWord = ?";
        PreparedStatement st = cn.prepareStatement(sql);
        st.setString(1, usr);
        st.setString(2, pwd);
        ResultSet rs = st.executeQuery();
        if (rs.next()) {
            p = new TarjetaCliente();
            p.setTarjeta(usr);
            p.setNombre(rs.getString(1));
            p.setCredito(rs.getDouble(2));
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
    return p;
}


    @Override
    public String grabaFac(String codc, List<Compra> lista) {
    String factura="";
    Connection cn=MySQLConexion.getConexion();
    String sql="{call spfactura(?,?)}";
    double sm=0;
    for(Compra x:lista) sm=sm+x.Total();
    try{
       CallableStatement st=cn.prepareCall(sql);
       st.setString(1, codc);
       st.setDouble(2, sm);
       ResultSet rs=st.executeQuery();
       rs.next();//leer
       factura=rs.getString(1);
       sql="{call spdetalle(?,?,?)}";
      CallableStatement st2=cn.prepareCall(sql);
      for(Compra  x:lista){
          st2.setString(1, factura);
          st2.setString(2, x.getIdArticulo());
          st2.setInt(3, x.getCantidad());
          st2.executeUpdate();
      }
       
    }catch(Exception ex){
        ex.printStackTrace();
    }
     
    return factura;
    }  
    
    
} 
