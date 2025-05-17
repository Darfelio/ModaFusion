<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Tienda" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Modificar Tienda</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="css/adminlte.min.css" rel="stylesheet" type="text/css"/>
<!-- Bootstrap Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- SweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
body {
font-family: 'Arial', sans-serif;
background-color: #f8f9fa;
padding: 20px;
}
h2 {
font-size: 2rem;
color: #495057;
margin-bottom: 30px;
text-align: center;
}
.form-group label {
font-weight: bold;
}
.form-control {
border-radius: 0.375rem;
box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}
.form-control:focus {
border-color: #6c757d;
box-shadow: 0 0 0 0.25rem rgba(138, 182, 248, 0.5);
}
.btn {
background-color: #007bff;
color: white;
border-radius: 0.375rem;
padding: 10px 20px;
width: 100%;
}
.btn:hover {
background-color: #0056b3;
color: white;
}
.container {
max-width: 600px;
margin: 0 auto;
}
.btn-info {
background-color: #17a2b8;
margin-bottom: 20px;
}
.btn-info:hover {
background-color: #138496;
}
@media (max-width: 576px) {
.form-group label {
font-size: 14px;
}
h2 {
font-size: 1.5rem;
}
}
</style>
</head>
<body>
<%@ include file="include/header.jsp" %>
<%
Tienda pe=(Tienda)request.getAttribute("dato");
%>
<div class="container">
<div class="d-flex justify-content-between align-items-center mb-4">
    <h2>Modificar datos de la tienda</h2>
    <button type="button" class="btn btn-info" style="width: auto;" data-bs-toggle="modal" data-bs-target="#infoModal">
        <i class="bi bi-info-circle"></i> Guía
    </button>
</div>

<form id="formModificar" action="control" method="POST">
<input type="hidden" name="opc" value="9">
<div class="form-group mb-4">
<label for="tienda_id">Tienda ID</label>
<input type="text" class="form-control" id="tienda_id" name="tienda_id" value="<%=pe.getTienda_id()%>" readonly>
</div>
<div class="form-group mb-4">
<label for="nombre_tienda">Nombre de la Tienda</label>
<input type="text" class="form-control" id="nombre_tienda" name="nombre_tienda" value="<%=pe.getNombre_tienda()%>">
</div>
<div class="form-group mb-4">
<label for="direccion">Dirección</label>
<input type="text" class="form-control" id="direccion" name="direccion" value="<%=pe.getDireccion()%>">
</div>
<button type="button" id="actualizarBtn" class="btn">Actualizar Tienda</button>
</form>
</div>

<!-- Modal para la Guía de Modificación -->
<div class="modal fade" id="infoModal" tabindex="-1" aria-labelledby="infoModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title" id="infoModalLabel">Guía para Modificación de Tiendas</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-6">
                        <h6 class="fw-bold"><i class="bi bi-check-circle-fill text-success"></i> Reglas de modificación:</h6>
                        <ul>
                            <li>El ID de la tienda no puede ser modificado</li>
                            <li>El nombre de la tienda debe ser único en el sistema</li>
                            <li>La dirección debe ser completa y precisa</li>
                            <li>Todos los campos son obligatorios</li>
                        </ul>
                    </div>
                    <div class="col-md-6">
                        <h6 class="fw-bold"><i class="bi bi-exclamation-triangle-fill text-warning"></i> Importante:</h6>
                        <ul>
                            <li>La actualización afectará a todos los registros asociados</li>
                            <li>Verifique la información antes de guardar</li>
                            <li>El cambio es permanente y quedará registrado en el sistema</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>

<script>
    // Script para manejar la actualización con confirmación
    document.getElementById('actualizarBtn').addEventListener('click', function() {
        // Validar el formulario
        let nombre = document.getElementById('nombre_tienda').value;
        let direccion = document.getElementById('direccion').value;
        
        if (nombre && direccion) {
            // Mostrar SweetAlert para confirmar la actualización
            Swal.fire({
                title: "¿Estás seguro?",
                text: "¿Deseas actualizar la información de esta tienda?",
                icon: "question",
                showCancelButton: true,
                confirmButtonColor: "#007bff",
                cancelButtonColor: "#dc3545",
                confirmButtonText: "Sí, actualizar",
                cancelButtonText: "Cancelar"
            }).then((result) => {
                if (result.isConfirmed) {
                    // Enviar el formulario
                    document.getElementById('formModificar').submit();
                    
                    // Mostrar mensaje de éxito
                    Swal.fire({
                        title: "¡Actualizado!",
                        text: "La información de la tienda ha sido actualizada correctamente.",
                        icon: "success"
                    });
                }
            });
        } else {
            // Si falta algún campo, mostrar error
            Swal.fire({
                title: "Error",
                text: "Por favor complete todos los campos requeridos.",
                icon: "error"
            });
        }
    });
</script>
</body>
</html>