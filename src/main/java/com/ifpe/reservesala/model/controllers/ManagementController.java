/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ifpe.reservesala.model.controllers;

import com.ifpe.reservesala.model.entities.Equipamento;
import com.ifpe.reservesala.model.entities.Professor;
import com.ifpe.reservesala.model.entities.Sala;
import com.ifpe.reservesala.model.entities.TipoSala;
import com.ifpe.reservesala.model.repository.EquipamentoRepository;
import com.ifpe.reservesala.model.repository.SalaRepository;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Nathan
 */
@WebServlet(name = "ManagementController", urlPatterns = {"/ManagementController"})
public class ManagementController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Professor professor = (Professor) request.getSession().getAttribute("professorLogado");
        if (professor == null) {
            request.getSession().setAttribute("msg", "Sessão expirada. Faça login novamente.");
            request.getServletContext().getRequestDispatcher("/LoginProfessor.jsp").forward(request, response);
            return;
        }

        sincronizarListas(request);
        request.getServletContext().getRequestDispatcher("/GerenciaCadastros.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        Professor professor = (Professor) request.getSession().getAttribute("professorLogado");
        if (professor == null) {
            request.getSession().setAttribute("msg", "Sessão expirada. Faça login novamente.");
            request.getServletContext().getRequestDispatcher("/LoginProfessor.jsp").forward(request, response);
            return;
        }

        String op = request.getParameter("operacao");
        if (op == null) {
            op = "";
        }

        switch (op) {
            case "atualizarSala":
                atualizarSala(request, response);
                break;

            case "excluirSala":
                excluirSala(request, response);
                break;

            case "atualizarEquipamento":
                atualizarEquipamento(request, response);
                break;

            case "excluirEquipamento":
                excluirEquipamento(request, response);
                break;

            default:
                doGet(request, response);
                break;
        }
    }

    private void atualizarSala(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("id");
        String nome = request.getParameter("nome");
        String localizacao = request.getParameter("localizacao");
        String tipoStr = request.getParameter("tipo");
        String capacidadeStr = request.getParameter("capacidade");

        if (idStr == null || idStr.isBlank()
                || nome == null || nome.isBlank()
                || localizacao == null || localizacao.isBlank()
                || capacidadeStr == null || capacidadeStr.isBlank()) {
            request.getSession().setAttribute("msg", "Preencha todos os campos obrigatórios da sala.");
            response.sendRedirect(request.getContextPath() + "/ManagementController");
            return;
        }

        int id;
        int capacidade;
        try {
            id = Integer.parseInt(idStr.trim());
            capacidade = Integer.parseInt(capacidadeStr.trim());
        } catch (NumberFormatException e) {
            request.getSession().setAttribute("msg", "Identificador ou capacidade da sala inválidos.");
            response.sendRedirect(request.getContextPath() + "/ManagementController");
            return;
        }

        TipoSala tipoSala = null;
        if (tipoStr != null && !tipoStr.isBlank()) {
            try {
                tipoSala = TipoSala.valueOf(tipoStr.trim().toUpperCase());
            } catch (IllegalArgumentException e) {
                TipoSala[] tipos = TipoSala.values();
                if (tipos.length > 0) {
                    tipoSala = tipos[0];
                }
            }
        }

        Sala sala = new Sala(id, nome.trim(), localizacao.trim(), capacidade, tipoSala);
        SalaRepository.update(sala);

        sincronizarListas(request);
        request.getSession().setAttribute("msg", "Sala atualizada com sucesso!");
        response.sendRedirect(request.getContextPath() + "/ManagementController");
    }

    private void excluirSala(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("id");
        if (idStr == null || idStr.isBlank()) {
            request.getSession().setAttribute("msg", "Código da sala não informado para exclusão.");
            response.sendRedirect(request.getContextPath() + "/ManagementController");
            return;
        }

        try {
            int id = Integer.parseInt(idStr.trim());
            SalaRepository.delete(id);
        } catch (NumberFormatException e) {
            request.getSession().setAttribute("msg", "Identificador inválido para exclusão de sala.");
            response.sendRedirect(request.getContextPath() + "/ManagementController");
            return;
        }

        sincronizarListas(request);
        request.getSession().setAttribute("msg", "Sala excluída com sucesso!");
        response.sendRedirect(request.getContextPath() + "/ManagementController");
    }

    private void atualizarEquipamento(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("id");
        String nome = request.getParameter("nome");
        String marca = request.getParameter("marca");
        String tipo = request.getParameter("tipo");
        String utilidade = request.getParameter("utilidade");

        if (idStr == null || idStr.isBlank() || nome == null || nome.isBlank()) {
            request.getSession().setAttribute("msg", "O identificador e o nome do equipamento são obrigatórios.");
            response.sendRedirect(request.getContextPath() + "/ManagementController");
            return;
        }

        int id;
        try {
            id = Integer.parseInt(idStr.trim());
        } catch (NumberFormatException e) {
            request.getSession().setAttribute("msg", "Identificador inválido para atualização do equipamento.");
            response.sendRedirect(request.getContextPath() + "/ManagementController");
            return;
        }

        Equipamento equip = new Equipamento(
                id,
                nome.trim(),
                marca != null ? marca.trim() : "",
                tipo != null ? tipo.trim() : "",
                utilidade != null ? utilidade.trim() : ""
        );
        EquipamentoRepository.update(equip);

        sincronizarListas(request);
        request.getSession().setAttribute("msg", "Equipamento atualizado com sucesso!");
        response.sendRedirect(request.getContextPath() + "/ManagementController");
    }

    private void excluirEquipamento(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("id");
        if (idStr == null || idStr.isBlank()) {
            request.getSession().setAttribute("msg", "Código do equipamento não informado para exclusão.");
            response.sendRedirect(request.getContextPath() + "/ManagementController");
            return;
        }

        try {
            int id = Integer.parseInt(idStr.trim());
            EquipamentoRepository.delete(id);
        } catch (NumberFormatException e) {
            request.getSession().setAttribute("msg", "Identificador inválido para exclusão do equipamento.");
            response.sendRedirect(request.getContextPath() + "/ManagementController");
            return;
        }

        sincronizarListas(request);
        request.getSession().setAttribute("msg", "Equipamento excluído com sucesso!");
        response.sendRedirect(request.getContextPath() + "/ManagementController");
    }

    private void sincronizarListas(HttpServletRequest request) {
        List<Sala> salas = SalaRepository.readAll();
        List<Equipamento> equips = EquipamentoRepository.readAll();

        request.setAttribute("salas", salas);
        request.setAttribute("equips", equips);

        request.getSession().setAttribute("salas", salas);
        request.getSession().setAttribute("equips", equips);
    }
}