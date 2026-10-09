<%--
Document   : indexProfessor
Created on : 8 de out. de 2026
Author     : Nathan
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <!-- Tipografia idêntica ao Login -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Outfit:wght@500;600;700;800&display=swap" rel="stylesheet">

    <!-- Bootstrap 5 e Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    
    <!-- Seu CSS principal -->
    <link rel="stylesheet" href="./css/style.css">
</head>
<body class="d-flex flex-column min-vh-100">
    
    <c:import url="header.jsp"></c:import>
    <c:import url="ModalCadastroAula.jsp"></c:import>
    <!-- ======================= MAIN ======================= -->
    <main class="container my-5 flex-grow-1">
        <!-- Cabeçalho de Seção -->
        <div class="d-flex flex-column flex-sm-row justify-content-between align-items-sm-center mb-4 gap-2">
            <div>
                <h1 class="h3 fw-bold text-slate-900 mb-1">Aulas Agendadas</h1>
                <p class="text-muted small mb-0">Grade de espaços e reservas alocadas para suas atividades acadêmicas.</p>
            </div>
            <button type="button" 
                    class="btn btn-submit-login py-2 px-3 align-self-start align-self-sm-center"
                    data-bs-toggle="modal"
                    data-bs-target="#modalCadastroAula">
                <i class="bi bi-plus-lg me-1"></i> Nova Reserva
            </button>
        </div>
        
        <!-- Lista de Reservas (Cards) -->
        <div class="row g-3">
            <c:choose>
                <c:when test="${not empty listaAulas}">
                    <c:forEach var="reserva" items="${listaAulas}">
                        <div class="col-12 col-md-6 col-xl-4">
                            <article class="card card-reserva h-100 p-3 p-md-4">
                                <!-- Sala: Indicador Principal em Destaque -->
                                <div class="d-flex justify-content-between align-items-start mb-3">
                                    <div class="room-badge px-3 py-2 rounded-3 d-flex align-items-center gap-2">
                                        <i class="bi bi-door-open-fill fs-5 text-primary"></i>
                                        <div>
                                            <small class="text-uppercase fw-semibold d-block text-muted" style="font-size: 0.65rem; letter-spacing: 0.05em;">Espaço / Sala</small>
                                            <span class="h6 fw-bold mb-0 text-primary brand-font">
                                                <c:out value="${reserva.sala.nome}" default="${reserva.sala.numero}" />
                                            </span>
                                        </div>
                                    </div>
                                    <!-- Duração da Aula -->
                                    <span class="badge bg-light text-secondary border border-soft rounded-pill px-2.5 py-1.5 fw-medium">
                                        <i class="bi bi-hourglass-split me-1"></i>${reserva.duracao} min
                                    </span>
                                </div>

                                <!-- Informações de Horário e Professor -->
                                <div class="mb-3">
                                    <div class="d-flex align-items-center text-dark mb-1">
                                        <i class="bi bi-calendar3 me-2 text-muted"></i>
                                        <span class="fw-medium">${reserva.dataAula}</span>
                                        <span class="mx-2 text-muted-dark">&bull;</span>
                                        <i class="bi bi-clock me-1 text-muted"></i>
                                        <span>${reserva.horaAula}:00</span>
                                    </div>
                                    <div class="d-flex align-items-center text-muted small">
                                        <i class="bi bi-person me-2"></i>
                                        <span>Prof. ${reserva.profResponsavel.nome}</span>
                                    </div>
                                </div>

                                <!-- Equipamentos e Apoio -->
                                <div class="pt-3 border-top border-soft mt-auto">
                                    <span class="text-muted small fw-semibold d-block mb-1">Itens de Apoio:</span>
                                    <div class="d-flex flex-wrap gap-1">
                                        <c:forEach var="item" items="${reserva.itensApoio}">
                                            <span class="badge bg-light text-dark border border-soft py-1 px-2 rounded-2 fw-normal" style="font-size: 0.75rem;">
                                                <i class="bi bi-check2 text-success me-1"></i>${item.descricao}
                                            </span>
                                        </c:forEach>
                                        <c:if test="${empty reserva.itensApoio}">
                                            <span class="text-muted-dark small fst-italic">Nenhum equipamento adicional</span>
                                        </c:if>
                                    </div>
                                </div>
                            </article>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <!-- Estado Vazio -->
                    <div class="col-12">
                        <div class="text-center py-5 bg-white rounded-4 border border-dashed p-4">
                            <i class="bi bi-calendar-x fs-1 text-muted mb-3 d-block"></i>
                            <h5 class="fw-bold">Nenhuma reserva encontrada</h5>
                            <p class="text-muted small mb-3">Você ainda não possui horários alocados no sistema.</p>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </main>

    <c:import url="footer.jsp"></c:import>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
