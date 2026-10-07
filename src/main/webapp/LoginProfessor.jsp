<%-- 
    Document   : LoginProfessor
    Created on : 4 de out. de 2026, 20:58:51
    Author     : Nathan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Professor</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Outfit:wght@500;600;700;800&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="./css/style.css">
    </head>
    <body>
        <c:if test="${sessionScope.ProfessorLogado ne null}">
            <script>
                location.href='indexProfessor.jsp';
            </script>
        </c:if>
        <main class="container-fluid login-container p-0">
            <div class="row g-0 min-vh-100">

                <!-- Lado Esquerdo: Branding, Informações e Experiência Docente -->
                <section class="col-lg-6 col-xl-7 d-none d-lg-flex hero-side" aria-label="Apresentação do EduReserve">
                    <!-- Topo da Coluna Visual: Logo / Instituição -->
                    <header class="d-flex align-items-center justify-content-between z-1">
                        <div class="d-flex align-items-center gap-3">
                            <div class="bg-white p-2 rounded-3 text-primary shadow-sm d-flex align-items-center justify-content-center" style="width: 46px; height: 46px;">
                                <i class="bi bi-mortarboard-fill fs-4 text-primary"></i>
                            </div>
                            <div>
                                <span class="fs-4 fw-bold tracking-tight text-white brand-font">ReserveSala</span>
                                <span class="d-block text-white-50 small fw-medium">Sistema Integrado de Espaços Acadêmicos</span>
                            </div>
                        </div>
                    </header>

                    <!-- Centro: Mensagem de Boas-vindas Docente -->
                    <div class="my-auto py-5 z-1" style="max-width: 580px;">
                        <div class="d-inline-flex align-items-center gap-2 px-3 py-1.5 rounded-pill bg-white bg-opacity-10 border border-white-25 text-warning mb-3">
                            <i class="bi bi-stars"></i>
                            <span class="small fw-semibold text-white">Espaço do Educador</span>
                        </div>
                        <h1 class="display-5 fw-bold text-white mb-3 lh-sm">
                            Gestão inteligente de salas, laboratórios e recursos.
                        </h1>
                        <p class="text-white-50 fs-6 leading-relaxed mb-4">
                            Planeje suas aulas práticas e avaliações com antecedência. Agende projetores, kits de robótica e laboratórios especializados em apenas alguns cliques.
                        </p>

                    <!-- Rodapé do Lado Visual -->
                    <footer class="d-flex align-items-center justify-content-between text-white-50 small z-1 pt-3 border-top border-white-10">
                        <div>
                            <span>&copy; 2026 Instituto Federal de Pernambuco - Campus Recife</span>
                        </div>
                    </footer>
                </section>

                <!-- Lado Direito: Formulário de Autenticação -->
                <section class="col-12 col-lg-6 col-xl-5 form-side" aria-label="Formulário de Entrada">
                    <div class="form-wrapper">

                        <!-- Logo visível em telas mobile / tablet -->
                        <div class="d-flex align-items-center gap-2 mb-4 d-lg-none">
                            <div class="bg-primary p-2 rounded-3 text-white">
                                <i class="bi bi-mortarboard-fill fs-5"></i>
                            </div>
                            <h2 class="h5 fw-bold mb-0 text-primary brand-font">ReserveSala</h2>
                        </div>

                        <div class="mb-4">
                            <h2 class="fw-bold text-slate-900 mb-1">Acesso do Professor</h2>
                            <p class="text-muted small">Informe sua matrícula SIAPE.</p>
                        </div>

                        <!-- Formulário Principal com validação Bootstrap 5 -->
                        <form id="professorLoginForm" 
                              class="needs-validation" 
                              novalidate
                              method="post"
                              action="ProfessorLogin"
                              >

                            <!-- Campo: Matrícula ou E-mail -->
                            <input type="hidden" name="operacao" value="login"/>
                            <div class="mb-3 position-relative">
                                <div class="form-floating position-relative">
                                    <i class="bi bi-person-badge input-icon-prepend"></i>
                                    <input 
                                        type="text" 
                                        class="form-control" 
                                        id="teacherId"
                                        name="siape"
                                        placeholder="12345" 
                                        required
                                        autocomplete="username"
                                        >
                                    <label for="teacherId">SIAPE</label>
                                    <div class="invalid-feedback ps-2">
                                        Por favor, informe sua matrícula SIAPE.
                                    </div>
                                </div>
                            </div>

                            <!-- Campo: Senha com Toggle de Visibilidade -->
                            <div class="mb-3 position-relative">
                                <div class="form-floating position-relative">
                                    <i class="bi bi-lock input-icon-prepend"></i>
                                    <input 
                                        type="password" 
                                        class="form-control" 
                                        id="teacherPassword" 
                                        name="senha"
                                        placeholder="Sua senha" 
                                        required
                                        minlength="6"
                                        autocomplete="current-password"
                                        >
                                    <label for="teacherPassword">Senha de Acesso</label>
                                    <button 
                                        type="button" 
                                        id="togglePasswordBtn"
                                        class="password-toggle-btn" 
                                        aria-label="Alternar exibição da senha"
                                        title="Mostrar/Ocultar senha"
                                        >
                                        <i class="bi bi-eye" id="toggleIcon"></i>
                                    </button>
                                    <div class="invalid-feedback ps-2">
                                        A senha precisa ter no mínimo 6 caracteres.
                                    </div>
                                </div>
                            </div>

                            <!-- Opções: Lembrar e Recuperar Senha -->
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="rememberMe" style="cursor: pointer;">
                                    <label class="form-check-label text-muted small user-select-none" for="rememberMe" style="cursor: pointer;">
                                        Lembrar de mim
                                    </label>
                                </div>                                
                            </div>

                            <!-- Botão de Login com Indicador de Carregamento -->
                            <button 
                                type="submit" 
                                id="submitBtn" 
                                class="btn btn-submit-login w-100 mb-3 d-flex align-items-center justify-content-center gap-2"
                                >
                                <span id="btnText">Acessar Portal</span>
                                <i class="bi bi-arrow-right" id="btnIcon"></i>
                                <div id="btnSpinner" class="spinner-border spinner-border-sm text-light d-none" role="status">
                                    <span class="visually-hidden">Validando...</span>
                                </div>
                            </button>
                            
                            <!-- Separador Institucional -->
                            <div class="divider-text"></div>
                            
                            <!-- Botão de Cadastro -->
                            
                           <!-- Banner Informativo / Dúvidas Acadêmicas -->
                            <div class="meu-alert alert alert-light border border-dashed rounded-3 p-3 d-flex align-items-start gap-2 mb-0" role="note">
                                <div class="small text-muted">
                                    <span class="fw-semibold text-dark d-block">Em caso de dúvidas</span>
                                    <p class="meu-paragrafo">contate a DGTI</p>
                                </div>
                            </div>
                           
                           <button 
                                type="submit" 
                                id="submitBtn" 
                                class="btn btn-submit-registrar w-100 mb-3 d-flex align-items-center justify-content-center gap-2"
                                >
                                <span id="btnText">Cadastre-se</span>
                                <i class="bi bi-box-arrow-in-left" id="btnIcon"></i>
                            </button>

                            <!-- Separador Institucional -->
                            <div class="divider-text"></div>

                        </form>

                    </div>
                </section>

            </div>
        </main>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            // Script do Bootstrap 5 para desativar envios de formulários se houver campos inválidos
            (() => {
              'use strict'
              const forms = document.querySelectorAll('.needs-validation')
              Array.from(forms).forEach(form => {
                form.addEventListener('submit', event => {
                  if (!form.checkValidity()) {
                    event.preventDefault()
                    event.stopPropagation()
                  }
                  form.classList.add('was-validated')
                }, false)
              })
            })()
        </script>
    </body>
</html>
