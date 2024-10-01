<%-- 
    Document   : index
    Created on : 1 oct 2024, 8:47:55
    Author     : JDani
--%>

<%@page import="modelo.Puesto" %>
<%@page import="modelo.Empleado" %>
<%@page import="java.util.HashMap" %>
<%@page import="javax.swing.table.DefaultTableModel" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <title>Empleados</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>
        <h1>Formulario Empleados</h1>
        <div class = "container">
            <form action="sr_empleado" method="post" class="form-group">
               
                <label for="lbl_id"><b>ID:</b></label>
                <input type="text" name="txt_id" id="txt_id" class="form-control" readonly>
                
                <label for="lbl_codigo"><b>Codigo:</b></label>
                <input type="text" name="txt_codigo" id="txt_codigo" class="form-control" placeholder="Ejemplo: 0001" required>
                
                <label for="lbl_nombres"><b>Nombres:</b></label>
                <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" placeholder="Ejemplo: Nombre 1 Nombre 2" required>
                
                <label for="lbl_apellidos"><b>Apellidos:</b></label>
                <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" placeholder="Ejemplo: Apellido 1 Apellido 2" required>
                
                <label for="lbl_direccion"><b>direccion</b></label>
                <input type="text" name="txt_direccion" id="txt_direccion" class="form-control" placeholder="Ejemplo: Zona, Av, Calle, No Casa" required>
                
                <label for="lbl_telefono"><b>Telefono</b></label>
                <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="Ejemplo: 00000000" required>
                
                <label for="lbl_fn"><b>Fecha de Nacimiento</b></label>
                <input type="date" name="txt_fn" id="txt_fn" class="form-control" placeholder="Ejemplo: YYYY/MM/DD" required>
                
                <label for="lbl_puesto"><b>Puesto</b></label>
                <select name="drop_puesto" id="drop_puesto" class="form-control">
                    <%
                        Puesto puesto = new Puesto();
                        HashMap<String, String> drop = puesto.drop_puesto();
                        for(String i: drop.keySet()){
                            out.println("<option value='" + i + "'>" + drop.get(i) + "</option>");
                        }  
                    %>
                    
                    
                </select>
                <br>
                <button name="btn_agregar" id="btn_agregar"  value="agregar" class="btn btn-primary btn-lg">Agregar</button>

            </form>
                    
            <table class="table table-striped">
                <thead>
                  <tr>
                    <th>Codigo</th>
                    <th>Nombres</th>
                    <th>Apellidos</th>
                    <th>Direccion</th>
                    <th>Telefono</th>
                    <th>Nacimiento</th>
                    <th>Puesto</th>
                  </tr>
                </thead>
                <tbody id ="tbl_empleados">
                    <%
                        Empleado empleado = new Empleado();
                        DefaultTableModel tabla = new DefaultTableModel();
                        tabla = empleado.leer();
                            for (int t=0;t<tabla.getRowCount();t++){
                        
                            out.println("<tr data-id=" + tabla.getValueAt(t,0) + " data-id_p=" + tabla.getValueAt(t,8) + ">");
                            out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 2) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 3) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 4) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 5) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 6) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 7) + "</td>");
        
                            out.println("</tr>");
                        }
                    
                    %>
                </tbody>
            </table>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script type="text/javascript">
        $(document).ready(function() {
            $('#tbl_empleados').on('click', 'tr', function(event) {
                console.log("Fila seleccionada");
                var target, id, id_p, codigo, nombres, apellidos, direccion, telefono, nacimiento;
                target = $(this); 
                id = target.data('id');
                id_p = target.data('id_p');
                codigo = target.find("td").eq(0).html();
                nombres = target.find("td").eq(1).html();
                apellidos = target.find("td").eq(2).html();
                direccion = target.find("td").eq(3).html();
                telefono = target.find("td").eq(4).html();
                nacimiento = target.find("td").eq(5).html();

                // Llenando los campos del formulario
                $("#txt_id").val(id);
                $("#txt_codigo").val(codigo);
                $("#txt_nombres").val(nombres);
                $("#txt_apellidos").val(apellidos);
                $("#txt_direccion").val(direccion);
                $("#txt_telefono").val(telefono);
                $("#txt_fn").val(nacimiento);
                $("#drop_puesto").val(id_p);
            });
        });


        </script>

    </body>
</html>
