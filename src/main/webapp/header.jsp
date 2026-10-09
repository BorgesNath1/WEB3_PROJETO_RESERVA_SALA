<%-- 
    Document   : header
    Created on : 8 de out. de 2026, 20:59:03
    Author     : Nathan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- ======================= HEADER ======================= -->
    
    <c:if test="${sessionScope.professorLogado eq null}">
        <script>
            location.href="LoginProfessor.jsp";
        </script>
    </c:if>
    
        <header class="app-navbar text-white py-3 shadow-sm">
            <div class="container d-flex align-items-center justify-content-between">

                <!-- Lado Esquerdo: Marca + Botões de Ação Rápida -->
                <div class="d-flex align-items-center gap-3 gap-lg-4">
                    <!-- Marca -->
                    <div class="d-flex align-items-center gap-3">
                        <div class="bg-white p-2 rounded-3 text-primary shadow-sm d-flex align-items-center justify-content-center" style="width: 40px; height: 40px;">
                            <i class="bi bi-mortarboard-fill fs-5 text-primary"></i>
                        </div>
                        <div>
                            <span class="fs-5 fw-bold brand-font tracking-tight text-white d-block lh-1">ReserveSala</span>
                            <span class="text-white-50 small" style="font-size: 0.75rem;">Portal Docente</span>
                        </div>
                    </div>

                    <!-- Divisor Vertical Sutil -->
                    <div class="vr bg-white opacity-25 d-none d-sm-block" style="height: 28px;"></div>

                    <!-- Botões de Ação (Alinhados à esquerda, contidos antes da metade da tela) -->
                    <div class="d-flex align-items-center gap-2">
                        <!-- Botão + Sala -->
                        <button type="button" 
                                class="btn btn-sm btn-light bg-white bg-opacity-10 text-white border-0 shadow-none rounded-pill px-3 py-1.5 fw-medium d-flex align-items-center gap-1 hover-glass"
                                data-bs-toggle="modal" 
                                data-bs-target="#modalCadastroSala">
                            <i class="bi bi-plus-lg text-white-50"></i>
                            <span>Sala</span>
                        </button>

                        <!-- Botão + Equipamentos -->
                        <button type="button" 
                                class="btn btn-sm btn-light bg-white bg-opacity-10 text-white border-0 shadow-none rounded-pill px-3 py-1.5 fw-medium d-flex align-items-center gap-1 hover-glass"
                                data-bs-toggle="modal" 
                                data-bs-target="#modalCadastroEquipamento">
                            <i class="bi bi-plus-lg text-white-50"></i>
                            <span>Equipamentos</span>
                        </button>
                        
                        <!-- Botão + Equipamentos -->
                        <a href="#"
                                class="btn btn-sm btn-light bg-white bg-opacity-10 text-white border-0 shadow-none rounded-pill px-3 py-1.5 fw-medium d-flex align-items-center gap-1 hover-glass"
                                >
                            <i class="bi bi-archive-fill text-white-50"></i>
                            <span> Gerenciamento de Recursos</span>
                        </a>
                    </div>
                </div>

                <!-- Lado Direito: Perfil / Logout -->
                <div class="d-flex align-items-center gap-3">
                    <span class="small d-none d-md-inline text-white-50">
                        Olá, <strong class="text-white"><c:out value="${'Professor(a) '.concat(sessionScope.professorLogado.nome)}" /></strong>
                    </span>
                        <a href="logout.jsp" id= "logout" class="btn btn-sm btn-outline-light rounded-pill px-3 py-1">
                            <i class="bi bi-box-arrow-right me-1"></i> Sair
                        </a>
                </div>
            </div>
        </header>