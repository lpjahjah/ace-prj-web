<%@ taglib prefix="s" uri="/struts-tags" %>

<s:include value="/WEB-INF/templates/UpperBody.jsp"></s:include>

<main role="main" class="container my-4">

	<div class="d-flex justify-content-between">
		<h2>Visualização de Exame</h2>
		<div class="d-flex">
			<a href="<s:url action='update'><s:param name="id" value="%{exame.cdExame}" /></s:url>">
				<button class="btn btn-primary">
					Editar
				</button>
			</a>
			<a class="ms-3">
				<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal">
					Deletar
				</button>
			</a>
		</div>
	</div>
	
	<s:form class="mt-3">
		
		<div class="mb-3">
		    <label for="cdExame" class="form-label">Código do Exame</label>
		    <s:textfield class="form-control" id="cdExame" name="exame.cdExame" value="%{exame.cdExame}" disabled="true" readonly="true" />
		</div>
		
	    <div class="mb-3">
		    <label for="nmExame" class="form-label">Nome do Exame</label>
	    	<s:textfield class="form-control" id="nmExame" name="exame.nmExame" value="%{exame.nmExame}" disabled="true" readonly="true" />
		</div>
	    
	    <div class="mb-3 form-check">
	    	<s:checkbox class="form-check-input" id="icAtivo" name="exame.icAtivo" value="%{exame.icAtivo}" disabled="true" readonly="true" />
		    <label for="icAtivo" class="form-check-label">Ativo</label>
		</div>
	    
	    <div class="mb-3">
		    <label for="dsDetalheExame" class="form-label">Detalhes do Exame 1</label>
	    	<s:textarea class="form-control" id="dsDetalheExame" name="exame.dsDetalheExame" value="%{exame.dsDetalheExame}" rows="4" disabled="true" readonly="true" />
		</div>
	    
	    <div class="mb-3">
		    <label for="dsDetalheExame1" class="form-label">Detalhes do Exame 2</label>
	    	<s:textarea class="form-control" id="dsDetalheExame1" name="exame.dsDetalheExame1" value="%{exame.dsDetalheExame1}" rows="4" disabled="true" readonly="true" />
		</div>
		
	</s:form>
	
	<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="deleteModalLabel">Confirmar Exclusão</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					Tem certeza que deseja excluir o seguinte exame? <br>
					<strong><s:property value="%{exame.nmExame}" /></strong>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
					<a href="<s:url action='delete' ><s:param name="toDelete" value="%{exame.cdExame}" /></s:url>" class="btn btn-danger">Confirmar Exclusão</a>
				</div>
			</div>
		</div>
	</div>
</main>

<s:include value="/WEB-INF/templates/LowerBody.jsp"></s:include>