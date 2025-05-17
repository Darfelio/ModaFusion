package util;

public class RoleUtil {
    // Constantes de roles
    public static final int ROL_ADMIN = 1;
    public static final int ROL_CLIENTE = 2;
    public static final int ROL_VENDEDOR = 3;
    
    // Métodos de verificación de acceso
    public static boolean puedeAccederModulosAdmin(int idRol) {
        return idRol == ROL_ADMIN;
    }
    
    public static boolean puedeAccederModulosCliente(int idRol) {
        // Todos los usuarios pueden acceder a los módulos de cliente
        return true;
    }
    
    public static boolean puedeAccederModulosVendedor(int idRol) {
        return idRol == ROL_ADMIN || idRol == ROL_VENDEDOR;
    }
    
    // Control de acceso a módulos específicos
    public static boolean puedeAccederAdminTienda(int idRol) {
        return idRol == ROL_ADMIN;
    }
    
    public static boolean puedeAccederAdminCliente(int idRol) {
        return idRol == ROL_ADMIN;
    }
    
    public static boolean puedeAccederAdminProductos(int idRol) {
        return idRol == ROL_ADMIN || idRol == ROL_VENDEDOR;
    }
    
    public static boolean puedeAccederStock(int idRol) {
        return idRol == ROL_ADMIN || idRol == ROL_VENDEDOR;
    }
}