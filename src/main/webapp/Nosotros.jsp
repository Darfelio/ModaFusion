<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Moda Fusion</title>
  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<style>
  body {
    background-color: #f8f9fa;
  }
   .navbar-brand {
      font-size: 2rem;
      color: #ff6f61 !important;
      font-weight: bold;
      text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.3);
    }

  .nosotros h2 {
    font-size: 2.5rem;
    font-weight: bold;
    text-align: center;
    margin-bottom: 40px;
    color: #343a40;
  }

  .nosotros h3 {
    color: #007bff;
    font-weight: 600;
    margin-bottom: 15px;
  }

  .nosotros p {
    text-align: justify;
  }

  .nosotros .col-md-4 {
    background-color: #ffffff;
    padding: 20px;
    border-radius: 15px;
    box-shadow: 0 4px 8px rgba(0,0,0,0.05);
    transition: transform 0.3s, box-shadow 0.3s;
  }

  .nosotros .col-md-4:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 16px rgba(0,0,0,0.1);
  }

  .nosotros img {
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    transition: transform 0.3s ease;
  }

  .nosotros img:hover {
    transform: scale(1.05);
  }
</style>
</head>
<body>
  <%@ include file="include/header.jsp" %>

<section class="nosotros py-5">
  <div class="container">
    <h2>Sobre Nosotros</h2>
    <div class="row row-cols-1 row-cols-md-3 g-4 mb-5">
      <div class="col">
        <div class="p-4 bg-white rounded shadow-sm h-100">
          <h3>Valores</h3>
          <p>
            En Moda Fusion, nuestros valores fundamentales son la calidad de nuestros productos, la satisfacción del cliente y la innovación constante. Nos esforzamos por ofrecer prendas de vestir de alta calidad que se adapten a las últimas tendencias de la moda.
          </p>
        </div>
      </div>
      <div class="col">
        <div class="p-4 bg-white rounded shadow-sm h-100">
          <h3>Visión</h3>
          <p>
            Nuestra visión en Moda Fusion es convertirnos en la tienda de ropa líder a nivel nacional, ofreciendo una amplia gama de prendas de vestir para toda la familia. Buscamos ser reconocidos por nuestra dedicación a la moda, la calidad y la satisfacción del cliente.
          </p>
        </div>
      </div>
      <div class="col">
        <div class="p-4 bg-white rounded shadow-sm h-100">
          <h3>Misión</h3>
          <p>
            Nuestra misión es proporcionar a nuestros clientes prendas de vestir de calidad que reflejen su estilo personal y les permitan expresarse. Nos esforzamos por ofrecer una experiencia de compra agradable y sencilla, brindando siempre un servicio atento y amable.
          </p>
        </div>
      </div>
    </div>

    <h3 class="text-center mb-4">Acerca de nosotros</h3>
    <div class="row row-cols-1 row-cols-md-3 g-4">
      <div class="col">
        <img src="foto/topitop.jpg" alt="Imagen 1" class="img-fluid rounded shadow-sm w-100">
      </div>
      <div class="col">
        <img src="foto/vision.jpg" alt="Imagen 2" class="img-fluid rounded shadow-sm w-100">
      </div>
      <div class="col">
        <img src="foto/mision.jpg" alt="Imagen 3" class="img-fluid rounded shadow-sm w-100">
      </div>
    </div>
  </div>
</section>


  <%@ include file="include/footer.jsp" %>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>
