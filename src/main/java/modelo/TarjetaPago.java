package modelo;


public class TarjetaPago {
    private String tipoTarjeta;
    private double valorCompra;
    private double interes;
    private double totalPagar;
    private String resultado;

    public String calcularInteres() {
        if (tipoTarjeta.equals("MasterCard")) {
            interes = valorCompra * 0.02;
        } else if (tipoTarjeta.equals("Visa")) {
            interes = valorCompra * 0.03;
        } else if (tipoTarjeta.equals("American Express")) {
            interes = valorCompra * 0.04;
        } else {
            interes = 0;
        }
        totalPagar = valorCompra + interes;
        return "credito";
    }


    public TarjetaPago() {
    }

    // Getters and setters
    public String getTipoTarjeta() {
        return tipoTarjeta;
    }

    public void setTipoTarjeta(String tipoTarjeta) {
        this.tipoTarjeta = tipoTarjeta;
    }

    public double getValorCompra() {
        return valorCompra;
    }

    public void setValorCompra(double valorCompra) {
        this.valorCompra = valorCompra;
    }

    public double getInteres() {
        return interes;
    }

    public void setInteres(double interes) {
        this.interes = interes;
    }

    public double getTotalPagar() {
        return totalPagar;
    }

    public void setTotalPagar(double totalPagar) {
        this.totalPagar = totalPagar;
    }
    
    public String getResultado() {
        return resultado; // Acceder al resultado
    }

    public void setResultado(String resultado) {
        this.resultado = resultado;
    }
}

