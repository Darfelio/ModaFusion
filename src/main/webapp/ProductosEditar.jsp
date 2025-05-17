<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Producto" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Modificar Producto</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <!-- Incluimos el CDN de Bootstrap Icons para los íconos -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
</head>
<body>
    
<%@ include file="include/header.jsp" %>

<%
    Producto pe = (Producto) request.getAttribute("dato");
%>

<div class="container mt-5">
    <h2 class="mb-4 text-center">Modificar datos del Producto</h2>

    <!-- Botón de retroceder justo debajo del título -->
    <div class="text-end mb-3">
        <a href="javascript:history.back()" class="btn btn-secondary">
            <i class="bi bi-arrow-left"></i> Volver
        </a>
    </div>

    <form id="form" action="control" class="p-4 border rounded shadow-sm bg-light">
        <input type="hidden" name="opc" value="7">

        <div class="row g-3">
            <!-- Producto ID -->
            <div class="col-md-6">
                <div class="form-group">
                    <label for="producto_id">Producto ID</label>
                    <input type="text" class="form-control" id="producto_id" name="producto_id" value="<%= pe.getProducto_id() %>" readonly>
                </div>
            </div>

            <!-- Tienda ID -->
            <div class="col-md-6">
                <div class="form-group">
                    <label for="tienda_id">Tienda ID</label>
                    <input type="text" class="form-control" id="tienda_id" name="tienda_id" value="<%= pe.getTienda_id() %>">
                </div>
            </div>

            <!-- Categoría ID -->
            <div class="col-md-6">
                <div class="form-group">
                    <label for="categoria_id">Categoría ID</label>
                    <input type="text" class="form-control" id="categoria_id" name="categoria_id" value="<%= pe.getCategoria_id() %>">
                </div>
            </div>

            <!-- Nombre del Producto -->
            <div class="col-md-6">
                <div class="form-group">
                    <label for="nombre_producto">Nombre del Producto</label>
                    <input type="text" class="form-control" id="nombre_producto" name="nombre_producto" value="<%= pe.getNombre_producto() %>">
                </div>
            </div>

            <!-- Cantidad Disponible -->
            <div class="col-md-6">
                <div class="form-group">
                    <label for="cantidad_disponible">Cantidad Disponible</label>
                    <input type="text" class="form-control" id="cantidad_disponible" name="cantidad_disponible" value="<%= pe.getCantidad_disponible() %>">
                </div>
            </div>

            <!-- Precio Unitario -->
            <div class="col-md-6">
                <div class="form-group">
                    <label for="precio_unitario">Precio Unitario</label>
                    <input type="text" class="form-control" id="precio_unitario" name="precio_unitario" value="<%= pe.getPrecio_unitario() %>">
                </div>
            </div>

        </div>

        <div class="text-center mt-4">
            <button type="submit" class="btn btn-primary btn-lg">Guardar Cambios</button>
        </div>
    </form>
</div>

<script>
    $(document).ready(function() {
        $('#form').validate({
            rules: {
                tienda_id: { digits: true, required: true },
                categoria_id: { digits: true, required: true },
                nombre_producto: { required: true },
                cantidad_disponible: { digits: true, required: true },
                precio_unitario: { number: true, required: true }
            },
            messages: {
                tienda_id: { required: "Por favor, ingresesss el ID de la tienda", digits: "Solo números." },
                categoria_id: { required: "Por favor, ingrese el ID de la categoría", digits: "Solo números." },
                nombre_producto: { required: "Ingrese el nombre del producto" },
                cantidad_disponible: { required: "Ingrese la cantidad disponible", digits: "Solo números." },
                precio_unitario: { required: "Ingrese el precio unitario", number: "Ingrese un número válido." }
            },
            highlight: function(element) {
                $(element).addClass("is-invalid").removeClass("is-valid");
            },
            unhighlight: function(element) {
                $(element).removeClass("is-invalid").addClass("is-valid");
            },
            errorPlacement: function(error, element) {
                error.addClass("invalid-feedback");
                error.insertAfter(element);
            }
        });
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>

