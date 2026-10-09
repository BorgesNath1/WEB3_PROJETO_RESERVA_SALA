/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ifpe.reservesala.model.controllers;

import com.ifpe.reservesala.model.entities.Aula;
import com.ifpe.reservesala.model.entities.Professor;
import com.ifpe.reservesala.model.repository.AulaRepository;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Nathan
 */
@WebServlet(name = "ProfessorIndexController", urlPatterns = {"/ProfessorIndexController"})
public class IndexController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
            String op = request.getParameter("operacao");
            
            if (op == null){
                op = "";
            }
            
            switch(op){
                case "login":
                    

                case "cadastrar":
                    

                default:
                    doGet(request,response);
            }
    }
    
}

