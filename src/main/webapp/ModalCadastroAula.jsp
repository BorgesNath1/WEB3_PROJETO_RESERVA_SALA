<%-- 
    Document   : ModalCadastroAula
    Created on : 8 de out. de 2026, 22:46:43
    Author     : Nathan
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Modal de Cadastro de Aula -->
<div class="modal fade" id="modalCadastroAula" tabindex="-1" aria-labelledby="modalCadastroAulaLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg modal-dialog-scrollable">
        <div class="modal-content modal-cadastro-content border-0 shadow">

            <!-- Cabeçalho -->
            <div class="modal-header modal-cadastro-header bg-primary text-white border-0 py-3 px-4">
                <div class="d-flex align-items-center gap-3">
                    <div class="bg-white bg-opacity-25 p-2 rounded-3 d-flex align-items-center justify-content-center">
                        <i class="bi bi-calendar-plus-fill text-white fs-5"></i>
                    </div>
                    <div>
                        <h5 class="modal-title text-white fw-bold mb-0 brand-font" id="modalCadastroAulaLabel">
                            Agendar Nova Aula
                        </h5>
                        <small class="text-white-50">Preencha os dados para reservar a sala e itens de apoio</small>
                    </div>
                </div>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Fechar"></button>
            </div>

            <!-- Corpo com o Formulário -->
            <div class="modal-body p-4">
                <form id="professorRegistroForm" class="needs-validation" novalidate method="post" action="CadastrarAulaServlet">
                    <input type="hidden" name="operacao" value="cadastrar"/>

                    <!-- Seção 1: Detalhes da Aula e Espaço -->
                    <h6 class="section-title-modal text-primary fw-bold mb-3 border-bottom pb-2">
                        <i class="bi bi-calendar3 me-2"></i>Detalhes da Aula
                    </h6>

                    <div class="row g-3 mb-4">
                        <!-- Seleção da Sala -->
                        <div class="col-12">
                            <label for="selectSala" class="form-label fw-semibold text-dark mb-1">
                                <i class="bi bi-door-open-fill text-primary me-1"></i> Espaço / Sala
                            </label>
                            <select class="form-select shadow-sm" id="selectSala" name="salaId" required>
                                <option value="" disabled selected>Selecione um ambiente disponível...</option>
                                <c:forEach var="sala" items="${salas}">
                                    <option value="${sala.id}">
                                        ${sala.nome} &bull; Bloco ${sala.localizacao} (${sala.capacidade} lugares)
                                    </option>
                                </c:forEach>
                            </select>
                            <div class="invalid-feedback">Por favor, selecione uma sala.</div>
                        </div>

                        <!-- Data da Aula -->
                        <div class="col-md-4">
                            <label for="dataAula" class="form-label fw-semibold text-dark mb-1">
                                <i class="bi bi-calendar-event text-primary me-1"></i> Data da Aula
                            </label>
                            <input type="date" class="form-control shadow-sm" id="dataAula" name="dataAula" required>
                            <div class="invalid-feedback">Informe a data.</div>
                        </div>

                        <!-- Hora de Início -->
                        <div class="col-md-4">
                            <label for="horaAula" class="form-label fw-semibold text-dark mb-1">
                                <i class="bi bi-clock text-primary me-1"></i> Hora de Início
                            </label>
                            <div class="input-group shadow-sm">
                                <input type="number" class="form-control" id="horaAula" name="hora" min="6" max="23" placeholder="Ex: 8" required>
                                <span class="input-group-text bg-light">:00</span>
                            </div>
                            <div class="invalid-feedback">Informe o horário.</div>
                        </div>

                        <!-- Duração -->
                        <div class="col-md-4">
                            <label for="duracao" class="form-label fw-semibold text-dark mb-1">
                                <i class="bi bi-hourglass-split text-primary me-1"></i> Duração
                            </label>
                            <div class="input-group shadow-sm">
                                <input type="number" class="form-control" id="duracao" name="duration" min="30" step="10" placeholder="Ex: 100" required>
                                <span class="input-group-text bg-light">min</span>
                            </div>
                            <div class="invalid-feedback">Informe a duração em minutos.</div>
                        </div>
                    </div>

                    <!-- Seção 2: Itens de Apoio e Quantidades -->
                    <h6 class="section-title-modal text-primary fw-bold mb-3 border-bottom pb-2">
                        <i class="bi bi-tools me-2"></i>Itens de Apoio
                    </h6>

                    <div class="mb-3">
                        <label class="form-label d-flex justify-content-between align-items-center text-muted small mb-2">
                            <span>Marque os equipamentos necessários para a atividade:</span>
                            <span class="badge bg-light text-secondary border">Opcional</span>
                        </label>

                        <div class="list-group shadow-sm rounded-3 border" style="max-height: 220px; overflow-y: auto;">
                            <c:choose>
                                <c:when test="${not empty equips}">
                                    <c:forEach var="item" items="${equips}">
                                        <div class="list-group-item d-flex align-items-center justify-content-between py-2 px-3">
                                            <div class="form-check d-flex align-items-center gap-2 mb-0">
                                                <input class="form-check-input item-check" 
                                                       type="checkbox" 
                                                       name="itensSelecionados" 
                                                       value="${item.id}" 
                                                       id="check_${item.id}"
                                                       onchange="toggleQuantidade(this, '${item.id}')">
                                                <label class="form-check-label user-select-none" for="check_${item.id}">
                                                    ${item.nome} ${item.marca}
                                                </label>
                                            </div>
                                            <div class="d-flex align-items-center gap-1" style="width: 110px;">
                                                <span class="small text-muted">Qtd:</span>
                                                <input type="number" 
                                                       class="form-control form-control-sm text-center" 
                                                       id="qtd_${item.id}" 
                                                       name="qtd_${item.id}" 
                                                       value="1" 
                                                       min="1" 
                                                       max="50" 
                                                       disabled>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <div class="p-3 text-center text-muted small">
                                        Nenhum equipamento cadastrado no sistema.
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>

                    <!-- Nota informativa -->
                    <div class="alert alert-light border border-dashed rounded-3 p-2.5 d-flex align-items-center gap-2 mb-0 mt-3" role="note">
                        <i class="bi bi-info-circle text-primary fs-5"></i>
                        <span class="small text-muted">
                            As reservas ficam sujeitas à disponibilidade de sala e equipamentos no horário escolhido.
                        </span>
                    </div>
                </form>
            </div>

            <!-- Rodapé do Modal -->
            <div class="modal-footer border-0 px-4 pb-4 pt-0 d-flex flex-column flex-sm-row gap-2">
                <button type="button" class="btn btn-light border w-100 w-sm-auto" data-bs-dismiss="modal">
                    Cancelar
                </button>
                <button type="submit" form="professorRegistroForm" id="btnCadastrar" class="btn btn-primary px-4 flex-grow-1 d-flex align-items-center justify-content-center gap-2">
                    <span>Confirmar Reserva</span>
                    <i class="bi bi-check2-circle"></i>
                </button>
            </div>

        </div>
    </div>
</div>

<!-- Script de controle de quantidade -->
<script>
function toggleQuantidade(checkbox, itemId) {
    const inputQtd = document.getElementById('qtd_' + itemId);
    if (!inputQtd) return;
    
    if (checkbox.checked) {
        inputQtd.disabled = false;
        inputQtd.focus();
    } else {
        inputQtd.disabled = true;
        inputQtd.value = 1;
    }
}
</script>