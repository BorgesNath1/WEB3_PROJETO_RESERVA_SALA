/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ifpe.reservesala.model.entities;

/**
 *
 * @author Nathan
 */
public class Professor {
    private String siape;
    private String nome;
    private String senha;
    
    public Professor (){
        
    }
    
    public Professor(String siapelocal, String nomelocal, String senhalocal ){
        this.setSiape(siapelocal);
        this.setNome(nomelocal);
        this.setSenha(senhalocal);
    }
    
    public String getSiape() {
        return siape;
    }

    public final void setSiape(String siape) {
        this.siape = siape;
    }

    public String getNome() {
        return nome;
    }

    public final void setNome(String nome) {
        this.nome = nome;
    }

    public String getSenha() {
        return senha;
    }

    public final void setSenha(String senha) {
        this.senha = senha;
    }
    
    public final Professor selfReplicate(){
        Professor replica = new Professor();
        
        replica.setSiape(this.getSiape());
        replica.setNome(this.getNome());
        replica.setSenha(this.getSenha());
        
        return replica;
    }
     
}
