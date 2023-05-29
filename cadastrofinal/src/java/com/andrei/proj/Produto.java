package com.andrei.proj;

/**
 *
 * @author Andrei
 */
public class Produto {

    public Produto() {
    }
    private int id;
    private String nome;
    private double preco;
    
    // getters e setters

    public int getId() {
        return id;
    }

    public double getPreco() {
        return preco;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }
    
    public void setId(int id) {
        this.id = id;
    }
}

