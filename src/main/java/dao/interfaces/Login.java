package dao.interfaces;

import modelo.Persona;
import modelo.Usuario;
import modelo.UsuarioModel;

public interface Login {
  UsuarioModel ingresar(String usuario,String clave);
  boolean registrarUsuario(Persona persona, Usuario usuario);
}
