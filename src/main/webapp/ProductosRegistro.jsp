<%@page import="modelo.Categoria"%>
<%@page import="modelo.Tienda"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="modelo.Producto"%>
<!DOCTYPE html>
<html>
<head>
<title>Registro de Productos</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./css/headerPrincipal.css">
<!-- Bootstrap 5 CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet" crossorigin="anonymous">
<!-- Bootstrap Icons para el ícono de retroceder -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<!-- SweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>

	<%@ include file="include/header.jsp"%>

	<div class="container mt-5">
		<h2 class="mb-4 text-center">Registro de Productos</h2>

		<!-- Botón de retroceder -->
		<div class="text-end mb-3">
			<a href="Productos.jsp" class="btn btn-secondary"> <i
				class="bi bi-arrow-left"></i> Volver
			</a>
		</div>

		<form id="form" action="control"
			class="p-4 border rounded shadow-sm bg-light">
			<input type="hidden" name="opc" value="3">

			<div class="row g-3">

				<!-- Tienda ID -->
				<div class="col-md-6">
					<div class="form-group">

						<label for="tienda_id">Tienda</label>
						<div class="input-group">
							<%
							@SuppressWarnings("unchecked")
							List<Tienda> listaTienda = (List<Tienda>) request.getAttribute("atrListaDeTiendas");
							%>
							<select class="form-select" id="tienda_id"
								name="tienda_id" required>
								<option  value="atrListaDeTiendas">Selecciona una Tienda</option>
								<%
								for (Tienda t : listaTienda) {
								%>
								<option value="<%=t.getTienda_id()%>"><%=t.getNombre_tienda()%></option>
								<%
								}
								%>
							</select>
						</div>

					</div>
				</div>


				<!-- Categoría ID -->
				<div class="col-md-6">
					<div class="form-group">
						<label for="categoria_id">Categoría</label>
						<div class="input-group">
							<%
							@SuppressWarnings("unchecked")
							List<Categoria> listaCategoria = (List<Categoria>) request.getAttribute("atrListaDeCategorias");
							%>

							<select class="form-select" id="categoria_id"
								name="categoria_id" required>
								<option value="atrListaDeCategorias">Selecciona una Categoria</option>
								<%
								for (Categoria c : listaCategoria) {
								%>
								<option value="<%=c.getCategoria_id()%>"><%=c.getNombre_categoria()%></option>
								<%
								}
								%>
							</select>
						</div>
					</div>
				</div>

				<!-- Nombre del Producto -->
				<div class="col-md-6">
					<div class="form-group">
						<label for="nombre">Nombre del Producto</label> <input type="text"
							class="form-control" id="nombre" name="nombre" required
							autocomplete="off">
					</div>
				</div>

				<!-- Cantidad Disponible -->
				<div class="col-md-6">
					<div class="form-group">
						<label for="cantidad">Cantidad Disponible</label> <input
							type="text" class="form-control" id="cantidad" name="cantidad"
							required autocomplete="off">
					</div>
				</div>

				<!-- Precio Unitario -->
				<div class="col-md-6">
					<div class="form-group">
						<label for="precio_unitario">Precio Unitario</label> <input
							type="text" class="form-control" id="precio_unitario"
							name="precio_unitario" required autocomplete="off">
					</div>
				</div>

			</div>

			<div class="text-center mt-4">
				<button type="submit" class="btn btn-success btn-lg">Registrar</button>
			</div>
		</form>
	</div>

	<script>
		$(document).ready(function() {
			$('#form').validate({
				rules : {
					tienda_id : {
						digits : true,
						required : true
					},
					categoria_id : {
						digits : true,
						required : true
					},
					nombre : {
						required : true
					},
					cantidad : {
						digits : true,
						required : true
					},
					precio_unitario : {
						number : true,
						required : true
					}
				},
				messages : {
					tienda_id : {
						required : "Por favor, ingrese el ID de la tienda",
						digits : "Solo números."
					},
					categoria_id : {
						required : "Por favor, ingrese el ID de la categoría",
						digits : "Solo números."
					},
					nombre : {
						required : "Ingrese el nombre del producto"
					},
					cantidad : {
						required : "Ingrese la cantidad disponible",
						digits : "Solo números."
					},
					precio_unitario : {
						required : "Ingrese el precio unitario",
						number : "Ingrese un número válido."
					}
				},
				highlight : function(element) {
					$(element).addClass("is-invalid").removeClass("is-valid");
				},
				unhighlight : function(element) {
					$(element).removeClass("is-invalid").addClass("is-valid");
				},
				errorPlacement : function(error, element) {
					error.addClass("invalid-feedback");
					error.insertAfter(element);
				},
				submitHandler : function(form) {
					// Evitar el envío del formulario y mostrar SweetAlert
					Swal.fire({
						icon : 'success',
						title : 'Producto registrado',
						text : "El producto se registro correctamente",
						showConfirmButton : false,
						timer : 1500
					}).then(function() {
						form.submit(); // Enviar el formulario después de la alerta
					});
				}
			});
		});
	</script>

	<!-- Bootstrap 5 JS Bundle (incluye Popper) -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
</body>
</html>
