/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ifpe.reservesala.model.entities;

import java.time.LocalDate;
import java.util.List;

/**
 *
 * @author Nathan
 */
public class Aula {
    
    private int id;
    private LocalDate dataAula;
    private int horaAula;
    private int duracao;
    private List<ItemEquipamento> itensApoio;
    private Professor profResponsavel;
    private Sala sala;
    
    public Aula(){
        
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public LocalDate getDataAula() {
        return dataAula;
    }

    public void setDataAula(LocalDate dataAula) {
        this.dataAula = dataAula;
    }

    public int getHoraAula() {
        return horaAula;
    }

    public void setHoraAula(int horaAula) {
        this.horaAula = horaAula;
    }

    public int getDuracao() {
        return duracao;
    }

    public void setDuracao(int duracao) {
        this.duracao = duracao;
    }

    public List<ItemEquipamento> getItensApoio() {
        return itensApoio;
    }

    public void setItensApoio(List<ItemEquipamento> itens) {
        this.itensApoio = itens;
    }

    public Professor getProfResponsavel() {
        return profResponsavel;
    }

    public void setProfResponsavel(Professor profResponsavel) {
        this.profResponsavel = profResponsavel;
    }

    public Sala getSala() {
        return sala;
    }

    public void setSala(Sala sala) {
        this.sala = sala;
    }
    
    public Aula selfReplicate(){
        
        Aula replica = new Aula();
        
        replica.setId(this.getId());
        replica.setDataAula(this.getDataAula());
        replica.setHoraAula(this.getHoraAula());
        replica.setDuracao(this.getDuracao());
        replica.setItensApoio(this.getItensApoio());
        replica.setProfResponsavel(this.getProfResponsavel());
        replica.setSala(this.getSala());

        return replica;
    }
    
    
    
}
