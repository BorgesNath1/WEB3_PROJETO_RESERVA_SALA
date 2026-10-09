/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ifpe.reservesala.model.controllers.jspTags;

import com.ifpe.reservesala.model.entities.Aula;
import com.ifpe.reservesala.model.entities.Equipamento;
import com.ifpe.reservesala.model.entities.Sala;
import com.ifpe.reservesala.model.repository.AulaRepository;
import com.ifpe.reservesala.model.repository.EquipamentoRepository;
import com.ifpe.reservesala.model.repository.SalaRepository;
import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.PageContext;
import jakarta.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author Nathan
 */
public class CarregarIndex extends SimpleTagSupport{
    
    @Override
    public void doTag() throws JspException, IOException{
        super.doTag();
        
        System.out.println(">>> CarregarIndex executou! Quantidade de aulas");
        
        List<Equipamento> equips = EquipamentoRepository.readAll();
        List<Sala> salas = SalaRepository.readAll();
        List<Aula> aulas = AulaRepository.readAll();
        
        
        
        getJspContext().setAttribute("equips", equips,PageContext.REQUEST_SCOPE);
        getJspContext().setAttribute("salas", salas, PageContext.REQUEST_SCOPE);
        getJspContext().setAttribute("aulas", aulas, PageContext.REQUEST_SCOPE);
        
    }
}
