
package modelo;

public class FacturaDetalle {
  private String nroFactura;
  private String idArticulo;
  private int cantidad;
  
  // Getters y Setters
  public String getNroFactura() {
    return nroFactura;
  }
  
  public void setNroFactura(String nroFactura) {
    this.nroFactura = nroFactura;
  }
  
  public String getIdArticulo() {
    return idArticulo;
  }
  
  public void setIdArticulo(String idArticulo) {
    this.idArticulo = idArticulo;
  }
  
  public int getCantidad() {
    return cantidad;
  }
  
  public void setCantidad(int cantidad) {
    this.cantidad = cantidad;
  }
  

}

