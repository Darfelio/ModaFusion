<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/adminlte.min.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        
           <%@ include file="include/header.jsp" %>
           
           <br>
           
    <%
        String msg="";
        if(request.getAttribute("dato")!=null)
          msg=(String)request.getAttribute("dato");
     %>   
   <div style="display: flex; justify-content: center; align-items: center; height: 100vh;">
    <form action="tienda" method="post">
        <input type="hidden" name="opc" value="5">  
        <table class="table table-bordered">
            <tr>
                <td rowspan="3">
                    <img src="foto/visa.jpg" alt="" class="" style="height: 100px; width: 200px;">
                </td>
                <td>Núm. de Tarjeta de Crédito</td>
                <td><input name="user" required></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" name="pas"></td>
            </tr>
            <tr>
                <td><input type="submit"></td>
                <td><%=msg%></td>
            </tr>
        </table>
    </form>
</div>

    
    <br>
            
              <%@ include file="include/footer.jsp" %>
              
   </body>
</html>
