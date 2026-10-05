/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ifpe.reservesala.model.repository;

import com.ifpe.reservesala.model.entities.Professor;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Nathan
 */
public class ProfessorRepository {
    
    private static final List<Professor> professores;
    
    static{
        professores = new ArrayList<>();
        seedProfessores(professores);
    }
    
    public static void create (Professor prof){
        professores.add(prof);
    }
    
    public static Professor read (int siape){
        
        for (Professor p: professores){
            if (p.getSiape() == siape){
                return p.selfReplicate();
            }
        }
        return null;
    }
    
    public static void update(Professor prof){
        for(Professor p : professores){
            if (p.getSiape() == prof.getSiape()){
                p.setNome(prof.getNome());
                p.setSenha(prof.getSenha());
            }
        }
    }
    
    public static void delete (Professor prof){
        professores.remove(prof);
    }
    
    public static List<Professor> readAll(){
        return professores;
    }
    
    private static void seedProfessores(List<Professor> prof) {
    prof.add(new Professor(
        1048291,
        "Carlos Eduardo Silva",
        "senhaSegura#2024"
    ));

    prof.add(new Professor(
        2193840,
        "Mariana Souza Ribeiro",
        "mariana@prof99"
    ));

    prof.add(new Professor(
        1839204,
        "Roberto de Alencar",
        "r3b#Alencar!"
    ));

    prof.add(new Professor(
        2948103,
        "Fernanda Lima Mendes",
        "feL1ma_mendes"
    ));

    prof.add(new Professor(
        1572938,
        "Lucas Pereira Duarte",
        "lucasDuarte*2024"
    ));
}
}
