<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Producto,dao.CrudNegocioDAO" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Lista de Productos</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- AdminLTE -->
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
        .btn-grafico {
            background-color: #0dcaf0;
            color: #fff;
        }
        .btn-editar {
            background-color: #0d6efd;
            color: white;
        }
        .btn-borrar {
            background-color: #dc3545;
            color: white;
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
        <h2 class="text-primary">🧾 Lista de Productos</h2>
        <div class="d-flex gap-2">
            <a class="btn btn-registro" href="buscar"><i class="bi bi-plus-circle"></i> Registrar Producto</a>
            <a class="btn btn-grafico" href="ProductoGrafico.html"><i class="bi bi-bar-chart"></i> Gráfica</a>
        </div>
    </div>

    <div class="table-responsive">
        <table class="table table-hover table-bordered rounded">
            <thead>
                <tr>
                    <th>Producto ID</th>
                    <th>Tienda ID</th>
                    <th>Categoría ID</th>
                    <th>Nombre Producto</th>
                    <th>Cantidad Disponible</th>
                    <th>Precio Unitario</th>
                    <th>Editar</th>
                    <th>Borrar</th>
                </tr>
            </thead>
            <tbody>
                <% for (Producto x : obj.listadoProducto()) { %>
                    <tr>
                        <td><%= x.getProducto_id() %></td>
                        <td><%= x.getTienda_id() %></td>
                        <td><%= x.getCategoria_id() %></td>
                        <td><%= x.getNombre_producto() %></td>
                        <td><%= x.getCantidad_disponible() %></td>
                        <td><%= x.getPrecio_unitario() %></td>
                        <td>
                            <a class="btn btn-editar btn-sm" href="control?opc=6&cod=<%= x.getProducto_id() %>">
                                ✏️ Editar
                            </a>
                        </td>
                        <td>
                            <a href="javascript:void(0);" class="btn btn-borrar btn-sm" onclick="confirmarEliminacion(<%= x.getProducto_id() %>)">
                                <i class="bi bi-trash"></i> Borrar
                            </a>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</div>

<%@ include file="include/footer.jsp" %>

<!-- Bootstrap Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
    // Función para mostrar SweetAlert2 de confirmación antes de eliminar
    function confirmarEliminacion(productoId) {
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
                // Petición AJAX para eliminar
                $.ajax({
                    url: "control",
                    type: "GET",
                    data: {
                        opc: 13,
                        cod: productoId
                    },
                    success: function() {
                        Swal.fire({
                            title: "¡Eliminado!",
                            text: "El producto fue eliminado.",
                            icon: "success"
                        }).then(() => {
                            location.reload();
                        });
                    },
                    error: function() {
                        Swal.fire({
                            title: "Error",
                            text: "No se pudo eliminar el producto.",
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


