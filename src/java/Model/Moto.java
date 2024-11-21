package Model;

public class Moto {
    private String marca;
    private String modelo;
    private int hp;
    private String color;
    private int ano;
    private String tipo;

    public Moto(String marca, String modelo, int hp, String color, int ano, String tipo) {
        this.marca = marca;
        this.modelo = modelo;
        this.hp = hp;
        this.color = color;
        this.ano = ano;
        this.tipo = tipo;
    }

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

    public int getHp() {
        return hp;
    }

    public void setHp(int hp) {
        this.hp = hp;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getAno() {
        return ano;
    }

    public void setAno(int ano) {
        this.ano = ano;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
}
