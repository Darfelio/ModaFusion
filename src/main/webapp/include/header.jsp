<%@ page import="util.RoleUtil" %>

<!DOCTYPE html>
<html>
<head>
  <title>Topitop</title>
  
  <style>
body {
  font-family: Arial, sans-serif;
  margin: 0;
  padding: 0;
}

header {
  background-color: #333;
  color: #fff;
  padding: 10px;
}

h1 {
  margin: 0;
}

nav ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

nav ul li {
  display: inline;
  margin-right: 10px;
}

nav ul li a {
  color: #fff;
  text-decoration: none;
}

.search-bar {
  display: inline-block;
  margin-right: 10px;
}

.search-bar input[type="text"] {
  padding: 5px;
}

.search-bar button[type="submit"] {
  background-color: #333;
  color: #fff;
  border: none;
  padding: 5px 10px;
  cursor: pointer;
}

.user-buttons a {
  display: inline-block;
  background-color: #333;
  color: #fff;
  padding: 5px 10px;
  text-decoration: none;
  margin-left: 10px;
}

section.hero {
  background-image: url('foto/portada.jpg');
  background-size: cover;
  height: 600px;
  display: flex;
  align-items: center;
}

.hero-content {
  text-align: center;
  color: black;
}

.hero-content h2 {
  font-size: 36px;
  margin: 0;
}

.hero-content p {
  font-size: 18px;
}


footer {
  background-color: #333;
  color: #fff;
  padding: 10px;
text-align: center;
}

  </style>
  
</head>
<body>
 
 
 <header>
    <%
    String nombrecliente = (String) session.getAttribute("nombrecliente");
    Integer idRol = (Integer) session.getAttribute("idRol");
    
    // Si no hay rol definido, consideramos al usuario como no autenticado
    if (idRol == null) {
        idRol = 0;
    }
    %>
    <nav class="navbar navbar-expand-lg navbar-dark px-4">
        <a class="navbar-brand" href="#">Moda Fusion</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                <!-- Inicio - Accesible para todos (Admin, Cliente, Vendedor) -->
                <li class="nav-item"><a class="nav-link" href="Inicio.jsp">Inicio</a></li>
                
                <!-- Productos - Accesible para ADMIN y VENDEDOR -->
                <% if (idRol > 0 && (idRol == RoleUtil.ROL_ADMIN || idRol == RoleUtil.ROL_VENDEDOR)) { %>
                    <li class="nav-item"><a class="nav-link" href="Productos.jsp">Productos</a></li>
                <% } %>
                
                <!-- Tienda - Accesible solo para ADMIN -->
                <% if (idRol > 0 && idRol == RoleUtil.ROL_ADMIN) { %>
                    <li class="nav-item"><a class="nav-link" href="Tienda.jsp">Tienda</a></li>
                <% } %>
                
                <!-- Cliente - Accesible solo para ADMIN -->
                <% if (idRol > 0 && idRol == RoleUtil.ROL_ADMIN) { %>
                    <li class="nav-item"><a class="nav-link" href="Cliente.jsp">Cliente</a></li>
                <% } %>
                
                <!-- Nosotros - Accesible para todos (Admin, Cliente, Vendedor) -->
                <li class="nav-item"><a class="nav-link" href="Nosotros.jsp">Nosotros</a></li>
                
                <!-- Stock - Accesible para ADMIN y VENDEDOR -->
                <% if (idRol > 0 && (idRol == RoleUtil.ROL_ADMIN || idRol == RoleUtil.ROL_VENDEDOR)) { %>
                    <li class="nav-item"><a class="nav-link" href="stock">Stock</a></li>
                <% } %>
                
                <!-- Crédito - Accesible para ADMIN y CLIENTE -->
                <% if (idRol > 0 && (idRol == RoleUtil.ROL_ADMIN || idRol == RoleUtil.ROL_CLIENTE)) { %>
                    <li class="nav-item"><a class="nav-link" href="intereses.jsp">Credito</a></li>
                <% } %>
                
                <!-- Zona Outlet - Accesible para ADMIN y CLIENTE -->
                <% if (idRol > 0 && (idRol == RoleUtil.ROL_ADMIN || idRol == RoleUtil.ROL_CLIENTE)) { %>
                    <li class="nav-item"><a class="nav-link" href="pagArticulo.jsp">Zona Outlet</a></li>
                <% } %>
                
                <!-- Control de sesión -->
                <% if (nombrecliente != null) { %>
                    <li class="nav-item"><a class="nav-link" href="#">Bienvenido, <%= nombrecliente %></a></li>
                    <li class="nav-item">
                        <a class="nav-link text-danger fw-semibold" href="LoginControl?opc=2">Cerrar sesión</a>
                    </li>
                <% } else { %>
                    <li class="nav-item">
                        <button class="btn btn-outline-light" data-bs-toggle="modal" data-bs-target="#loginModal">
                            Iniciar Sesión
                        </button>
                    </li>
                <% } %>
            </ul>
        </div>
    </nav>
</header>
<!-- Modal Login -->
	<div class="modal fade" id="loginModal" tabindex="-1"
		aria-labelledby="loginModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="loginModalLabel">Iniciar Sesión</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Cerrar"></button>
				</div>
				<div class="modal-body">
					<form action="LoginControl" method="post">
						<input type="hidden" name="opc" value="1">
						<div class="mb-3">
							<label for="dni" class="form-label">DNI</label> <input
								type="text" class="form-control" id="dni" name="dni" required>
						</div>
						<div class="mb-3">
							<label for="password" class="form-label">Contraseña</label> <input
								type="password" class="form-control" id="password"
								name="password" required>
						</div>
						<button type="submit" class="btn btn-primary w-100">Ingresar</button>
					</form>
					<div class="mt-3 text-center">
					<span>¿No tienes cuenta? 
					  <a href="registro.jsp" class="text-info text-decoration-underline" data-bs-toggle="modal" data-bs-target="#registroModal" data-bs-dismiss="modal">
					    Registrarse
					  </a>
					</span>
					</div>
				</div>
			</div>
		</div>
	</div>
<div class="modal fade" id="registroModal" tabindex="-1" aria-labelledby="registroModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-dark text-white">
                <h5 class="modal-title" id="registroModalLabel">Crear Cuenta</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
            </div>
            <div class="modal-body">
                <form action="AuthServlet" method="post">
                    <input type="hidden" name="action" value="register">

                    <div class="mb-3">
                        <label for="nombre" class="form-label">Nombre</label>
                        <input type="text" class="form-control" name="nombre" id="nombre" required>
                    </div>

                    <div class="mb-3">
                        <label for="apellido" class="form-label">Apellido</label>
                        <input type="text" class="form-control" name="apellido" id="apellido" required>
                    </div>

                    <div class="mb-3">
                        <label for="dni" class="form-label">DNI</label>
                        <input type="text" class="form-control" name="dni" id="dni" required pattern="\d{8}" title="Debe tener 8 dígitos">
                    </div>

                    <div class="mb-3">
                        <label for="password" class="form-label">Contraseña</label>
                        <input type="password" class="form-control" name="password" id="password" required minlength="6">
                    </div>

                    <button type="submit" class="btn btn-success w-100">Registrarse</button>
                </form>
            </div>
            <div class="modal-footer text-center w-100">
                ¿Ya tienes cuenta? <a href="#" data-bs-toggle="modal" data-bs-target="#loginModal" data-bs-dismiss="modal">Inicia sesión</a>
            </div>
        </div>
    </div>
</div>

