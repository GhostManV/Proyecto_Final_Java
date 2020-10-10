<%-- 
    Document   : Puestos
    Created on : sep 30, 2020, 5:32:13 p.m.
    Author     : eriki
--%>

<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page import="Modelo.Puesto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

        <title>Empleados</title>
    </head>
    <body>
        <h1>Empleados</h1>
          <h1>Formulario Empleados</h1>
        <div class="container">
            <form action="sr_Puestos" method="post" class="form-group">
               <label for="lbl_id" ><b>ID</b></label>
                <input type="text" name="txt_id" id="txt_id" class="form-control" value="0" readonly > 
                <label for="lbl_puestos" ><b>Puestos</b></label>
                <input type="text" name="txt_puestos" id="txt_puestos" class="form-control" placeholder="Ejemplo: Gerente" required>
                <button name="btn_agregar" id="btn_agregar"  value="agregar" class="btn btn-primary btn-lg">Agregar</button>
                <button name="btn_modificar" id="btn_modificar"  value="modificar" class="btn btn-success btn-lg">Modificar</button>
                <button name="btn_eliminar" id="btn_eliminar"  value="eliminar" class="btn btn-danger btn-lg" onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false" >Eliminar</button>
                
            </form>
                <div class="container">
                  <table class="table table-striped">
    <thead>
        <tr>
        <th>ID</th>
        <th>Puestos</th>
      </tr>
    </thead>
    <tbody id="tbl_puestos">
        <% 
       Puesto puesto = new Puesto();
        DefaultTableModel tabla = new DefaultTableModel();
        tabla = puesto.leer();
        for (int t=0;t<tabla.getRowCount();t++){
            out.println("<tr>");
            out.println("<td>" + tabla.getValueAt(t,0) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,1) + "</td>");
            out.println("</tr>");
        
        }
        %>
      
    </tbody>
  </table>
  </div>
        <script type="text/javascript">
    $('#tbl_puestos').on('click','tr td',function(evt){
       var target,id,puestos; 
       target = $(event.target);
      
       id= target.parent("tr").find("td").eq(0).html();
       puestos = target.parent("tr").find("td").eq(1).html();
       
       $("#txt_id").val(id);
       $("#txt_puestos").val(puestos);
      
       
    });
    
</script>
        <a href="Puestos.jsp">Puestos</a>
        <a href="index.jsp">Regresar</a>
    </body>
</html>
