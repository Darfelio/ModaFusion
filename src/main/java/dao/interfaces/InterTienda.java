
package dao.interfaces;
import modelo.Articulo;
import modelo.Compra;
import modelo.TarjetaCliente;

import java.util.*;
public interface InterTienda {
     
    
    List<Articulo> lisArticulo();
    
    Articulo busArticulo(String id);
    
    TarjetaCliente busCli(String usr,String pwd);
    

    String grabaFac(String codc,List<Compra> lista);
    
}
