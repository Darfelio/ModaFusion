<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Cliente,dao.CrudNegocioDAO" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Lista de Clientes</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- AdminLTE (si lo necesitas para más estilos) -->
    <link href="css/adminlte.min.css" rel="stylesheet" type="text/css"/>
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- SweetAlert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>
        body {
            background: linear-gradient(to right, #f8f9fa, #e9ecef);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
         .navbar-brand {
	      font-size: 2rem;
	      color: #ff6f61 !important;
	      font-weight: bold;
	      text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.3);
	    }
        .main-container {
            max-width: 1000px;
            margin: 60px auto;
            background: #fff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
            animation: fadeIn 0.6s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .table th {
            background-color: #343a40;
            color: #fff;
        }
        .btn-registro {
            background-color: #198754;
            color: #fff;
            border: none;
            transition: background-color 0.3s;
        }
        .btn-registro:hover {
            background-color: #157347;
        }
        .btn-editar {
            background-color: #0d6efd;
            color: white;
        }
        .btn-borrar {
            background-color: #dc3545;
            color: white;
        }
        .btn-volver {
            background-color: #6c757d;
            color: white;
        }
        .btn-volver:hover {
            background-color: #5a6268;
        }
        .table td, .table th {
            vertical-align: middle;
        }
    </style>
</head>
<body>

<%@ include file="include/header.jsp" %>

<%
CrudNegocioDAO obj = new CrudNegocioDAO();
%>

<div class="main-container">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="text-primary">🧑‍💼 Lista de Clientes</h2>
        <div>
            <a href="ClienteRegistro.html" class="btn btn-registro me-2">+ Registrar Cliente</a>
            <a href="ClienteGrafico.html" class="btn btn-warning">📊 Ver Gráfica</a>
        </div>
    </div>

    <table class="table table-hover table-bordered rounded">
        <thead>
            <tr>
                <th>Nro Cliente</th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Dirección</th>
                <th>Editar</th>
                <th>Borrar</th>
            </tr>
        </thead>
        <tbody>
            <% for (Cliente x : obj.listadoCliente()) { %>
            <tr>
                <td><%= x.getCliente_id() %></td>
                <td><%= x.getNombre() %></td>
                <td><%= x.getApellido() %></td>
                <td><%= x.getDireccion() %></td>
                <td>
                    <a href="control?opc=4&cod=<%= x.getCliente_id() %>" class="btn btn-editar btn-sm">
                        ✏️ Editar
                    </a>
                </td>
                <td>
                    <a href="javascript:void(0);" onclick="confirmarEliminacion(<%= x.getCliente_id() %>)" class="btn btn-borrar btn-sm">
                        <i class="bi bi-trash"></i> Borrar
                    </a>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>

</div>

<%@ include file="include/footer.jsp" %>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
function confirmarEliminacion(clienteId) {
    Swal.fire({
        title: "¿Estás seguro?",
        text: "¡No podrás revertir esta acción!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "¡Sí, eliminarlo!",
        cancelButtonText: "Cancelar"
    }).then((result) => {
        if (result.isConfirmed) {
            // Hacer la petición para eliminar
            $.ajax({
                url: "control",
                type: "GET",
                data: {
                    opc: 10,
                    cod: clienteId
                },
                success: function() {
                    Swal.fire({
                        title: "¡Eliminado!",
                        text: "El cliente fue eliminado.",
                        icon: "success"
                    }).then(() => {
                        location.reload();
                    });
                },
                error: function() {
                    Swal.fire({
                        title: "Error",
                        text: "No se pudo eliminar el cliente.",
                        icon: "error"
                    });
                }
            });
        }
    });
}
</script>

</body>
</html>
