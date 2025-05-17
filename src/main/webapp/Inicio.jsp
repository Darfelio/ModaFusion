<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Moda Fusion</title>

<!-- Bootstrap 5 CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="css/adminlte.min.css" rel="stylesheet" type="text/css" />

<style>
body {
	font-family: 'Segoe UI', sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f8f9fa;
}

header {
	background-color: #212529;
}

.navbar-brand {
	font-size: 2rem;
	color: #ff6f61 !important;
	font-weight: bold;
	text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.3);
}

.nav-link {
	color: #ffffff !important;
	margin-right: 15px;
	transition: all 0.3s ease;
}

.nav-link:hover {
	color: #ff6f61 !important;
	text-decoration: underline;
}

.hero {
	background: linear-gradient(to bottom, rgba(0, 0, 0, 0.5),
		rgba(0, 0, 0, 0.5)), url('foto/portada.jpg') no-repeat center center/cover;
	height: 600px;
	display: flex;
	align-items: center;
	justify-content: center;
	text-align: center;
	color: #fff;
}

.hero-content h2 {
	font-size: 48px;
	font-weight: bold;
	text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
}

.hero-content p {
	font-size: 20px;
	margin-top: 10px;
	color: #f0f0f0;
}

.btn-hero {
	margin-top: 25px;
	padding: 10px 25px;
	font-size: 16px;
	background-color: #ff6f61;
	border: none;
	color: white;
	border-radius: 25px;
	transition: transform 0.2s ease, background-color 0.3s;
}

.btn-hero:hover {
	transform: scale(1.05);
	background-color: #e65b50;
}

footer {
	background-color: #212529;
	color: #ffffff;
	padding: 15px;
	text-align: center;
}

.modal-header {
	background-color: #212529;
	color: #fff;
}

.modal-footer {
	justify-content: center;
}
</style>
</head>
<body>

	<!-- Navbar -->
<%@ include file="include/header.jsp" %>

<% String error = (String) request.getAttribute("error"); %>
<% if (error != null) { %>
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <%= error %>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
<% } %>
	<!-- Hero -->
	<section class="hero">
		<div class="hero-content">
			<h2>¡Descubre tu estilo con Moda Fusion!</h2>
			<p>Ofertas únicas, diseño moderno y la mejor calidad para ti.</p>
			<a href="Productos.jsp" class="btn btn-hero">Ver Productos</a>
		</div>
	</section>

	<!-- Footer -->
	<footer>
		<p>© 2024 Moda Fusion. Todos los derechos reservados.</p>
	</footer>

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

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
