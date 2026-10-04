/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ifpe.reservesala.model.repository;

import com.ifpe.reservesala.model.entities.Aula;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Nathan
 */
public class AulaRepository {
    
    private static List<Aula> aulas;
    
    static{
        aulas = new ArrayList<>();
        
    }
    
    public static void create (Aula aula){
        aulas.add(aula);
    }
    
    public static Aula read (int id){
        
        for(Aula a : aulas){
            if (a.getId() == id){
                return a.selfReplicate();
            }
        }
        
        return null;
    }
    
    public static void update (Aula aula){
        
        for (Aula a : aulas){
            if (a.getId() == aula.getId()){
                a.setDataAula(aula.getDataAula());
                a.setHoraAula(aula.getHoraAula());
                a.setDuracao(aula.getDuracao());
                a.setItensApoio(aula.getItensApoio());
                a.setProfResponsavel(aula.getProfResponsavel());
                a.setSala(aula.getSala());
            }
        }
    }
    
    public static void delete (Aula aula){
        aulas.remove(aula);
    }
    
    public static List<Aula> readAll(){
        return aulas;
    }
    
}
