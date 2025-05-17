package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.interfaces.ICategoria;

import modelo.Categoria;

import util.MySQLConexion;

public class CategoriaDAO implements ICategoria{

	@Override
	public List<Categoria> listarTodo() {
		List<Categoria> listaCategoria = new ArrayList<>();
		String sql = "SELECT * FROM Categoria";
		Connection cnx = MySQLConexion.getConexion();
		try {
			PreparedStatement ps = cnx.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				

				listaCategoria.add(new Categoria(rs.getInt("categoria_id"), rs.getString("nombre_categoria")));
			}
			ps.close(); rs.close(); cnx.close();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return listaCategoria;
	}

	

}
