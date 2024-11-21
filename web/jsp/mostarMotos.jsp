<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import = "java.util.List"%>
<%@ page import="java.sql.Connection,java.sql.PreparedStatement,java.sql.ResultSet,java.sql.SQLException" %>
<%@ page import="configuration.ConnectionBD" %>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Lista de Motos</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #ffffff; /* Fondo blanco */
                color: #000000; /* Texto en negro */
            }
            h1 {
                background-color: #343a40; /* Fondo oscuro */
                color: #ffffff; /* Texto blanco */
                padding: 15px;
                border-radius: 5px;
            }
            .table thead th {
                background-color: #e9ecef; /* Encabezado gris claro */
                color: #000000; /* Texto negro */
            }
            .table tbody tr:nth-child(odd) {
                background-color: #f8f9fa; /* Fila gris claro */
            }
            .table tbody tr:nth-child(even) {
                background-color: #ffffff; /* Fila blanca */
            }
            .btn {
                color: #ffffff; /* Texto blanco */
                background-color: #6c757d; /* Botón gris */
                border: none;
            }
            .btn:hover {
                background-color: #5a6268; /* Botón gris más oscuro al pasar el mouse */
            }
            .btn-container {
                text-align: center;
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
        <div class="container my-5">
            <h1 class="text-center display-3">Lista de Motos</h1>
            <div class="table-responsive">
                <table class="table table-bordered text-center">
                    <thead>
                        <tr>
                            <th>Marca</th>
                            <th>Modelo</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            // Variables para la conexión
                            ConnectionBD conexion = new ConnectionBD();
                            Connection conn = conexion.getConnectionBD();
                            PreparedStatement stmt = null;
                            ResultSet rs = null;

                            try {
                                // Establecer conexión con la base de datos
                                conn = conexion.getConnectionBD();

                                // Consulta SQL
                                String sql = "SELECT marca, modelo, anio, caballos, color, estilo FROM motos";
                                stmt = conn.prepareStatement(sql);
                                rs = stmt.executeQuery();

                                // Iterar sobre los resultados
                                while (rs.next()) {
                                    String marca = rs.getString("marca");
                                    String modelo = rs.getString("modelo");
                                    int anio = rs.getInt("anio"); 
                                    int caballos = rs.getInt("caballos"); 
                                    String color = rs.getString("color"); 
                                    String estilo = rs.getString("estilo"); 
                        %>
                        <tr>
                            <td><%= marca %></td>
                            <td><%= modelo %></td>
                            <td>
                                <form action="beans.jsp" method="post" style="display:inline;">
                                    <input type="hidden" name="marca" value="<%= marca %>">
                                    <input type="hidden" name="modelo" value="<%= modelo %>">
                                    <input type="hidden" name="anio" value="<%= anio %>">
                                    <input type="hidden" name="caballos" value="<%= caballos %>">
                                    <input type="hidden" name="color" value="<%= color %>">
                                    <input type="hidden" name="estilo" value="<%= estilo %>">
                                    <button type="submit" class="btn btn-sm">Ver Beans</button>
                                </form>
                                <form action="mostrarXML.jsp" method="post" style="display:inline;">
                                    <input type="hidden" name="marca" value="<%= marca %>">
                                    <input type="hidden" name="modelo" value="<%= modelo %>">
                                    <input type="hidden" name="anio" value="<%= anio %>">
                                    <input type="hidden" name="caballos" value="<%= caballos %>">
                                    <input type="hidden" name="color" value="<%= color %>">
                                    <input type="hidden" name="estilo" value="<%= estilo %>">
                                    <button type="submit" class="btn btn-sm">Ver XML</button>
                                </form>
                            </td>
                        </tr>
                        <%
                                }
                            } catch (SQLException e) {
                                out.println("<tr><td colspan='3'>Error al obtener los datos: " + e.getMessage() + "</td></tr>");
                            } finally {
                                try {
                                    if (rs != null) rs.close();
                                    if (stmt != null) stmt.close();
                                    if (conn != null) conn.close();
                                } catch (SQLException e) {
                                    out.println("<tr><td colspan='3'>Error al cerrar la conexión: " + e.getMessage() + "</td></tr>");
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <!-- Botones debajo de la tabla -->
            <div class="btn-container">
                <a href="/proyectotercerparcial/jsp/formulario.jsp" class="btn">Agregar Moto</a>
                <a href="/proyectotercerparcial/index.html" class="btn">Menú Principal</a>
            </div>
        </div>
        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
