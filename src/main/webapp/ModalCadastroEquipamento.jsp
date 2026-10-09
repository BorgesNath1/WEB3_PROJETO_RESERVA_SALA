<!-- Modal Cadastrar Equipamento -->
<div class="modal fade" id="modalCadastroEquipamento" tabindex="-1" aria-hidden="true">
    <div class="modal-cadastro-header modal-dialog modal-dialog-centered">
        <div class="modal-content border-0 shadow">
            <div class="modal-header bg-primary text-white py-3 px-4">
                <h5 class="modal-title fw-bold"><i class="bi bi-pencil-square me-2"></i>Cadastrar Equipamento</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Fechar"></button>
            </div>
            <form action="CadastrarEquipamento" method="post">
                <input type="hidden" name="acao" value="atualizarEquipamento"/>
                <input type="hidden" name="id" id="editEquipId"/>

                <div class="modal-body p-4">
                    <div class="mb-3">
                        <label for="editEquipNome" class="form-label fw-semibold">Nome do Equipamento</label>
                        <input type="text" class="form-control" id="editEquipNome" name="nomeEquip" required>
                    </div>
                    <div class="mb-3">
                        <label for="editEquipMarca" class="form-label fw-semibold">Marca</label>
                        <input type="text" class="form-control" id="editEquipMarca" name="marcaEquip">
                    </div>
                    <div class="mb-3">
                        <label for="editEquipTipo" class="form-label fw-semibold">Tipo</label>
                        <input type="text" class="form-control" id="editEquipTipo" name="tipoEquip">
                    </div>
                    <div class="mb-3">
                        <label for="editEquipUtilidade" class="form-label fw-semibold">Utilidade</label>
                        <textarea class="form-control" id="editEquipUtilidade" name="utilidadeEquip" rows="2"></textarea>
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