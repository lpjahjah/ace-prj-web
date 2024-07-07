<%@ taglib prefix="s" uri="/struts-tags" %>

<s:include value="/WEB-INF/templates/UpperBody.jsp"></s:include>

<main role="main" class="container my-4">

	<div class="d-flex justify-content-between">
		<h2>Visualização de Usuário</h2>
		<div class="d-flex">
			<a href="<s:url action='update'><s:param name="id" value="%{usuario.cdUsuario}" /></s:url>">
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
		    <label for="cdUsuario" class="form-label">Código do Usuário</label>
		    <s:textfield class="form-control" id="cdUsuario" name="usuario.cdUsuario" value="%{usuario.cdUsuario}" disabled="true" readonly="true" />
		</div>
		
	    <div class="mb-3">
		    <label for="nmLogin" class="form-label">Login</label>
	    	<s:textfield class="form-control" id="nmLogin" name="usuario.nmLogin" value="%{usuario.nmLogin}" disabled="true" readonly="true" />
		</div>
	    
	    <div class="mb-3">
		    <label for="qtTempoInatividade" class="form-label">Tempo de Inatividade (em minutos)</label>
	    	<s:textfield type="number" class="form-control" id="qtTempoInatividade" name="usuario.qtTempoInatividade" value="%{usuario.qtTempoInatividade}" disabled="true" readonly="true" />
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
					Tem certeza que deseja excluir o seguinte usuário? <br>
					<strong><s:property value="%{usuario.nmLogin}" /></strong>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
					<a href="<s:url action='delete' ><s:param name="toDelete" value="%{usuario.cdUsuario}" /></s:url>" class="btn btn-danger">Confirmar Exclusão</a>
				</div>
			</div>
		</div>
	</div>
</main>

<s:include value="/WEB-INF/templates/LowerBody.jsp"></s:include>