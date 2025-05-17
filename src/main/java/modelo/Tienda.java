/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

public class Tienda {
    private int tienda_id;
    private String nombre_tienda;
    private String direccion;

    public Tienda() {
		
		tienda_id = 0;
		nombre_tienda = "";
		direccion = "";
	}

	public Tienda(int tienda_id, String nombre_tienda) {
		super();
		this.tienda_id = tienda_id;
		this.nombre_tienda = nombre_tienda;
	}

	public int getTienda_id() {
        return tienda_id;
    }

    public void setTienda_id(int tienda_id) {
        this.tienda_id = tienda_id;
    }

    public String getNombre_tienda() {
        return nombre_tienda;
    }

    public void setNombre_tienda(String nombre_tienda) {
        this.nombre_tienda = nombre_tienda;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    
}

