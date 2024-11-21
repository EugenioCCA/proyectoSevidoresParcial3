package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

@WebServlet(name = "CrearXMLServlet", urlPatterns = {"/crearXMLServlet"})
public class CrearXMLServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener parámetros
        String marca = request.getParameter("marca");
        String modelo = request.getParameter("modelo");
        String anio = request.getParameter("anio");
        String caballos = request.getParameter("caballos");
        String color = request.getParameter("color");
        String estilo = request.getParameter("estilo");

        try {
            // Crear el documento XML
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document document = builder.newDocument();

            
            Element root = document.createElement("Moto");
            document.appendChild(root);

            // Elementos del XML
            Element marcaElement = document.createElement("Marca");
            marcaElement.appendChild(document.createTextNode(marca));
            root.appendChild(marcaElement);

            Element modeloElement = document.createElement("Modelo");
            modeloElement.appendChild(document.createTextNode(modelo));
            root.appendChild(modeloElement);

            Element anioElement = document.createElement("Ano");
            anioElement.appendChild(document.createTextNode(anio));
            root.appendChild(anioElement);

            Element caballosElement = document.createElement("Caballos");
            caballosElement.appendChild(document.createTextNode(caballos));
            root.appendChild(caballosElement);

            Element colorElement = document.createElement("Color");
            colorElement.appendChild(document.createTextNode(color));
            root.appendChild(colorElement);

            Element estiloElement = document.createElement("Estilo");
            estiloElement.appendChild(document.createTextNode(estilo));
            root.appendChild(estiloElement);

            // Configurar la respuesta para descarga
            response.setContentType("application/xml");
            response.setHeader("Content-Disposition", "attachment;filename=moto_" + marca + "_" + modelo + ".xml");

           
            Transformer transformer = TransformerFactory.newInstance().newTransformer();
            DOMSource source = new DOMSource(document);
            StreamResult result = new StreamResult(response.getOutputStream());
            transformer.transform(source, result);

        } catch (ParserConfigurationException | TransformerException e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al generar el archivo XML: " + e.getMessage());
        }
    }
}
