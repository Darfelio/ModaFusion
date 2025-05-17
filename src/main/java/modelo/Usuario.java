package modelo;

public class Usuario {
	 private int idUsuario;
	 private String password;
	 private int estado;
	 private int idPersona;
	 private int idRol;

	 public Usuario() {
	    }

	    public Usuario(int idUsuario, String password, int estado, int idPersona, int idRol) {
	        this.idUsuario = idUsuario;
	        this.password = password;
	        this.estado = estado;
	        this.idPersona = idPersona;
	        this.idRol = idRol;
	    }

	    // Getters y Setters
	    public int getIdUsuario() {
	        return idUsuario;
	    }

	    public void setIdUsuario(int idUsuario) {
	        this.idUsuario = idUsuario;
	    }

	    public String getPassword() {
	        return password;
	    }

	    public void setPassword(String password) {
	        this.password = password;
	    }

	

	    public int getEstado() {
			return estado;
		}

		public void setEstado(int estado) {
			this.estado = estado;
		}

		public int getIdPersona() {
	        return idPersona;
	    }

	    public void setIdPersona(int idPersona) {
	        this.idPersona = idPersona;
	    }

	    public int getIdRol() {
	        return idRol;
	    }

	    public void setIdRol(int idRol) {
	        this.idRol = idRol;
	    }

	    @Override
	    public String toString() {
	        return "Usuario{" +
	                "idUsuario=" + idUsuario +
	                ", password='" + password + '\'' +
	                ", estado=" + estado +
	                ", idPersona=" + idPersona +
	                ", idRol=" + idRol +
	                '}';
	    }
}
