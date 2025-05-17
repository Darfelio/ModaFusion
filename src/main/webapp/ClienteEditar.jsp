<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Cliente" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modificar Cliente</title>
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
</head>
<body class="bg-light">

<%
    Cliente pe = (Cliente) request.getAttribute("dato");
%>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-6 mt-5">
            <div class="card shadow-sm">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h2 class="text-dark mb-0">Modificar datos del Cliente</h2>
                        <a href="javascript:history.back()" class="btn btn-outline-secondary">
                            <i class="bi bi-arrow-left"></i> Volver
                        </a>
                    </div>
                    <form id="form" action="control" onsubmit="return validarFormulario()">
                        <input type="hidden" name="opc" value="5">

                        <div class="mb-3">
                            <label for="cliente_id" class="form-label">Cliente ID</label>
                            <input type="text" class="form-control" id="cliente_id" name="cliente_id" value="<%=pe.getCliente_id()%>" readonly>
                            <div id="error-cliente-id" class="form-text text-danger"></div>
                        </div>

                        <div class="mb-3">
                            <label for="nombre" class="form-label">Nombre</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" value="<%=pe.getNombre()%>">
                            <div id="error-nombre" class="form-text text-danger"></div>
                        </div>

                        <div class="mb-3">
                            <label for="apellido" class="form-label">Apellido</label>
                            <input type="text" class="form-control" id="apellido" name="apellido" value="<%=pe.getApellido()%>">
                            <div id="error-apellido" class="form-text text-danger"></div>
                        </div>

                        <div class="mb-3">
                            <label for="direccion" class="form-label">Dirección</label>
                            <input type="text" class="form-control" id="direccion" name="direccion" value="<%=pe.getDireccion()%>">
                            <div id="error-direccion" class="form-text text-danger"></div>
                        </div>

                        <div class="text-center">
                            <button type="submit" class="btn btn-primary px-4">Guardar Cambios</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>

<script>
function validarFormulario() {
    let valido = true;

    const soloNumeros = /^[0-9]+$/;
    const soloLetras = /^[A-Za-zÁÉÍÓÚÑáéíóúñ\s]+$/;
    const letrasYSimbolos = /^[A-Za-zÁÉÍÓÚÑáéíóúñ0-9\s\#\-\.\,\:]+$/;

    const clienteId = document.getElementById("cliente_id").value.trim();
    const nombre = document.getElementById("nombre").value.trim();
    const apellido = document.getElementById("apellido").value.trim();
    const direccion = document.getElementById("direccion").value.trim();

    document.getElementById("error-cliente-id").innerText = "";
    document.getElementById("error-nombre").innerText = "";
    document.getElementById("error-apellido").innerText = "";
    document.getElementById("error-direccion").innerText = "";

    if (!soloNumeros.test(clienteId)) {
        document.getElementById("error-cliente-id").innerText = "El ID debe contener solo números.";
        valido = false;
    }

    if (!soloLetras.test(nombre)) {
        document.getElementById("error-nombre").innerText = "El nombre debe contener solo letras.";
        valido = false;
    }

    if (!soloLetras.test(apellido)) {
        document.getElementById("error-apellido").innerText = "El apellido debe contener solo letras.";
        valido = false;
    }

    if (!letrasYSimbolos.test(direccion)) {
        document.getElementById("error-direccion").innerText = "La dirección contiene caracteres inválidos.";
        valido = false;
    }

    return valido;
}
</script>

</body>
</html>

