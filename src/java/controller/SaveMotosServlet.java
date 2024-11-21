/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import Model.Moto;
import configuration.ConnectionBD;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Carlos Eugenio
 */
@WebServlet(name = "saveMotosServlet", urlPatterns = {"/savemotos_servlet"})
public class SaveMotosServlet extends HttpServlet {
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet saveMotos</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet saveMotos at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


    
    }
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("Entra al controlador");
        // Configuración de codificación
        request.setCharacterEncoding("UTF-8");

        // Obtener parámetros del formulario
        String marca = request.getParameter("marca");
        String modelo = request.getParameter("modelo");
        int anio = Integer.parseInt(request.getParameter("anio"));
        int caballos = Integer.parseInt(request.getParameter("caballos"));
        String color = request.getParameter("color");
        String estilo = request.getParameter("estilo");

        // Depuración de parámetros
        System.out.println("Marca: " + marca);
        System.out.println("Modelo: " + modelo);
        System.out.println("Año: " + anio);
        System.out.println("Caballos: " + caballos);
        System.out.println("Color: " + color);
        System.out.println("Estilo: " + estilo);


        // Crear objeto Moto
        Moto moto = new Moto(marca, modelo, caballos, color, anio, estilo);

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // Establecer conexión con la base de datos
            ConnectionBD conexion = new ConnectionBD();
            conn = conexion.getConnectionBD();

            if (conn == null) {
                System.out.println("Error: La conexión a la base de datos no se pudo establecer.");
                response.sendRedirect("/proyectotercerparcial/jsp/error.jsp");
                return;
            }

            // Consulta SQL
            String sql = "INSERT INTO motos (marca, modelo, anio, caballos, color, estilo) VALUES (?, ?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, moto.getMarca());
            stmt.setString(2, moto.getModelo());
            stmt.setInt(3, moto.getAno());
            stmt.setInt(4, moto.getHp());
            stmt.setString(5, moto.getColor());
            stmt.setString(6, moto.getTipo());

            // Ejecutar la inserción
            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                response.sendRedirect("/proyectotercerparcial/jsp/success.jsp");
            } else {
                System.out.println("Error: No se insertaron filas en la base de datos.");
                response.sendRedirect("/proyectotercerparcial/jsp/error.jsp");
            }

        } catch (SQLException e) {
            System.out.println("Error SQL: " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect("/proyectotercerparcial/jsp/error.jsp");
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }


    
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
