<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.MotoBean"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Detalles de la Moto</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container my-5">
            <h1 class="text-center">Detalles de la Moto</h1>
            <%
                
                String marca = request.getParameter("marca");
                String modelo = request.getParameter("modelo");
                int anio = Integer.parseInt(request.getParameter("anio")); 
                int caballos = Integer.parseInt(request.getParameter("caballos")); 
                String color = request.getParameter("color");
                String estilo = request.getParameter("estilo");
                
                // Crear y configurar un bean
                MotoBean motoSeleccionada = new MotoBean();
                motoSeleccionada.setMarca(marca);
                motoSeleccionada.setModelo(modelo);
                motoSeleccionada.setAnio(anio);
                motoSeleccionada.setCaballos(caballos);
                motoSeleccionada.setColor(color);
                motoSeleccionada.setEstilo(estilo);
                

                
            %>

            <table class="table table-bordered mt-4">
                <thead>
                    <tr>
                        <th>Marca</th>
                        <th>Modelo</th>
                        <th>Horse Power</th>
                        <th>Color</th>
                        <th>Año</th>
                        <th>Categoria</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><%= motoSeleccionada.getMarca() %></td>
                        <td><%= motoSeleccionada.getModelo() %></td>
                        <td><%= motoSeleccionada.getCaballos() %></td>
                        <td><%= motoSeleccionada.getColor() %></td>
                        <td><%= motoSeleccionada.getAnio() %></td>
                        <td><%= motoSeleccionada.getEstilo() %></td>
                    </tr>
                    
                </tbody>
            </table>

            <div class="text-center mt-4">
                <a href="/proyectotercerparcial/jsp/mostarMotos.jsp" class="btn btn-dark">Regresar</a>
            </div>
        </div>
    </body>
</html>
