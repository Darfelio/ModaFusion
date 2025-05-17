package modelo;

public class Compra extends Articulo{
    
    private int cantidad;
    
    public double Total(){
        return cantidad*super.getPrecioUnidad();
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
    
}
