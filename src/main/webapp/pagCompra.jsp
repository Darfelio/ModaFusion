<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Compra,java.util.*" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Detalle de Compra</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 font-sans">

    <%@ include file="include/header.jsp" %>

    <div class="container mx-auto py-10 px-4">
        <div class="text-center mb-8">
            <h1 class="text-3xl font-bold text-gray-800">Detalle de Compra</h1>
        </div>

        <div class="flex justify-center space-x-4 mb-6">
            <a href="pagArticulo.jsp" class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700 transition">Seguir Comprando</a>
            <a href="pagLogin.jsp" class="bg-green-600 text-white px-4 py-2 rounded hover:bg-green-700 transition">Aceptar Compra</a>
        </div>

        <div class="overflow-x-auto bg-white shadow-md rounded-lg">
            <table class="min-w-full table-auto text-sm text-left text-gray-700">
                <thead class="bg-gray-200">
                    <tr>
                        <th class="px-4 py-3">Imagen</th>
                        <th class="px-4 py-3">Descripción</th>
                        <th class="px-4 py-3">Precio Unitario</th>
                        <th class="px-4 py-3">Cantidad</th>
                        <th class="px-4 py-3">Importe Total</th>
                        <th class="px-4 py-3">Eliminar</th>
                    </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200">
                    <%
                        HttpSession ses = request.getSession();
                        @SuppressWarnings("unchecked")
                        List<Compra> lista = (ArrayList<Compra>) ses.getAttribute("canasta");
                        int indice = 0;
                        double sm = 0;
                        if (lista != null) {
                            for (Compra x : lista) {
                                sm += x.Total();
                    %>
                    <tr>
                        <td class="px-4 py-3">
                            <img src="ropa/<%= x.getDescripcion() %>.jpg" alt="Producto" class="w-24 h-24 object-cover rounded">
                        </td>
                        <td class="px-4 py-3"><%= x.getDescripcion() %></td>
                        <td class="px-4 py-3">S/ <%= x.getPrecioUnidad() %></td>
                        <td class="px-4 py-3"><%= x.getCantidad() %></td>
                        <td class="px-4 py-3">S/ <%= x.Total() %></td>
                        <td class="px-4 py-3">
                            <a href="tienda?opc=4&ind=<%= indice %>" class="text-red-600 hover:underline">Eliminar</a>
                        </td>
                    </tr>
                    <%
                                indice++;
                            }
                        }
                    %>
                    <tr class="bg-gray-100 font-semibold text-gray-800">
                        <td colspan="4" class="px-4 py-3 text-right">Total Compra</td>
                        <td class="px-4 py-3">S/ <%= sm %></td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <%@ include file="include/footer.jsp" %>

</body>
</html>



