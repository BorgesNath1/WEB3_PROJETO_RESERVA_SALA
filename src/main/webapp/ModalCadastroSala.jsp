<!-- Modal Cadastrar Sala -->
<div class="modal fade" id="modalCadastroSala" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content border-0 shadow">
            <div class="modal-header bg-primary text-white py-3 px-4">
                <h5 class="modal-title fw-bold"><i class="bi bi-pencil-square me-2"></i>Cadastrar Sala</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Fechar"></button>
            </div>
            <form action="${pageContext.request.contextPath}/ProfessorIndexController" method="post">
                <input type="hidden" name="operacao" value="cadastrarSala"/>
                <input type="hidden" name="id" id="editSalaId"/>

                <div class="modal-body p-4">
                    <div class="mb-3">
                        <label for="editSalaNome" class="form-label fw-semibold">Nome da Sala</label>
                        <input type="text" class="form-control" id="editSalaNome" name="nomeSala" required>
                    </div>
                    <div class="mb-3">
                        <label for="editSalaLocalizacao" class="form-label fw-semibold">Localização</label>
                        <input type="text" class="form-control" id="editSalaLocalizacao" name="localizacaoSala" required>
                    </div>
                    <div class="mb-3">
                        <label for="editSalaTipo" class="form-label fw-semibold">Tipo de Sala</label>
                        <input type="text" class="form-control" id="editSalaTipo" name="tipoSala" placeholder="Ex: LABORATORIO, TEORICA">
                    </div>
                    <div class="mb-3">
                        <label for="editSalaCapacidade" class="form-label fw-semibold">Capacidade (Lugares)</label>
                        <input type="number" class="form-control" id="editSalaCapacidade" name="capacidadeSala" min="1" required>
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