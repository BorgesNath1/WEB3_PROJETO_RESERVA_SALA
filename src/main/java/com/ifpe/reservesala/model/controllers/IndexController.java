package com.ifpe.reservesala.model.controllers;

import com.ifpe.reservesala.model.entities.Aula;
import com.ifpe.reservesala.model.entities.Equipamento;
import com.ifpe.reservesala.model.entities.ItemEquipamento;
import com.ifpe.reservesala.model.entities.Professor;
import com.ifpe.reservesala.model.entities.Sala;
import com.ifpe.reservesala.model.entities.TipoSala;
import com.ifpe.reservesala.model.repository.AulaRepository;
import com.ifpe.reservesala.model.repository.EquipamentoRepository;
import com.ifpe.reservesala.model.repository.SalaRepository;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ProfessorIndexController", urlPatterns = {"/ProfessorIndexController"})
public class IndexController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String op = request.getParameter("operacao");

        if (op == null) {
            op = "";
        }

        switch (op) {
            case "managment":
                request.getServletContext().getRequestDispatcher("/GerenciaCadastros.jsp").forward(request, response);
                break;
            default:
                request.getServletContext().getRequestDispatcher("/indexProfessor.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String op = request.getParameter("operacao");
        if (op == null) {
            op = "";
        }

        switch (op) {
            case "cadastrarAula":
                cadastrarAula(request, response);
                break;

            case "cadastrarSala":
                cadastrarSala(request, response);
                break;

            case "cadastrarEquipamento":
                cadastrarEquipamento(request, response);
                break;

            default:
                doGet(request, response);
                break;
        }
    }

    private void cadastrarAula(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Professor professor = (Professor) request.getSession().getAttribute("professorLogado");
        if (professor == null) {
            request.getSession().setAttribute("msg", "Sessão expirada. Faça login novamente.");
            request.getServletContext().getRequestDispatcher("/LoginProfessor.jsp").forward(request, response);
            return;
        }

        String dataStr = request.getParameter("dataAula");
        String horaAula = request.getParameter("horaAula");
        String duracao = request.getParameter("duration");
        String sala = request.getParameter("salaId");

        if (sala == null || sala.isBlank() || horaAula == null || horaAula.isBlank()
                || duracao == null || duracao.isBlank() || dataStr == null || dataStr.isBlank()) {
            request.getSession().setAttribute("msg", "Preencha todos os campos obrigatórios para cadastrar a aula.");
            request.getServletContext().getRequestDispatcher("/indexProfessor.jsp").forward(request, response);
            return;
        }

        LocalDate dataAula;
        try {
            dataAula = LocalDate.parse(dataStr);
        } catch (DateTimeParseException e) {
            request.getSession().setAttribute("msg", "Formato de data inválido.");
            request.getServletContext().getRequestDispatcher("/indexProfessor.jsp").forward(request, response);
            return;
        }

        int horaIntAula;
        int duracaoInt;
        int salaIdInt;
        try {
            horaIntAula = Integer.parseInt(horaAula.trim());
            duracaoInt = Integer.parseInt(duracao.trim());
            salaIdInt = Integer.parseInt(sala.trim());
        } catch (NumberFormatException e) {
            request.getSession().setAttribute("msg", "Horário, duração ou sala inválidos.");
            request.getServletContext().getRequestDispatcher("/indexProfessor.jsp").forward(request, response);
            return;
        }

        Map<Integer, Integer> equipamentosQtd = new HashMap<>();
        String[] idsSelecionados = request.getParameterValues("itensSelecionados");

        if (idsSelecionados != null) {
            for (String idStr : idsSelecionados) {
                try {
                    int equipId = Integer.parseInt(idStr);
                    String qtdParam = request.getParameter("qtd_" + equipId);

                    int quantidade = (qtdParam != null && !qtdParam.isBlank())
                            ? Integer.parseInt(qtdParam.trim())
                            : 1;

                    equipamentosQtd.put(equipId, quantidade);
                } catch (NumberFormatException e) {
                    System.err.println("Item inválido: " + idStr);
                }
            }
        }

        List<ItemEquipamento> itemAula = new ArrayList<>();
        int idItemEquip = 1;
        for (Map.Entry<Integer, Integer> cada : equipamentosQtd.entrySet()) {
            Equipamento e = EquipamentoRepository.read(cada.getKey());
            if (e != null) {
                itemAula.add(new ItemEquipamento(idItemEquip, cada.getValue(), e));
                idItemEquip++;
            }
        }

        Sala sala1 = SalaRepository.read(salaIdInt);
        int id = AulaRepository.getLastId();

        Aula a = new Aula(id, dataAula, horaIntAula, duracaoInt, itemAula, professor, sala1);
        AulaRepository.create(a);

        request.getSession().setAttribute("msg", "Aula agendada com sucesso!");
        request.getServletContext().getRequestDispatcher("/indexProfessor.jsp").forward(request, response);
    }

    private void cadastrarSala(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nomeSala = request.getParameter("nomeSala");
        String localizacaoSala = request.getParameter("localizacaoSala");
        String tipoSalaStr = request.getParameter("tipoSala");
        String capacidadeSalaStr = request.getParameter("capacidadeSala");

        if (nomeSala == null || nomeSala.isBlank()
                || localizacaoSala == null || localizacaoSala.isBlank()
                || capacidadeSalaStr == null || capacidadeSalaStr.isBlank()) {
            request.getSession().setAttribute("msg", "Preencha todos os campos obrigatórios da sala.");
            request.getServletContext().getRequestDispatcher("/indexProfessor.jsp").forward(request, response);
            return;
        }

        int capacidade;
        try {
            capacidade = Integer.parseInt(capacidadeSalaStr.trim());
        } catch (NumberFormatException e) {
            request.getSession().setAttribute("msg", "Capacidade da sala deve ser um número válido.");
            request.getServletContext().getRequestDispatcher("/indexProfessor.jsp").forward(request, response);
            return;
        }

        TipoSala tipoSala = null;
        if (tipoSalaStr != null && !tipoSalaStr.isBlank()) {
            try {
                tipoSala = TipoSala.valueOf(tipoSalaStr.trim().toUpperCase());
            } catch (IllegalArgumentException e) {
                TipoSala[] tipos = TipoSala.values();
                if (tipos.length > 0) {
                    tipoSala = tipos[0];
                }
            }
        }

        int idSala = SalaRepository.getLastId();
        Sala novaSala = new Sala(idSala, nomeSala.trim(), localizacaoSala.trim(), capacidade, tipoSala);
        SalaRepository.create(novaSala);

        request.getSession().setAttribute("msg", "Sala cadastrada com sucesso!");
        response.sendRedirect("#");
    }

    private void cadastrarEquipamento(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nomeEquip = request.getParameter("nomeEquip");
        String marcaEquip = request.getParameter("marcaEquip");
        String tipoEquip = request.getParameter("tipoEquip");
        String utilidadeEquip = request.getParameter("utilidadeEquip");

        if (nomeEquip == null || nomeEquip.isBlank()) {
            request.getSession().setAttribute("msg", "O nome do equipamento é obrigatório.");
            request.getServletContext().getRequestDispatcher("/indexProfessor.jsp").forward(request, response);
            return;
        }

        int idEquip = EquipamentoRepository.getLastId();
        Equipamento novoEquipamento = new Equipamento(
                idEquip,
                nomeEquip.trim(),
                marcaEquip != null ? marcaEquip.trim() : "",
                tipoEquip != null ? tipoEquip.trim() : "",
                utilidadeEquip != null ? utilidadeEquip.trim() : ""
        );

        EquipamentoRepository.create(novoEquipamento);

        request.getSession().setAttribute("msg", "Equipamento cadastrado com sucesso!");
        request.getServletContext().getRequestDispatcher("/indexProfessor.jsp").forward(request, response);
    }
}