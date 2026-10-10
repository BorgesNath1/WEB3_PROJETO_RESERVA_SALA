<%-- 
    Document   : GerenciaCadastros
    Created on : 9 de out. de 2026, 17:13:39
    Author     : Nathan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="natborges" uri="https://portal.ifpe.edu.br/recife/tags" %>
<%@page import="java.util.List"%>

<natborges:carregaTudo/>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Outfit:wght@500;600;700;800&display=swap" rel="stylesheet">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="./css/style.css">

        <title>Gerenciamento de Recursos - ReserveSala</title>
    </head>
    <body class="d-flex flex-column min-vh-100"> 
        
        <c:import url="header.jsp"></c:import>

        <main class="container my-5 flex-grow-1">

            <nav aria-label="breadcrumb" class="mb-3">
                <ol class="breadcrumb py-1 px-0 bg-transparent mb-0 small">
                    <li class="breadcrumb-item">
                        <a href="${pageContext.request.contextPath}/ProfessorIndexController" class="text-decoration-none text-muted d-inline-flex align-items-center gap-1">
                            <i class="bi bi-house-door-fill text-primary"></i>
                            <span>Início</span>
                        </a>
                    </li>
                    <li class="breadcrumb-item">
                        <a href="${pageContext.request.contextPath}/ProfessorIndexController" class="text-decoration-none text-muted">Aulas Agendadas</a>
                    </li>
                    <li class="breadcrumb-item active text-dark fw-semibold" aria-current="page">
                        Gerenciamento de Recursos
                    </li>
                </ol>
            </nav>

            <c:if test="${not empty sessionScope.msg}">
                <div class="alert alert-info alert-dismissible fade show d-flex align-items-center gap-2 mb-4" role="alert">
                    <i class="bi bi-info-circle-fill fs-5"></i>
                    <div>${sessionScope.msg}</div>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <c:remove var="msg" scope="session"/>
            </c:if>

            <c:if test="${not empty param.sucesso}">
                <div class="alert alert-success alert-dismissible fade show d-flex align-items-center gap-2 mb-4" role="alert">
                    <i class="bi bi-check-circle-fill fs-5"></i>
                    <div>Operação realizada com sucesso!</div>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>

            <c:if test="${not empty param.erro}">
                <div class="alert alert-danger alert-dismissible fade show d-flex align-items-center gap-2 mb-4" role="alert">
                    <i class="bi bi-exclamation-triangle-fill fs-5"></i>
                    <div>Não foi possível concluir a operação. Verifique dependências ou dados preenchidos.</div>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>

            <div class="mb-5">
                <h1 class="h3 fw-bold text-slate-900 mb-1">Gerenciamento de Recursos</h1>
                <p class="text-muted small mb-0">Visualize, edite ou remova salas de aula e equipamentos de apoio cadastrados.</p>
            </div>

            <section class="mb-5">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <div class="d-flex align-items-center gap-2">
                        <div class="bg-primary bg-opacity-10 text-primary p-2 rounded-3 d-flex align-items-center justify-content-center" style="width: 36px; height: 36px;">
                            <i class="bi bi-door-open-fill fs-5"></i>
                        </div>
                        <div>
                            <h2 class="h5 fw-bold text-dark mb-0">Salas de Aula e Espaços</h2>
                            <small class="text-muted">Ambientes físicos disponíveis para reserva</small>
                        </div>
                    </div>
                    <span class="badge bg-light text-secondary border rounded-pill px-3 py-2 fw-normal">
                        Total: ${not empty salas ? salas.size() : 0}
                    </span>
                </div>

                <div class="card border-0 shadow-sm rounded-4 overflow-hidden">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead class="table-light">
                                <tr>
                                    <th class="ps-4 text-secondary small fw-semibold">ID</th>
                                    <th class="text-secondary small fw-semibold">NOME / ESPAÇO</th>
                                    <th class="text-secondary small fw-semibold">LOCALIZAÇÃO</th>
                                    <th class="text-secondary small fw-semibold">TIPO</th>
                                    <th class="text-secondary small fw-semibold">CAPACIDADE</th>
                                    <th class="text-end pe-4 text-secondary small fw-semibold">AÇÕES</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${not empty salas}">
                                        <c:forEach var="s" items="${salas}">
                                            <tr>
                                                <td class="ps-4 fw-medium text-muted">#${s.id}</td>
                                                <td>
                                                    <div class="d-flex align-items-center gap-2">
                                                        <i class="bi bi-door-closed text-primary"></i>
                                                        <span class="fw-semibold text-dark">${s.nome}</span>
                                                    </div>
                                                </td>
                                                <td><span class="badge bg-light text-dark border px-2.5 py-1">${s.localizacao}</span></td>
                                                <td><span class="badge bg-primary-subtle text-primary border border-primary-subtle">${s.tipo}</span></td>
                                                <td>${s.capacidade} assentos</td>
                                                <td class="text-end pe-4">
                                                    <button type="button" 
                                                            class="btn btn-sm btn-outline-primary rounded-pill px-3 me-1"
                                                            data-bs-toggle="modal" 
                                                            data-bs-target="#modalEditarSala"
                                                            data-id="${s.id}"
                                                            data-nome="${s.nome}"
                                                            data-localizacao="${s.localizacao}"
                                                            data-tipo="${s.tipo}"
                                                            data-capacidade="${s.capacidade}">
                                                        <i class="bi bi-pencil-square me-1"></i> Editar
                                                    </button>
                                                    <button type="button" 
                                                            class="btn btn-sm btn-outline-danger rounded-pill px-3"
                                                            data-bs-toggle="modal" 
                                                            data-bs-target="#modalExcluir"
                                                            data-id="${s.id}"
                                                            data-tipo="sala"
                                                            data-nome="${s.nome}">
                                                        <i class="bi bi-trash3 me-1"></i> Excluir
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td colspan="6" class="text-center py-4 text-muted">
                                                <i class="bi bi-door-closed fs-2 d-block mb-1 text-secondary opacity-50"></i>
                                                Nenhuma sala cadastrada no sistema.
                                            </td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>
                    </div>
                </div>
            </section>

            <section>
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <div class="d-flex align-items-center gap-2">
                        <div class="bg-success bg-opacity-10 text-success p-2 rounded-3 d-flex align-items-center justify-content-center" style="width: 36px; height: 36px;">
                            <i class="bi bi-cpu-fill fs-5"></i>
                        </div>
                        <div>
                            <h2 class="h5 fw-bold text-dark mb-0">Equipamentos de Apoio</h2>
                            <small class="text-muted">Itens e dispositivos móveis vinculáveis às aulas</small>
                        </div>
                    </div>
                    <span class="badge bg-light text-secondary border rounded-pill px-3 py-2 fw-normal">
                        Total: ${not empty equips ? equips.size() : 0}
                    </span>
                </div>

                <div class="card border-0 shadow-sm rounded-4 overflow-hidden">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead class="table-light">
                                <tr>
                                    <th class="ps-4 text-secondary small fw-semibold">ID</th>
                                    <th class="text-secondary small fw-semibold">NOME</th>
                                    <th class="text-secondary small fw-semibold">MARCA</th>
                                    <th class="text-secondary small fw-semibold">TIPO</th>
                                    <th class="text-secondary small fw-semibold">UTILIDADE</th>
                                    <th class="text-end pe-4 text-secondary small fw-semibold">AÇÕES</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${not empty equips}">
                                        <c:forEach var="equip" items="${equips}">
                                            <tr>
                                                <td class="ps-4 fw-medium text-muted">#${equip.id}</td>
                                                <td>
                                                    <div class="d-flex align-items-center gap-2">
                                                        <i class="bi bi-tools text-primary"></i>
                                                        <span class="fw-semibold text-dark">${equip.nome}</span>
                                                    </div>
                                                </td>
                                                <td><span class="badge bg-light text-secondary border px-2.5 py-1">${not empty equip.marca ? equip.marca : 'N/A'}</span></td>
                                                <td><span class="badge bg-secondary-subtle text-secondary border">${equip.tipo}</span></td>
                                                <td class="text-muted small">${not empty equip.utilidade ? equip.utilidade : '-'}</td>
                                                <td class="text-end pe-4">
                                                    <button type="button" 
                                                            class="btn btn-sm btn-outline-primary rounded-pill px-3 me-1"
                                                            data-bs-toggle="modal" 
                                                            data-bs-target="#modalEditarEquipamento"
                                                            data-id="${equip.id}"
                                                            data-nome="${equip.nome}"
                                                            data-marca="${equip.marca}"
                                                            data-tipo="${equip.tipo}"
                                                            data-utilidade="${equip.utilidade}">
                                                        <i class="bi bi-pencil-square me-1"></i> Editar
                                                    </button>
                                                    <button type="button" 
                                                            class="btn btn-sm btn-outline-danger rounded-pill px-3"
                                                            data-bs-toggle="modal" 
                                                            data-bs-target="#modalExcluir"
                                                            data-id="${equip.id}"
                                                            data-tipo="equipamento"
                                                            data-nome="${equip.nome}">
                                                        <i class="bi bi-trash3 me-1"></i> Excluir
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td colspan="6" class="text-center py-4 text-muted">
                                                <i class="bi bi-box-seam fs-2 d-block mb-1 text-secondary opacity-50"></i>
                                                Nenhum equipamento cadastrado no sistema.
                                            </td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>
                    </div>
                </div>
            </section>
        </main>

        <div class="modal fade" id="modalEditarSala" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content border-0 shadow">
                    <div class="modal-header bg-primary text-white py-3 px-4">
                        <h5 class="modal-title fw-bold">
                            <i class="bi bi-pencil-square me-2"></i>Editar Sala
                        </h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Fechar"></button>
                    </div>
                    <form action="${pageContext.request.contextPath}/ManagementController" method="post">
                        <input type="hidden" name="operacao" value="atualizarSala"/>
                        <input type="hidden" name="id" id="editSalaId"/>
                        <div class="modal-body p-4">
                            <div class="mb-3">
                                <label for="editSalaNome" class="form-label fw-semibold">Nome da Sala</label>
                                <input type="text" class="form-control" id="editSalaNome" name="nome" required>
                            </div>
                            <div class="mb-3">
                                <label for="editSalaLocalizacao" class="form-label fw-semibold">Localização</label>
                                <input type="text" class="form-control" id="editSalaLocalizacao" name="localizacao" required>
                            </div>
                            <div class="mb-3">
                                <label for="editSalaTipo" class="form-label fw-semibold">Tipo de Sala</label>
                                <select class="form-select" id="editSalaTipo" name="tipo">
                                    <option value="TEORICA">Teórica</option>
                                    <option value="LABORATORIO">Laboratório</option>
                                    <option value="AUDITORIO">Auditório</option>
                                    <option value="OFICINA">Oficina</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="editSalaCapacidade" class="form-label fw-semibold">Capacidade (Lugares)</label>
                                <input type="number" class="form-control" id="editSalaCapacidade" name="capacidade" min="1" required>
                            </div>
                        </div>
                        <div class="modal-footer border-0 px-4 pb-4 pt-0">
                            <button type="button" class="btn btn-light border" data-bs-dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn btn-primary px-4">Salvar Alterações</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="modal fade" id="modalEditarEquipamento" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content border-0 shadow">
                    <div class="modal-header bg-success text-white py-3 px-4">
                        <h5 class="modal-title fw-bold">
                            <i class="bi bi-pencil-square me-2"></i>Editar Equipamento
                        </h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Fechar"></button>
                    </div>
                    <form action="${pageContext.request.contextPath}/ManagementController" method="post">
                        <input type="hidden" name="operacao" value="atualizarEquipamento"/>
                        <input type="hidden" name="id" id="editEquipId"/>
                        <div class="modal-body p-4">
                            <div class="mb-3">
                                <label for="editEquipNome" class="form-label fw-semibold">Nome do Equipamento</label>
                                <input type="text" class="form-control" id="editEquipNome" name="nome" required>
                            </div>
                            <div class="mb-3">
                                <label for="editEquipMarca" class="form-label fw-semibold">Marca</label>
                                <input type="text" class="form-control" id="editEquipMarca" name="marca">
                            </div>
                            <div class="mb-3">
                                <label for="editEquipTipo" class="form-label fw-semibold">Tipo</label>
                                <input type="text" class="form-control" id="editEquipTipo" name="tipo">
                            </div>
                            <div class="mb-3">
                                <label for="editEquipUtilidade" class="form-label fw-semibold">Utilidade</label>
                                <textarea class="form-control" id="editEquipUtilidade" name="utilidade" rows="2"></textarea>
                            </div>
                        </div>
                        <div class="modal-footer border-0 px-4 pb-4 pt-0">
                            <button type="button" class="btn btn-light border" data-bs-dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn btn-success px-4">Salvar Alterações</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="modal fade" id="modalExcluir" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-sm">
                <div class="modal-content border-0 shadow">
                    <div class="modal-body p-4 text-center">
                        <div class="text-danger mb-3">
                            <i class="bi bi-exclamation-circle-fill display-4"></i>
                        </div>
                        <h6 class="fw-bold mb-2">Excluir Registro?</h6>
                        <p class="text-muted small mb-4">
                            Tem certeza que deseja excluir <strong id="deleteNomeItem" class="text-dark"></strong>? Esta ação não pode ser desfeita.
                        </p>
                        <form action="${pageContext.request.contextPath}/ManagementController" method="post">
                            <input type="hidden" name="operacao" id="deleteAcao"/>
                            <input type="hidden" name="id" id="deleteId"/>
                            <div class="d-flex justify-content-center gap-2">
                                <button type="button" class="btn btn-light border w-50" data-bs-dismiss="modal">Cancelar</button>
                                <button type="submit" class="btn btn-danger w-50">Excluir</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

                            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
                            <script>
                                document.addEventListener('DOMContentLoaded', function () {
                
                                    // 1. Modal Editar Sala (Com querySelector escopado ao modal)
                                    const modalEditarSala = document.getElementById('modalEditarSala');
                                    if (modalEditarSala) {
                                        modalEditarSala.addEventListener('show.bs.modal', function (event) {
                                            const button = event.relatedTarget;
                                            // Busca o campo de ID apenas DENTRO deste modal de edição
                                            modalEditarSala.querySelector('#editSalaId').value = button.getAttribute('data-id');
                                            modalEditarSala.querySelector('#editSalaNome').value = button.getAttribute('data-nome');
                                            modalEditarSala.querySelector('#editSalaLocalizacao').value = button.getAttribute('data-localizacao');
                                            modalEditarSala.querySelector('#editSalaTipo').value = button.getAttribute('data-tipo') || 'TEORICA';
                                            modalEditarSala.querySelector('#editSalaCapacidade').value = button.getAttribute('data-capacidade');
                                        });
                                    }

                                    // 2. Modal Editar Equipamento (Com querySelector escopado ao modal)
                                    const modalEditarEquipamento = document.getElementById('modalEditarEquipamento');
                                    if (modalEditarEquipamento) {
                                        modalEditarEquipamento.addEventListener('show.bs.modal', function (event) {
                                            const button = event.relatedTarget;
                                            // Busca o campo de ID apenas DENTRO deste modal de edição
                                            modalEditarEquipamento.querySelector('#editEquipId').value = button.getAttribute('data-id');
                                            modalEditarEquipamento.querySelector('#editEquipNome').value = button.getAttribute('data-nome');
                                            modalEditarEquipamento.querySelector('#editEquipMarca').value = button.getAttribute('data-marca') || '';
                                            modalEditarEquipamento.querySelector('#editEquipTipo').value = button.getAttribute('data-tipo') || '';
                                            modalEditarEquipamento.querySelector('#editEquipUtilidade').value = button.getAttribute('data-utilidade') || '';
                                        });
                                    }

                                    // 3. Modal Confirmar Exclusão (Com querySelector escopado ao modal)
                                    const modalExcluir = document.getElementById('modalExcluir');
                                    if (modalExcluir) {
                                        modalExcluir.addEventListener('show.bs.modal', function (event) {
                                            const button = event.relatedTarget;
                                            const tipo = button.getAttribute('data-tipo');

                                            // Busca o campo de ID apenas DENTRO deste modal de exclusão
                                            modalExcluir.querySelector('#deleteId').value = button.getAttribute('data-id');
                                            modalExcluir.querySelector('#deleteNomeItem').textContent = button.getAttribute('data-nome');
                                            modalExcluir.querySelector('#deleteAcao').value = (tipo === 'sala') ? 'excluirSala' : 'excluirEquipamento';
                                        });
                                    }
                                });
                            </script>

        <c:import url="footer.jsp"></c:import>
    </body>
</html>