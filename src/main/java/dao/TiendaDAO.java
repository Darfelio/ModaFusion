package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import dao.interfaces.ITienda;
import modelo.Tienda;
import util.MySQLConexion;

public class TiendaDAO implements ITienda{

	@Override
	public List<Tienda> listarTodo() {
		List<Tienda> listaTienda = new ArrayList<>();
		String sql = "SELECT * FROM Tienda";
		Connection cnx = MySQLConexion.getConexion();
		try {
			PreparedStatement ps = cnx.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				

				listaTienda.add(new Tienda(rs.getInt("tienda_id"), rs.getString("nombre_tienda")));
			}
			ps.close(); rs.close(); cnx.close();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return listaTienda;
	}


}
