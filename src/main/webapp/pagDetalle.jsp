<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Articulo, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
    <title>JSP Page</title>
    
    <!-- Estilos CSS -->
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #f2f2f2;
            padding: 20px;
        }

        h1 {
            margin: 0;
        }
        
        h2 {
            margin: 20px 0;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
        }
        
        td {
            padding: 15px;
        }
        
        img {
            height: 300px;
            width: 300px;
        }
        
        .red-text {
            color: red;
        }
    </style>
</head>
<body>
    
    <%@ include file="include/header.jsp" %>   
    
    <br>
    
<%
    Articulo art = (Articulo) request.getAttribute("dato");
%>   

<div style="text-align: center;">
    
    <h2><%= art.getDescripcion()%></h2>
    
    <form name="fr">
        <table>
            <tr>
                <td rowspan="5">
                    <img src="ropa/<%=art.getDescripcion()%>.jpg" alt="Imagen" class="img-thumbnail">  
                </td>
                <td><%= art.getDescripcion()%></td>
            </tr>
            
            <tr>
                <td><span class="red-text">A partir de:</span></td>
                <td><span class="red-text"><%=art.getPrecioUnidad()%> &euro;</span></td>  
            </tr>
            
            <tr>
                <td>Stock</td>
                <td><%= art.getStock() %></td>
            </tr>
            
            <tr>
                <td>Talla</td>
                <td>
                    <input type="text" placeholder="Ingrese talla" name="talla">  
                </td>
            </tr>
            
            <tr>
                <td>Cantidad</td>
                <td><input type="number" placeholder="Ingrese cantidad" name="cantidad"></td>
            </tr>

            <!-- Inputs ocultos ubicados correctamente -->
            <tr style="display: none;">
                <td colspan="2">
                    <input type="hidden" name="opc" value="3">
                    <input type="hidden" name="coda" value="<%= art.getIdArticulo() %>">
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <a href="#" onclick="valida()">
                        <img src="foto/carro.jpg" alt="Agregar al carrito" style="height: 50px; width: 50px;">
                    </a>
                </td>
            </tr>
        </table>
    </form>

    <script>
        function valida() {
            var stk = <%= art.getStock() %>;
            var can = Number(fr.cantidad.value);
            if (can > stk) {
                alert("Stock no disponible");
                return;
            }
            fr.action = "tienda";
            fr.submit();
        }
    </script>

</div>

<br>

<%@ include file="include/footer.jsp" %>
              
</body>

</html>



