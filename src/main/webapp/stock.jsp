<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Articulo"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Stock de Productos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
     .navbar-brand {
      font-size: 2rem;
      color: #ff6f61 !important;
      font-weight: bold;
      text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.3);
    }
    </style>
</head>
<body>
    
<%@ include file="include/header.jsp" %>

<div class="container mt-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Stock de Productos</h2>
        <div>
            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#estadisticaModal">
                <i class="bi bi-bar-chart"></i> Gráfica Estadística
            </button>
        </div>
    </div>

    <%
    // Obtener la lista de productos desde el atributo 'listaProductos' en la solicitud
    List<Articulo> listaProductos = (List<Articulo>) request.getAttribute("listaProductos");
    int totalProductos = (listaProductos != null) ? listaProductos.size() : 0;
    %>

    <p>Total de productos: <strong><%= totalProductos %></strong></p>

    <div class="table-responsive">
        <table class="table table-striped table-hover">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Cantidad Disponible</th>
                    <th>Precio Unitario</th>
                    <th>Borrar</th>
                </tr>
            </thead>
            <tbody>
                <% 
                if (listaProductos != null && !listaProductos.isEmpty()) {
                    for (Articulo p : listaProductos) { 
                %>
                <tr>
                    <td><%= p.getIdArticulo() %></td>
                    <td><%= p.getDescripcion() %></td>
                    <td><%= p.getStock() %></td>
                    <td><%= p.getPrecioUnidad() %></td>
                    <td>
                        <!-- Botón de Borrar con SweetAlert -->
                        <a href="javascript:void(0);" class="btn btn-danger btn-sm" 
                           onclick="confirmarEliminacion(<%= p.getIdArticulo() %>)">
                            <i class="bi bi-trash"></i> Borrar
                        </a>
                    </td>
                </tr>
                <% 
                    } 
                } else {
                %>
                <tr>
                    <td colspan="5" class="text-center">No hay productos disponibles</td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</div>

<!-- Modal para la Estadística -->
<div class="modal fade" id="estadisticaModal" tabindex="-1" aria-labelledby="estadisticaModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="estadisticaModalLabel">Estadísticas de Stock</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-6">
                        <canvas id="stockChart"></canvas>
                    </div>
                    <div class="col-md-6">
                        <canvas id="preciosChart"></canvas>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>

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
        confirmButtonText: "¡Sí, eliminarlo!"
    }).then((result) => {
        if (result.isConfirmed) {
            // Hacer la petición para eliminar
            $.ajax({
                url: "control",
                type: "GET",
                data: {
                    opc: 11,
                    cod: productoId
                },
                success: function() {
                    // Mostrar el mensaje de éxito
                    Swal.fire({
                        title: "¡Eliminado!",
                        text: "El producto fue eliminado.",
                        icon: "success"
                    }).then(() => {
                        // Recargar la misma página actual sin cambiar parámetros
                        location.reload();
                    });
                },
                error: function() {
                    // Mostrar mensaje de error
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

    $(document).ready(function() {
        // Datos para los gráficos
        <% if (listaProductos != null && !listaProductos.isEmpty()) { %>
        
        // Preparar datos para los gráficos
        var labels = [];
        var cantidades = [];
        var precios = [];
        
        <% for (Articulo p : listaProductos) { %>
            labels.push('<%= p.getDescripcion() %>');
            cantidades.push(<%= p.getStock() %>);
            precios.push(<%= p.getPrecioUnidad() %>);
        <% } %>
        
        // Gráfico de Stock
        var ctxStock = document.getElementById('stockChart').getContext('2d');
        var stockChart = new Chart(ctxStock, {
            type: 'bar',
            data: {
                labels: labels,
                datasets: [{
                    label: 'Cantidad Disponible',
                    data: cantidades,
                    backgroundColor: 'rgba(54, 162, 235, 0.5)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true
                    }
                },
                plugins: {
                    title: {
                        display: true,
                        text: 'Inventario por Producto'
                    }
                }
            }
        });
        
        // Gráfico de Precios
        var ctxPrecios = document.getElementById('preciosChart').getContext('2d');
        var preciosChart = new Chart(ctxPrecios, {
            type: 'pie',
            data: {
                labels: labels,
                datasets: [{
                    label: 'Precio Unitario',
                    data: precios,
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.5)',
                        'rgba(54, 162, 235, 0.5)',
                        'rgba(255, 206, 86, 0.5)',
                        'rgba(75, 192, 192, 0.5)',
                        'rgba(153, 102, 255, 0.5)',
                        'rgba(255, 159, 64, 0.5)',
                        'rgba(199, 199, 199, 0.5)',
                        'rgba(83, 102, 255, 0.5)',
                        'rgba(40, 159, 64, 0.5)',
                        'rgba(210, 199, 199, 0.5)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    title: {
                        display: true,
                        text: 'Distribución de Precios'
                    }
                }
            }
        });
        <% } %>
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>