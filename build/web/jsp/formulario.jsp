<%-- 
    Document   : formulario
    Created on : 13 nov 2024, 20:42:07
    Author     : Carlos Eugenio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Formulario de Motos</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container mt-5">
            <h2>Formulario de Motos</h2>
            <form action="${pageContext.request.contextPath}/savemotos_servlet" method="post">
                <div class="mb-3">
                    <label for="marca" class="form-label">Marca</label>
                    <input type="text" class="form-control" id="marca" name="marca" maxlength="50" required>
                </div>
                <div class="mb-3">
                    <label for="modelo" class="form-label">Modelo</label>
                    <input type="text" class="form-control" id="modelo" name="modelo" maxlength="50" required>
                </div>
                <div class="mb-3">
                    <label for="anio" class="form-label">Año</label>
                    <input type="number" class="form-control" id="anio" name="anio" min="1900" max="2025" required>
                </div>
                <div class="mb-3">
                    <label for="caballos" class="form-label">Número de Caballos</label>
                    <input type="number" class="form-control" id="caballos" name="caballos" max="250" required>
                </div>
                <div class="mb-3">
                    <label for="color" class="form-label">Color</label>
                    <input type="text" class="form-control" id="color" name="color" maxlength="50" required>
                </div>
                <div class="mb-3">
                    <label for="estilo" class="form-label">Estilo</label>
                    <select class="form-select" id="estilo" name="estilo" required>
                        <option value="">Seleccione un estilo</option>
                        <option value="deportiva">Deportiva</option>
                        <option value="chooper">Chooper</option>
                        <option value="crucero">Crucero</option>
                        <option value="motocross">Motocross</option>
                        <option value="adventure">Adventure</option>
                        <option value="cafe racer">Cafe Racer</option>
                        <option value="touring">Touring</option>
                        <option value="naked">Naked</option>
                    </select>
                </div>
                <div class="mb-3">
                    <button type="button" class="btn btn-secondary" onclick="history.back()">Regresar</button>
                    <button type="submit" class="btn btn-primary">Guardar</button>
                </div>
            </form>
        </div>
        <!-- Bootstrap JS Bundle -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
