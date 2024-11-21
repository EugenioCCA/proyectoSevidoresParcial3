<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.MotoBean"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Detalles de la Moto (XML)</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container my-5">
            <h1 class="text-center">Detalles de la Moto (XML)</h1>
            <%
                // Validar y obtener parámetros de la solicitud
                String marca = request.getParameter("marca") != null ? request.getParameter("marca") : "Desconocido";
                String modelo = request.getParameter("modelo") != null ? request.getParameter("modelo") : "Desconocido";
                int anio;
                try {
                    anio = Integer.parseInt(request.getParameter("anio"));
                } catch (NumberFormatException e) {
                    anio = 0; // Valor por defecto si el parámetro es inválido
                }
                int caballos;
                try {
                    caballos = Integer.parseInt(request.getParameter("caballos"));
                } catch (NumberFormatException e) {
                    caballos = 0; // Valor por defecto si el parámetro es inválido
                }
                String color = request.getParameter("color") != null ? request.getParameter("color") : "Desconocido";
                String estilo = request.getParameter("estilo") != null ? request.getParameter("estilo") : "Desconocido";

                // Crear y configurar un bean
                MotoBean motoSeleccionada = new MotoBean();
                motoSeleccionada.setMarca(marca);
                motoSeleccionada.setModelo(modelo);
                motoSeleccionada.setAnio(anio);
                motoSeleccionada.setCaballos(caballos);
                motoSeleccionada.setColor(color);
                motoSeleccionada.setEstilo(estilo);
            %>

            <!-- Mostrar XML -->
            <pre class="border p-3 bg-light">
            &lt;Moto&gt;
                &lt;Marca&gt;<%= motoSeleccionada.getMarca() %>&lt;/Marca&gt;
                &lt;Modelo&gt;<%= motoSeleccionada.getModelo() %>&lt;/Modelo&gt;
                &lt;Ano&gt;<%= motoSeleccionada.getAnio() %>&lt;/Ano&gt;
                &lt;Caballos&gt;<%= motoSeleccionada.getCaballos() %>&lt;/Caballos&gt;
                &lt;Color&gt;<%= motoSeleccionada.getColor() %>&lt;/Color&gt;
                &lt;Estilo&gt;<%= motoSeleccionada.getEstilo() %>&lt;/Estilo&gt;
            &lt;/Moto&gt;
            </pre>

            <!-- Botones -->
            <div class="text-center mt-4">
                <a href="/proyectotercerparcial/jsp/mostarMotos.jsp" class="btn btn-dark">Regresar</a>
                <form action="${pageContext.request.contextPath}/crearXMLServlet" method="post" style="display:inline;">
                    <input type="hidden" name="marca" value="<%= marca %>">
                    <input type="hidden" name="modelo" value="<%= modelo %>">
                    <input type="hidden" name="anio" value="<%= anio %>">
                    <input type="hidden" name="caballos" value="<%= caballos %>">
                    <input type="hidden" name="color" value="<%= color %>">
                    <input type="hidden" name="estilo" value="<%= estilo %>">
                    <button type="submit" class="btn btn-dark">Descargar XML</button>
                </form>
            </div>
        </div>
    </body>
</html>
