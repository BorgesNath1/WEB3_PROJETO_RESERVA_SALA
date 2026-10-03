/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ifpe.reservesala.model.entities;

/**
 *
 * @author Nathan
 */    
public class Sala {
    private int id;
    private String nome;
    private String localizacao;
    private int capacidade;
    private TipoSala tipo;
    
    public Sala(){
        
    }
    
    public Sala(int idSala, String nomeSala, String localSala, int capaciSala, TipoSala type){
        this.setId(idSala);
        this.setNome(nomeSala);
        this.setLocalizacao(localSala);
        this.setCapacidade(capaciSala);
        this.setTipo(type);
    }

    public int getId() {
        return id;
    }

    public final void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public final void setNome(String nome) {
        this.nome = nome;
    }

    public String getLocalizacao() {
        return localizacao;
    }

    public final void setLocalizacao(String localizacao) {
        this.localizacao = localizacao;
    }

    public int getCapacidade() {
        return capacidade;
    }

    public final void setCapacidade(int capacidade) {
        this.capacidade = capacidade;
    }

    public TipoSala getTipo() {
        return tipo;
    }

    public final void setTipo(TipoSala tipo) {
        this.tipo = tipo;
    }
    
    public final Sala selfReplicate(){
        Sala replica = new Sala();
        
        replica.setId(this.getId());
        replica.setNome(this.getNome());
        replica.setCapacidade(this.getCapacidade());
        replica.setTipo(this.getTipo());
        
        return replica;
    }
}
