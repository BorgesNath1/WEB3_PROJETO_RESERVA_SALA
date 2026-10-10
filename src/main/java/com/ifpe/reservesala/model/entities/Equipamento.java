/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ifpe.reservesala.model.entities;

/**
 *
 * @author Nathan
 */
public class Equipamento {
    private int id;
    private String nome;
    private String marca;
    private String tipo;
    private String utilidade;
    
    public Equipamento(){
        
    }
    
    public Equipamento (int id, String nome, String marca, String tipo, String utilidade) {
        this.id = id;
        this.nome = nome;
        this.marca = marca;
        this.tipo = tipo;
        this.utilidade = utilidade;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String Marca) {
        this.marca = Marca;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getUtilidade() {
        return utilidade;
    }

    public void setUtilidade(String utilidade) {
        this.utilidade = utilidade;
    }
    
    public Equipamento selfReplicate(){
        Equipamento replica = new Equipamento();
        
        replica.setId(this.getId());
        replica.setMarca(this.getMarca());
        replica.setNome(this.getNome());
        replica.setTipo(this.getTipo());
        replica.setUtilidade(this.getUtilidade());
        
        return replica;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Equipamento that = (Equipamento) o;
        return id == that.id;
    }

    @Override
    public int hashCode() {
        return Integer.hashCode(id);
    }
}
