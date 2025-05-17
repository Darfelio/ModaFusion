package modelo;

public class Articulo {
  private String idArticulo;
  private String descripcion;
  private double precioUnidad;
  private int stock;
  
  public String getIdArticulo() {
    return idArticulo;
  }
  
  public void setIdArticulo(String idArticulo) {
    this.idArticulo = idArticulo;
  }
  
  public String getDescripcion() {
    return descripcion;
  }
  
  public void setDescripcion(String descripcion) {
    this.descripcion = descripcion;
  }
  
  public double getPrecioUnidad() {
    return precioUnidad;
  }
  
  public void setPrecioUnidad(double precioUnidad) {
    this.precioUnidad = precioUnidad;
  }
  
  public int getStock() {
    return stock;
  }
  
  public void setStock(int stock) {
    this.stock = stock;
  }
  
}

