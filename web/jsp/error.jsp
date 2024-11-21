<%-- 
    Document   : error.jsp
    Created on : 13 nov 2024, 21:30:00
    Author     : Carlos Eugenio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="refresh" content="10; URL=index.jsp">
        <meta charset="UTF-8">
        <title>Error en el Proceso</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container mt-5">
            <div class="alert alert-danger" role="alert">
                <h4 class="alert-heading">¡Error!</h4>
                <p>Ocurrió un problema al procesar su solicitud. Por favor, inténtelo de nuevo más tarde.</p>
                <hr>
                <p class="mb-0">Si el problema persiste, contacte al administrador del sistema.</p>
            </div>
            <div class="mt-3">
                <button type="button" class="btn btn-secondary" onclick="history.back()">Regresar</button>
            </div>
        </div>
        <!-- Bootstrap JS Bundle -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
