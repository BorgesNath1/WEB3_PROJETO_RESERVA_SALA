<%-- 
    Document   : ModalCadastroAula
    Created on : 8 de out. de 2026, 22:46:43
    Author     : Nathan
--%>
<!--        ALTERAR TODOS OS CAMPOS PARA CADASTRAR AULA -->
        <!-- Modal de Cadastro de Aula -->
        <div class="modal fade" id="modalCadastroAula" tabindex="-1" aria-labelledby="modalCadastroProfessorLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg modal-dialog-scrollable">
                <div class="modal-content modal-cadastro-content">

                    <!-- Cabeçalho -->
                    <div class="modal-header modal-cadastro-header border-0">
                        <div class="d-flex align-items-center gap-3">
                            <div class="bg-white bg-opacity-10 p-2 rounded-3 d-flex align-items-center justify-content-center modal-header-icon">
                                <i class="bi bi-person-plus-fill text-white fs-5"></i>
                            </div>
                            <div>
                                <h5 class="modal-title text-white fw-bold mb-0 brand-font" id="modalCadastroProfessorLabel">
                                    Cadastro do Professor
                                </h5>
                                <small class="text-white-50">Preencha os dados para solicitar acesso ao ReserveSala</small>
                            </div>
                        </div>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Fechar"></button>
                    </div>

                    <!-- Corpo -->
                    <div class="modal-body p-4">
                        <form id="professorRegistroForm" class="needs-validation" novalidate method="post" action="ProfessorLogin">
                            <input type="hidden" name="operacao" value="cadastrar"/>

                            <!-- Dados Pessoais -->
                            <h6 class="section-title-modal mb-3">
                                <i class="bi bi-person-vcard me-2"></i>Dados Pessoais
                            </h6>

                            <div class="row g-3 mb-3">
                                <div class="col-md-12">
                                    <div class="col-md-12 mb-3">
                                        <div class="form-floating position-relative">
                                            <i class="bi bi-person input-icon-prepend"></i>
                                            <input type="text" class="form-control" id="cadNome" name="nome" placeholder="Nome completo" required>
                                            <label for="cadNome">Nome Completo</label>
                                            <div class="invalid-feedback ps-2">Informe seu nome completo.</div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-floating position-relative">
                                            <i class="bi bi-envelope input-icon-prepend"></i>
                                            <input type="email" class="form-control" id="cadEmail" name="email" placeholder="E-mail institucional" required>
                                            <label for="cadEmail">E-mail Institucional</label>
                                            <div class="invalid-feedback ps-2">Informe um e-mail válido.</div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Credenciais -->
                            <h6 class="section-title-modal mb-3">
                                <i class="bi bi-shield-lock me-2"></i>Credenciais de Acesso
                            </h6>

                            <div class="row g-3 mb-3">
                                <div class="col-md-12">
                                    <div class="col-md-12 mb-3">
                                        <div class="form-floating position-relative">
                                            <i class="bi bi-person-badge input-icon-prepend"></i>
                                            <input type="text" class="form-control" id="cadSiape" name="siape" placeholder="SIAPE" required pattern="[0-9]{6,8}">
                                            <label for="cadSiape">SIAPE</label>
                                            <div class="invalid-feedback ps-2">Informe um SIAPE válido (6 a 8 dígitos).</div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-floating position-relative">
                                            <i class="bi bi-lock input-icon-prepend"></i>
                                            <input type="password" class="form-control" id="cadSenha" name="senha" placeholder="Senha" required minlength="6">
                                            <label for="cadSenha">Senha</label>
                                            <button type="button" class="password-toggle-btn" data-toggle-target="cadSenha" aria-label="Mostrar senha">
                                                <i class="bi bi-eye"></i>
                                            </button>
                                            <div class="invalid-feedback ps-2">Mínimo de 6 caracteres.</div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Alerta de dúvidas -->
                            <div class="alert alert-light border border-dashed rounded-3 p-3 d-flex align-items-start gap-2 mb-0 mt-3" role="note">
                                <i class="bi bi-info-circle text-primary"></i>
                                <div class="small text-muted">
                                    <span class="fw-semibold text-dark d-block">Em caso de dúvidas</span>
                                    contate a DGTI.
                                </div>
                            </div>
                        </form>
                    </div>

                    <!-- Rodapé -->
                    <div class="modal-footer border-0 px-4 pb-4 pt-0 d-flex flex-column flex-sm-row gap-2">
                        <button type="button" class="btn btn-light border w-100 w-sm-auto" data-bs-dismiss="modal">
                            Cancelar
                        </button>
                        <button type="submit" form="professorRegistroForm" id="btnCadastrar" class="btn btn-submit-registrar flex-grow-1 d-flex align-items-center justify-content-center gap-2">
                            <span id="btnCadText">Finalizar Cadastro</span>
                            <i class="bi bi-check2-circle" id="btnCadIcon"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
       