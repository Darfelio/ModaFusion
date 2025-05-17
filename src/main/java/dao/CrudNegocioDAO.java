package dao;

import modelo.Tienda;
import modelo.Articulo;

import modelo.Cliente;
import modelo.Producto;

import java.util.*;

import util.MySQLConexion;
import java.sql.*;//conexion , el acceso a datos

public class CrudNegocioDAO {

	// adicionar cliente
	public void adicion(Cliente p) {
		Connection cn = MySQLConexion.getConexion();
		try {
			String sql = "INSERT INTO cliente (nombre, apellido, direccion) VALUES (?, ?, ?)";
			// Prepara una instrucción SQL que será ejecutada mediante la conexión
			PreparedStatement st = cn.prepareStatement(sql);
			st.setString(1, p.getNombre());
			st.setString(2, p.getApellido());
			st.setString(3, p.getDireccion());
			st.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	// adicionar tienda
	public void adicion4(Tienda p) {
		Connection cn = MySQLConexion.getConexion();
		try {
			String sql = "INSERT INTO tienda (nombre_tienda, direccion) VALUES (?, ?)";
			// Prepara una instrucción SQL que será ejecutada mediante la conexión
			PreparedStatement st = cn.prepareStatement(sql);
			st.setString(1, p.getNombre_tienda());
			st.setString(2, p.getDireccion());
			st.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}



// adicionar producto
	public void adicion6(Producto p) {
		Connection cn = MySQLConexion.getConexion();
		
		try {
			String sql = "INSERT INTO producto (tienda_id, categoria_id, nombre_producto, cantidad_disponible, precio_unitario) VALUES (?, ?, ?, ?, ?)";
			// Prepara una instrucción SQL que será ejecutada mediante la conexión
			PreparedStatement st = cn.prepareStatement(sql);

			st.setInt(1, p.getTienda_id());
			st.setInt(2, p.getCategoria_id());
			st.setString(3, p.getNombre_producto());
			st.setInt(4, p.getCantidad_disponible());
			st.setDouble(5, p.getPrecio_unitario());
			st.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

// Listado Cliente
	public List<Cliente> listadoCliente() {
		List<Cliente> lis = new ArrayList<>();
		Connection cn = MySQLConexion.getConexion();
		try {
			String slq = "SELECT cliente_id, nombre, apellido, direccion FROM Cliente";
			PreparedStatement st = cn.prepareStatement(slq);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				Cliente p = new Cliente();
				p.setCliente_id(rs.getInt(1));
				p.setNombre(rs.getString(2));
				p.setApellido(rs.getString(3));
				p.setDireccion(rs.getString(4));
				lis.add(p);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return lis;
	}

// Listado Tienda
	public List<Tienda> listadoTienda() {
		List<Tienda> lis = new ArrayList<>();
		Connection cn = MySQLConexion.getConexion();
		try {
			String slq = "SELECT tienda_id, nombre_tienda, direccion FROM Tienda";
			PreparedStatement st = cn.prepareStatement(slq);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				Tienda p = new Tienda();
				p.setTienda_id(rs.getInt(1));
				p.setNombre_tienda(rs.getString(2));
				p.setDireccion(rs.getString(3));
				lis.add(p);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return lis;
	}

// Listado Productos
	public List<Producto> listadoProducto() {
		List<Producto> lis = new ArrayList<>();
		Connection cn = MySQLConexion.getConexion();
		try {
			String slq = "SELECT producto_id, tienda_id, categoria_id, nombre_producto, cantidad_disponible, precio_unitario FROM Producto";
			PreparedStatement st = cn.prepareStatement(slq);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {// leer cada fila de la tabla
				Producto p = new Producto();
				p.setProducto_id(rs.getInt(1));
				p.setTienda_id(rs.getInt(2));
				p.setCategoria_id(rs.getInt(3));
				p.setNombre_producto(rs.getString(4));
				p.setCantidad_disponible(rs.getInt(5));
				p.setPrecio_unitario(rs.getDouble(6));
				lis.add(p);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return lis;
	}

	// consultar Id de cliente
	public Cliente consulta(int nro) {
		Cliente p = null;
		Connection cn = MySQLConexion.getConexion();
		try {
			String sql = "SELECT cliente_id, nombre, apellido, direccion FROM cliente WHERE cliente_id = ?";
			PreparedStatement st = cn.prepareStatement(sql);
			st.setInt(1, nro);
			ResultSet rs = st.executeQuery();
			if (rs.next()) {
				p = new Cliente();
				p.setCliente_id(rs.getInt(1));
				p.setNombre(rs.getString(2));
				p.setApellido(rs.getString(3));
				p.setDireccion(rs.getString(4));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return p;
	}

	// modificar cliente
	public void modifica(Cliente p) {
		Connection cn = MySQLConexion.getConexion();
		try {
			String sql = "UPDATE cliente SET nombre=?, apellido=?, direccion=? WHERE cliente_id=?";
			// prepara una instruccion sql que sera ejecutada mediante la conexion
			PreparedStatement st = cn.prepareStatement(sql);
			st.setString(1, p.getNombre());
			st.setString(2, p.getApellido());
			st.setString(3, p.getDireccion());
			st.setInt(4, p.getCliente_id());
			st.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	// Consultar ID de producto
	public Producto consulta2(int nro) {
		Producto p = null;
		Connection cn = MySQLConexion.getConexion();
		try {
			String sql = "SELECT producto_id, tienda_id, categoria_id, nombre_producto, cantidad_disponible, precio_unitario FROM producto WHERE producto_id = ?";
			PreparedStatement st = cn.prepareStatement(sql);
			st.setInt(1, nro);
			ResultSet rs = st.executeQuery();
			if (rs.next()) {
				p = new Producto();
				p.setProducto_id(rs.getInt(1));
				p.setTienda_id(rs.getInt(2));
				p.setCategoria_id(rs.getInt(3));
				p.setNombre_producto(rs.getString(4));
				p.setCantidad_disponible(rs.getInt(5));
				p.setPrecio_unitario(rs.getDouble(6));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return p;
	}

// modificar producto
	public void modifica2(Producto p) {
		Connection cn = MySQLConexion.getConexion();
		try {
			String sql = "UPDATE producto SET tienda_id=?, categoria_id=?, nombre_producto=?, cantidad_disponible=?, precio_unitario=? WHERE producto_id=?";
			PreparedStatement st = cn.prepareStatement(sql);
			st.setInt(1, p.getTienda_id());
			st.setInt(2, p.getCategoria_id());
			st.setString(3, p.getNombre_producto());
			st.setInt(4, p.getCantidad_disponible());
			st.setDouble(5, p.getPrecio_unitario());
			st.setInt(6, p.getProducto_id());
			st.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

//consulta ID tienda
	public Tienda consulta3(int nro) {
		Tienda p = null;
		Connection cn = MySQLConexion.getConexion();
		try {
			String sql = "SELECT tienda_id, nombre_tienda, direccion FROM tienda WHERE tienda_id = ?";
			PreparedStatement st = cn.prepareStatement(sql);
			st.setInt(1, nro);
			ResultSet rs = st.executeQuery();
			if (rs.next()) {
				p = new Tienda();
				p.setTienda_id(rs.getInt(1));
				p.setNombre_tienda(rs.getString(2));
				p.setDireccion(rs.getString(3));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return p;
	}

// modificar producto
	public void modifica3(Tienda p) {
		Connection cn = MySQLConexion.getConexion();
		try {
			String sql = "UPDATE tienda SET nombre_tienda=?, direccion=? WHERE tienda_id=?";
			PreparedStatement st = cn.prepareStatement(sql);
			st.setString(1, p.getNombre_tienda());
			st.setString(2, p.getDireccion());
			st.setInt(3, p.getTienda_id());
			st.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

// cliente
	public void anula(int nro) {
		Connection cn = MySQLConexion.getConexion();
		try {
			String sql = "delete from cliente where cliente_id=?";
			// prepara una instruccion sql que sera ejecutada mediante la conexion
			PreparedStatement st = cn.prepareStatement(sql);
			st.setInt(1, nro);
			st.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	// producto
	public void anula1(int nro) {
		Connection cn = MySQLConexion.getConexion();
		try {
			String sql = "DELETE FROM articulos WHERE IdArticulo=?";
			// Prepara una instrucción SQL que será ejecutada mediante la conexión
			PreparedStatement st = cn.prepareStatement(sql);
			st.setInt(1, nro);
			st.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

// tienda
	public void anula2(int nro) {
		Connection cn = MySQLConexion.getConexion();
		try {
			String sql = "CALL sp_eliminar_tienda(?)";
			// Prepara una instrucción SQL que será ejecutada mediante la conexión
			CallableStatement cs = cn.prepareCall(sql);
			cs.setInt(1, nro);
			cs.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	
	//eliminarProducto
	public void eliminarProducto(int id) {
	    Connection cn = MySQLConexion.getConexion();
	    try {
	        String sql = "DELETE FROM producto WHERE producto_id = ?";
	        PreparedStatement st = cn.prepareStatement(sql);
	        st.setInt(1, id);
	        st.executeUpdate();
	    } catch (Exception ex) {
	        ex.printStackTrace();
	    }
	}


	public static List<Articulo> obtenerListaProductos() {
		List<Articulo> listaProductos = new ArrayList<>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			conn = MySQLConexion.getConexion();
			stmt = conn.createStatement();
			String sql = "SELECT * FROM articulos";
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				Articulo producto = new Articulo();
				producto.setIdArticulo(rs.getString("IdArticulo"));
				producto.setDescripcion(rs.getString("Descripcion"));
				producto.setPrecioUnidad(rs.getDouble("PrecioUnidad"));
				producto.setStock(rs.getInt("Stock"));
				listaProductos.add(producto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return listaProductos;
	}

}
