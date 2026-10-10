/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ifpe.reservesala.model.repository;

import com.ifpe.reservesala.model.entities.Equipamento;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 *
 * @author Nathan
 */
public class EquipamentoRepository {
    
    private static final List<Equipamento> equipamentos;
    
    static{
        equipamentos = new ArrayList<>();
        seedEquipamentos(equipamentos);
    }
    
    public static void create (Equipamento equip){
        equipamentos.add(equip);
    }
    
    public static Equipamento read (int valor){
        
        for(Equipamento e : equipamentos){
            if (e.getId() == (valor)){
                return e.selfReplicate();
            }
        }
        return null;
    }
    
    public static void update (Equipamento equip){
        for(Equipamento e : equipamentos){
            if(e.getId() == equip.getId()){
                e.setMarca(equip.getMarca());
                e.setNome(equip.getNome());
                e.setTipo(equip.getTipo());
                e.setUtilidade(equip.getUtilidade());
            }
        }
    }
       
    public static void delete(Equipamento equip) {
        if (equip != null) {
            equipamentos.removeIf(e -> e.getId() == equip.getId());
        }
    }

    public static void delete(int id) {
        equipamentos.removeIf(e -> e.getId() == id);
    }
    
    public static List<Equipamento> readAll(){
        return equipamentos;
    }
    
    public static int getLastId(){
        List<Integer> ids = new ArrayList<>();
        
        for(Equipamento a : equipamentos){
            ids.add(a.getId());
        }
        Collections.sort(ids);
        return ids.getLast()+1;
    }

    
    
    private static void seedEquipamentos(List<Equipamento> equips) {
        equips.add(new Equipamento(
            1,
            "Projetor Multimídia",
            "Epson",
            "Audiovisual",
            "Projeção de slides, apresentações e vídeos durante as aulas"
        ));

        equips.add(new Equipamento(
            2,
            "Caixa de Som Amplificada",
            "JBL",
            "Áudio",
            "Amplificação de voz do professor e reprodução de conteúdos em áudio/vídeo"
        ));

        equips.add(new Equipamento(
            3,
            "Notebook Docente",
            "Dell",
            "Informática",
            "Acesso aos materiais didáticos e controle da apresentação da aula"
        ));

        equips.add(new Equipamento(
            4,
            "Microfone Sem Fio",
            "Shure",
            "Áudio",
            "Captação da fala do docente para auditórios e salas amplas"
        ));

        equips.add(new Equipamento(
            5,
            "Passador de Slides a Laser",
            "Logitech",
            "Acessório",
            "Avançar/retroceder apresentações à distância com apontador laser"
        ));
    }
}
