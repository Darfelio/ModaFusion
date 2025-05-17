<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registro - Moda Fusion</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow">
                    <div class="card-header bg-dark text-white text-center">
                        <h4>Crear Cuenta</h4>
                    </div>
                    <div class="card-body">
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
                    <div class="card-footer text-center">
                        ¿Ya tienes cuenta? <a href="Inicio.jsp">Inicia sesión</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>