package beans;

import java.util.ArrayList;
import java.util.List;

public class MotoBean {
    private String marca;
    private String modelo;
    private int anio;
    private int caballos; // en HP
    private String color;
    private String estilo;

    private static List<MotoBean> listaMotos = new ArrayList<>();

    // Método para agregar una moto a la lista
    public static void agregarMoto(String marca, String modelo, int anio, int caballos, String color, String estilo) {
        MotoBean moto = new MotoBean();
        moto.setMarca(marca);
        moto.setModelo(modelo);
        moto.setAnio(anio);
        moto.setCaballos(caballos);
        moto.setColor(color);
        moto.setEstilo(estilo);
        listaMotos.add(moto);
    }

    // Método para obtener la lista de motos
    public static List<MotoBean> obtenerMotos() {
        return listaMotos;
    }

    // Getters y Setters
    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public int getAnio() {
        return anio;
    }

    public void setAnio(int anio) {
        this.anio = anio;
    }

    public int getCaballos() {
        return caballos;
    }

    public void setCaballos(int caballos) {
        this.caballos = caballos;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getEstilo() {
        return estilo;
    }

    public void setEstilo(String estilo) {
        this.estilo = estilo;
    }
}
