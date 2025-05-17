<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Factura Final</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>

    <style>
        /* Animación al cargar */
        .fade-in {
            animation: fadeIn 1.2s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        body {
            background-image: url('https://previews.123rf.com/images/kalinavova/kalinavova1407/kalinavova140700015/29833768-pila-ig-de-dinero-de-d%C3%B3lares-en-fondo-blanco.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }

        .overlay {
            backdrop-filter: blur(4px);
            background-color: rgba(255, 255, 255, 0.8);
        }
    </style>
</head>
<body class="min-h-screen">

    <%@ include file="include/header.jsp" %>

    <%
        String fac = (String) request.getAttribute("factura");
        String nomc = (String) request.getAttribute("nombre");
        double total = (double) request.getAttribute("total");
    %>

    <div class="flex justify-center items-center h-screen fade-in">
        <div class="overlay rounded-lg p-8 w-full max-w-md shadow-2xl text-center">
            <h2 class="text-2xl font-bold mb-6 text-gray-800">Resumen de Factura</h2>
            <table class="table table-bordered border border-gray-300 w-full mb-6">
                <tr>
                    <td class="bg-gray-100 font-medium">Factura Nro</td>
                    <td><%= fac %></td>
                </tr>
                <tr>
                    <td class="bg-gray-100 font-medium">Cliente</td>
                    <td><%= nomc %></td>
                </tr>
                <tr>
                    <td class="bg-gray-100 font-medium">Total Pago</td>
                    <td>S/ <%= total %></td>
                </tr>
            </table>
            <a href="pagArticulo.jsp" class="btn btn-success transition-all duration-300 hover:scale-105">Otra Compra</a>
        </div>
    </div>

    <%@ include file="include/footer.jsp" %>

</body>
</html>


