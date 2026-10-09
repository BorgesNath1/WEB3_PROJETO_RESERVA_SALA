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

            <!-- Perfil / Logout -->
            <div class="d-flex align-items-center gap-3">
                <span class="small d-none d-md-inline text-white-50">
                    Olá, <strong class="text-white"><c:out value="${'Professor(a) '.concat(sessionScope.professorLogado.nome)}" /></strong>
                </span>
                <a href="LogoutServlet" class="btn btn-sm btn-outline-light rounded-pill px-3 py-1">
                    <i class="bi bi-box-arrow-right me-1"></i> Sair
                </a>
            </div>
        </div>
    </header>
