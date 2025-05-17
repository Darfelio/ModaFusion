<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.*,java.util.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Detalle de Compra</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Tailwind CSS (via CDN) -->
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">

    <%@ include file="include/header.jsp" %>

    <%

            HttpSession ses = request.getSession();
            @SuppressWarnings("unchecked")
            List<Compra> lista = (ArrayList<Compra>) ses.getAttribute("canasta");
            TarjetaCliente c = (TarjetaCliente) ses.getAttribute("cli");
            String nomc = c.getNombre() + ", " + "S/ " + c.getCredito();
            double sm = 0;
            for (Compra x : lista) {
                sm += x.Total();
            }
    %>

    <div class="container mx-auto px-4 py-8">
        <%
        if (c.getCredito() >= sm) {
        %>
        <div class="bg-white rounded-xl shadow-md p-6">
            <h2 class="text-2xl font-bold text-center text-gray-800 mb-6">Lista de compras de <%= nomc %></h2>

            <div class="text-center mb-4">
                <a href="tienda?opc=6" class="btn btn-success me-3">Confirmar Compra</a>
                <a href="tienda?opc=7" class="btn btn-danger">Cancelar Compra</a>
            </div>

            <div class="overflow-x-auto">
                <table class="table table-striped table-bordered table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>Código</th>
                            <th>Descripción</th>
                            <th>Precio</th>
                            <th>Cantidad</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        for (Compra x : lista) {
                        %>
                        <tr>
                            <td><%= x.getIdArticulo() %></td>
                            <td><%= x.getDescripcion() %></td>
                            <td>S/ <%= x.getPrecioUnidad() %></td>
                            <td><%= x.getCantidad() %></td>
                            <td>S/ <%= x.Total() %></td>
                        </tr>
                        <%
                        }
                        %>
                        <tr class="fw-bold">
                            <td colspan="4" class="text-end">Total Compra</td>
                            <td>S/ <%= sm %></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <%
        } else {
        %>
        <div class="text-center mt-10">
            <h2 class="text-3xl font-bold text-red-600 mb-3">Error en la compra</h2>
            <p class="text-lg text-gray-700">No tienes suficiente saldo en tu cuenta para realizar esta compra.</p>
        </div>
        <%
        }
        %>
    </div>

    <%@ include file="include/footer.jsp" %>

</body>
</html>


