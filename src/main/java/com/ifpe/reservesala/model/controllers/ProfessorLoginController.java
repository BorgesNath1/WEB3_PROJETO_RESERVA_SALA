/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ifpe.reservesala.model.controllers;

import com.ifpe.reservesala.model.entities.Professor;
import com.ifpe.reservesala.model.repository.ProfessorRepository;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Nathan
 */
@WebServlet(name = "ProfessorLogin", urlPatterns = {"/ProfessorLogin"})
public class ProfessorLoginController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
            String siape = request.getParameter("siape");
            String nome = request.getParameter("nome");
            String senha = request.getParameter("senha");
            
            String op = request.getParameter("operacao");
            
            if (op == null){
                op = "";
            }
            
            switch(op){
                case "login":
                    Professor p = ProfessorRepository.read(siape);
                    
                    if(p != null && p.getSenha().equals(senha)){
                        request.getSession().setAttribute("ProfessorLogado", p);
                        response.sendRedirect("indexProfessor.jsp");
                        return;
                    } else {
                        request.setAttribute("msg", "Login inválido, credenciais de siape ou senha estão incorretos.");
                        request.getServletContext().getRequestDispatcher("LoginProfessor.jsp").forward(request, response);
                        return;
                    }
                    
                case "register":
                    Professor pnew = new Professor(siape,nome,senha);
                    ProfessorRepository.create(pnew);
                    
                    request.setAttribute("msg", "Cadastro realizado com sucesso... Faça Login");
                    response.sendRedirect("LoginProfessor.jsp");
                    
                default:
                    response.sendRedirect("LoginProfessor.jsp");
            }
            
    }

}
