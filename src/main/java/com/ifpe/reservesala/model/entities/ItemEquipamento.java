/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ifpe.reservesala.model.entities;

/**
 *
 * @author Nathan
 */
public class ItemEquipamento {
    
    private int id;
    private int quantidade;
    private Equipamento equipamento;
    
    public ItemEquipamento(){
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public Equipamento getEquipamento() {
        return equipamento;
    }

    public void setEquipamento(Equipamento equipamento) {
        this.equipamento = equipamento;
    }
    
    public ItemEquipamento selfReplicate(){
        
        ItemEquipamento replica = new ItemEquipamento();
        
        replica.setId(this.getId());
        replica.setQuantidade(this.getQuantidade());
        replica.setEquipamento(this.getEquipamento());
        
        return replica;
    }
}