
package modelo;

import java.util.Date;

public class FacturaCabecera {
  private String nroFactura;
  private Date fechaFactura;
  private String tarjeta;
  private double montoTotal;
  

  
  // Getters y Setters
  public String getNroFactura() {
    return nroFactura;
  }
  
  public void setNroFactura(String nroFactura) {
    this.nroFactura = nroFactura;
  }
  
  public Date getFechaFactura() {
    return fechaFactura;
  }
  
  public void setFechaFactura(Date fechaFactura) {
    this.fechaFactura = fechaFactura;
  }
  
  public String getTarjeta() {
    return tarjeta;
  }
  
  public void setTarjeta(String tarjeta) {
    this.tarjeta = tarjeta;
  }
  
  public double getMontoTotal() {
    return montoTotal;
  }
  
  public void setMontoTotal(double montoTotal) {
    this.montoTotal = montoTotal;
  }
  
}

