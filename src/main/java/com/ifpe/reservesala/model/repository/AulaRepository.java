/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ifpe.reservesala.model.repository;

import com.ifpe.reservesala.model.entities.Aula;
import com.ifpe.reservesala.model.entities.Equipamento;
import com.ifpe.reservesala.model.entities.ItemEquipamento;
import com.ifpe.reservesala.model.entities.Professor;
import com.ifpe.reservesala.model.entities.Sala;
import com.ifpe.reservesala.model.entities.TipoSala;
import java.time.LocalDate;
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
        seedAulas(aulas);
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
    
    public static List<Aula> readByProfessor(Professor prof){
        
        List<Aula> temp = new ArrayList<>();
        
        for(Aula a : aulas){
            if(a.getProfResponsavel().getSiape().equals(prof.getSiape())){
                temp.add(a);
            }
        }
        return temp;
    }
    
    public static void seedAulas(List<Aula> aulas) {
        // Professor principal conforme solicitado
        Professor profNathan = ProfessorRepository.read("121212");

        // Equipamentos base para montar os itens de apoio
        Equipamento projetor = new Equipamento(1, "Projetor Multimídia", "Epson", "Projetores", "Projeção");
        Equipamento notebook = new Equipamento(2, "Notebook Core i7", "Dell", "Computadores", "Apoio de Aula");
        Equipamento caixaSom = new Equipamento(3, "Caixa de Som Amplificada", "JBL", "Som", "Apoio de Aula");
        Equipamento kitArduino = new Equipamento(4, "Kit Didático Arduino Uno", "Arduíno", "Computadores", "Equipamento de Aula");
        Equipamento microfone = new Equipamento(5, "Microfone Sem Fio", "Senheiser", "Som", "Apoio de Aula");

        // Salas base
        Sala labInfo1 = new Sala(1, "Lab. de Informática 01", "Bloco B - Térreo", 45, TipoSala.LABORATORIO);
        Sala labRedes = new Sala(2, "Lab. de Redes e Sistemas", "Bloco B - 1º Andar", 40, TipoSala.LABORATORIO);
        Sala sala104 = new Sala(3, "Sala de Aula 104", "Bloco A - Térreo", 50, TipoSala.TEORICA);
        Sala sala202 = new Sala(4, "Sala de Aula 202", "Bloco A - 2º Andar", 50, TipoSala.TEORICA);
        Sala auditorio = new Sala(5, "Mini Auditório", "Bloco Central", 30, TipoSala.AUDITORIO);

        // --- Aula 1: Lab com Projetor e Caixas de Som ---
        List<ItemEquipamento> itensAula1 = new ArrayList<>();
        
            itensAula1.add(new ItemEquipamento(1, 1, projetor));
            itensAula1.add(new ItemEquipamento(2, 2, caixaSom));
        
        aulas.add(new Aula(
            1,
            LocalDate.of(2026, 10, 12),
            8,  // 08:00
            2,  // 2 horas de duração
            itensAula1,
            profNathan,
            labInfo1
        ));

        // --- Aula 2: Aula Prática com Kits Didáticos e Notebook ---
        List<ItemEquipamento> itensAula2 = new ArrayList<>();
            itensAula2.add(new ItemEquipamento(3, 10, kitArduino));
            itensAula2.add(new ItemEquipamento(4, 1, notebook));
        aulas.add(new Aula(
            2,
            LocalDate.of(2026, 10, 13),
            10, // 10:00
            2,  // 2 horas de duração
            itensAula2,
            profNathan,
            labRedes
        ));

        // --- Aula 3: Sala Teórica simples apenas com Projetor ---
        List<ItemEquipamento> itensAula3 = new ArrayList<>();
            itensAula3.add(new ItemEquipamento(5, 1, projetor));
        
        aulas.add(new Aula(
            3,
            LocalDate.of(2026, 10, 14),
            14, // 14:00
            3,  // 3 horas de duração
            itensAula3,
            profNathan,
            sala104
        ));

        // --- Aula 4: Sem itens de apoio extras cadastrados (apenas a sala) ---
        List<ItemEquipamento> itensAula4 = new ArrayList<>();
        aulas.add(new Aula(
            4,
            LocalDate.of(2026, 10, 15),
            16, // 16:00
            2,  // 2 horas de duração
            itensAula4,
            profNathan,
            sala202
        ));

        // --- Aula 5: Apresentação/Palestra no Auditório ---
        List<ItemEquipamento> itensAula5 = new ArrayList<>();
            itensAula5.add(new ItemEquipamento(6, 1, projetor));
            itensAula5.add(new ItemEquipamento(7, 2, microfone));
            itensAula5.add(new ItemEquipamento(8, 1, notebook));

        aulas.add(new Aula(
            5,
            LocalDate.of(2026, 10, 16),
            19, // 19:00 (Noturno)
            3,  // 3 horas de duração
            itensAula5,
            profNathan,
            auditorio
        ));
    }
    
}
