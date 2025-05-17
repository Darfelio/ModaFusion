package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dao.interfaces.Login;
import modelo.Persona;
import modelo.Usuario;
import modelo.UsuarioModel;
import util.MySQLConexion;

public class LoginDAO implements Login {

	@Override
	public UsuarioModel ingresar(String dni, String clave) {
		UsuarioModel usuariomodel=null;
	    Connection cn=MySQLConexion.getConexion();
	    try{
	    	String sql = "SELECT u.id_usuario, u.password, u.estado, u.id_persona, u.id_rol, p.nombres " +
	                "FROM usuario u " +
	                "INNER JOIN persona p ON u.id_persona = p.id_persona " +
	                "WHERE p.dni = ? AND u.password = ? AND u.estado = 1";
	     PreparedStatement st=cn.prepareStatement(sql);
	     st.setString(1, dni);
	     st.setString(2, clave);
         ResultSet rs=st.executeQuery();
	     if(rs.next()){
	    	 usuariomodel = new UsuarioModel();
	    	 usuariomodel.setIdUsuario(rs.getInt("id_usuario"));
	    	 usuariomodel.setEstado(rs.getInt("estado"));
	    	 usuariomodel.setIdPersona(rs.getInt("id_persona"));
	    	 usuariomodel.setIdRol(rs.getInt("id_rol"));
	    	 usuariomodel.setNombre(rs.getString("nombres"));   
	      }
	    }catch(Exception ex){
	      ex.printStackTrace();
	    }
	    return usuariomodel;   
	}
	
	public boolean registrarUsuario(Persona persona, Usuario usuario) {
        boolean exito = false;
	    Connection cn=MySQLConexion.getConexion();
	    try{
            String sqlPersona = "INSERT INTO persona (nombres, apellidos, dni) VALUES (?, ?, ?)";
            PreparedStatement psPersona = cn.prepareStatement(sqlPersona, PreparedStatement.RETURN_GENERATED_KEYS);
            psPersona.setString(1, persona.getNombre());
            psPersona.setString(2, persona.getApellido());
            psPersona.setString(3, persona.getDni());
            psPersona.executeUpdate();

            ResultSet rs = psPersona.getGeneratedKeys();
            if (rs.next()) {
                int idPersona = rs.getInt(1);
                String sqlUsuario = "INSERT INTO usuario (password, estado, id_persona, id_rol) VALUES (?, ?, ?, ?)";
                PreparedStatement psUsuario = cn.prepareStatement(sqlUsuario);
                psUsuario.setString(1, usuario.getPassword());
                psUsuario.setInt(2, 1);
                psUsuario.setInt(3, idPersona);
                psUsuario.setInt(4, 2); 
                psUsuario.executeUpdate();
                exito = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return exito;
    }
	
	public boolean dniExiste(String dni) {
	    boolean existe = false;
	    String sql = "SELECT COUNT(*) FROM persona WHERE dni = ?";
	    Connection cn=MySQLConexion.getConexion();

	    try (Connection con = cn;
	         PreparedStatement ps = con.prepareStatement(sql)) {
	        
	        ps.setString(1, dni);
	        ResultSet rs = ps.executeQuery();
	        
	        if (rs.next()) {
	            existe = rs.getInt(1) > 0;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace(); 
	    }
	    
	    return existe;
	}
	
	public Usuario obtenerPorDniYPassword(String dni, String password) {
	    Usuario user = null;
	    String sql = "SELECT * FROM usuario WHERE dni = ? AND password = ?";

	    try (Connection con = MySQLConexion.getConexion();
	         PreparedStatement ps = con.prepareStatement(sql)) {

	        ps.setString(1, dni);
	        ps.setString(2, password);
	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            user = new Usuario();
	            user.setIdUsuario(rs.getInt("idUsuario"));
	            user.setPassword(rs.getString("password"));
	            user.setEstado(rs.getInt("estado"));
	            user.setIdRol(rs.getInt("idRol"));
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return user;
	}
}
