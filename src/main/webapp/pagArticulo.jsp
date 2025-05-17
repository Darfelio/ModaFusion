<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSP Page</title>
    <!-- Estilos CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <style>
    /* Tus estilos personalizados aquí */
     .navbar-brand {
	      font-size: 2rem;
	      color: #ff6f61 !important;
	      font-weight: bold;
	      text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.3);
	    }
    .custom-img {
        width: 200px;
        height: 200px;
        object-fit: contain; /* Para asegurarse de que la imagen se ajuste dentro del tamaño sin recortarse */
        margin: 10px; /* Margen fijo de 10 píxeles alrededor de la imagen */
    }
    </style>
</head>

<body>

    <%@ include file="include/header.jsp" %>

    <br>

    <%@ page import="dao.CarritoDAO,modelo.Articulo" %>
    <%
    CarritoDAO obj = new CarritoDAO();
    %>

    <h2 class="text-center">Zona de liquidación de moda</h2> 

    <br>

    <div class="container">
        <div class="row g-4"> <!-- g-4 para separación entre columnas -->
            <% int cuenta = 0;
            for (Articulo x : obj.lisArticulo()) { %>
                <div class="col-md-4">
                    <div class="card h-100">
                        <a href="tienda?opc=2&id=<%=x.getIdArticulo()%>">
                            <img src="ropa/<%=x.getDescripcion()%>.jpg" alt="Imagen" class="card-img-top custom-img">
                        </a>
                        <div class="card-body d-flex flex-column">
                            <h5 class="card-title"><%=x.getDescripcion()%></h5>
                            <p class="card-text">a partir de: S/. <%=x.getPrecioUnidad()%></p>
                            <a href="tienda?opc=2&id=<%=x.getIdArticulo()%>" class="btn btn-primary mt-auto">Añadir a la Cesta</a>
                        </div>
                    </div>
                </div>
                <% cuenta++;
                if (cuenta % 3 == 0) { %>
                    </div><div class="row g-4">
                <% }
            } %>
        </div>
    </div>

    <%@ include file="include/footer.jsp" %>

    <!-- Scripts de Bootstrap 5 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>

</body>

</html>




