/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ifpe.reservesala.model.repository;

import com.ifpe.reservesala.model.entities.Sala;
import com.ifpe.reservesala.model.entities.TipoSala;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 *
 * @author Nathan
 */
public class SalaRepository {
    
    private static final List<Sala> salas;
    
    static{
        salas = new ArrayList<>();
        seedSalas(salas);
    }
    
    public static void create (Sala room){
        salas.add(room);
    }
    
    public static Sala read(int id){
        for(Sala s : salas){
            if(s.getId() == id){
                return s.selfReplicate();
            }
        }
        return null;
    }
    
    public static void update (Sala room){
        for (Sala s : salas){
            if(s.getId() == room.getId()){
                s.setNome(room.getNome());
                s.setLocalizacao(room.getLocalizacao());
                s.setTipo(room.getTipo());
                s.setCapacidade(room.getCapacidade());
            }
        }
    }
    
    public static void delete(Sala room) {
        if (room != null) {
            salas.removeIf(s -> s.getId() == room.getId());
        }
    }

    public static void delete(int id) {
        salas.removeIf(s -> s.getId() == id);
    }
    
    public static List<Sala> readAll(){
        return salas;
    }
    
    public static int getLastId(){
        List<Integer> ids = new ArrayList<>();
        
        for(Sala s : salas){
            ids.add(s.getId());
        }
        Collections.sort(ids);
        return ids.getLast()+1;
    }

    
    
    private static void seedSalas(List<Sala> room) {
    room.add(new Sala(
        1,
        "F42-101",
        "Bloco F - 1º Andar",
        40,
        TipoSala.TEORICA
    ));

    room.add(new Sala(
        2,
        "F42-102",
        "Bloco F - 1º Andar",
        35,
        TipoSala.TEORICA
    ));

    room.add(new Sala(
        3,
        "F42-LAB01",
        "Bloco F - 2º Andar",
        30,
        TipoSala.LABORATORIO
    ));

    room.add(new Sala(
        4,
        "F42-LAB02",
        "Bloco F - 2º Andar",
        25,
        TipoSala.LABORATORIO
    ));

    room.add(new Sala(
        5,
        "F42-AUD",
        "Bloco F - Térreo",
        120,
        TipoSala.AUDITORIO
    ));
}
    
}
