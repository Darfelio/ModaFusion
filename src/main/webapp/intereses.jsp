<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Moda Fusion - Compra al Crédito</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" integrity="sha384-..." crossorigin="anonymous"/>
      <style type="text/css">
        body {
            background-color: #f4f6f9;
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #212529;
        }

        .navbar-brand {
            font-size: 2rem;
            color: #ff6f61 !important;
            font-weight: bold;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.3);
        }

        .nav-link {
            color: #ffffff !important;
            margin-right: 15px;
            transition: all 0.3s ease;
        }

        .nav-link:hover {
            color: #ff6f61 !important;
            text-decoration: underline;
        }

        .container {
            max-width: 900px;
            margin: auto;
            padding: 40px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h3 {
            text-align: left;
            color: #333;
            margin-top: 0;
            font-size: 24px;
        }

        .form-label {
            display: block;
            color: #555;
            margin-bottom: 6px;
            font-weight: bold;
        }

        .form-input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            margin-bottom: 15px;
            font-size: 16px;
        }

        .form-error {
            color: red;
            font-size: 12px;
        }

        .form-button {
            background-color: #4caf50;
            color: white;
            border: none;
            padding: 12px 25px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .form-button:hover {
            background-color: #45a049;
        }

        .result-label {
            font-weight: bold;
            color: #555;
        }

        .result-value {
            color: #777;
            font-size: 18px;
        }

        .back-button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            text-align: center;
            text-decoration: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
            display: inline-block;
            transition: background-color 0.3s ease;
        }

        .back-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
<%@ include file="include/header.jsp" %>

    <div class="container">
        <h3>Compra al Crédito Moda Fusion</h3>

        <form action="Control3Servlet" method="post">
            <div class="mb-3">
                <label for="tipoTarjeta" class="form-label">Tipo de tarjeta</label>
                <select id="tipoTarjeta" name="tipoTarjeta" class="form-input">
                    <option value="MasterCard">MasterCard</option>
                    <option value="Visa">Visa</option>
                    <option value="American Express">American Express</option>
                </select>
            </div>

            <div class="mb-3">
                <label for="valorCompra" class="form-label">Valor de compra</label>
                <input type="number" id="valorCompra" name="valorCompra" class="form-input" required />
                <div class="form-error">
                    <!-- Puedes agregar aquí un mensaje de error si es necesario -->
                </div>
            </div>

            <button type="submit" class="form-button">Calcular</button>
        </form>

        <!-- Mostrar los resultados si están disponibles -->
        <%
            // Acceder a los atributos de la solicitud establecidos en el servlet
            Double interes = (Double) request.getAttribute("interes");
            Double totalPagar = (Double) request.getAttribute("totalPagar");

            // Verificar si los resultados están presentes
            if (interes != null && totalPagar != null) {
        %>
            <div class="mt-3">
                <label class="result-label">Interés</label>
                <p class="result-value"><%= interes %></p>

                <label class="result-label">Total a pagar</label>
                <p class="result-value"><%= totalPagar %></p>
            </div>
        <%
            }
        %>

        <a href="Inicio.jsp" class="back-button">Regresar</a>
    </div>
	<%@ include file="include/footer.jsp" %>
</body>
</html>

