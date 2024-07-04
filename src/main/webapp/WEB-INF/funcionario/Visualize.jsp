<%@ taglib prefix="s" uri="/struts-tags" %>

<s:include value="/WEB-INF/templates/UpperBody.jsp"></s:include>

<main role="main" class="container my-4">

	<div class="d-flex justify-content-between">
		<h2>Visualização de Funcionário</h2>
		<div class="d-flex">
			<a href="<s:url action='update'><s:param name="id" value="%{funcionario.cdFuncionario}" /></s:url>">
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
		    <label for="cdFuncionario" class="form-label">Código do Funcionário</label>
		    <s:textfield class="form-control" id="cdFuncionario" name="funcionario.cdFuncionario" value="%{funcionario.cdFuncionario}" disabled="true" readonly="true" />
		</div>
		
	    <div class="mb-3">
		    <label for="nmFuncionario" class="form-label">Nome do Funcionário</label>
	    	<s:textfield class="form-control" id="nmFuncionario" name="funcionario.nmFuncionario" value="%{funcionario.nmFuncionario}" disabled="true" readonly="true" />
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
					Tem certeza que deseja excluir o seguinte funcionário? <br>
					<strong><s:property value="%{funcionario.nmFuncionario}" /></strong> <br><br>
					<p class="text-danger">* Todos seus exames realizados também serão deletados<p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
					<a href="<s:url action='delete' ><s:param name="toDelete" value="%{funcionario.cdFuncionario}" /></s:url>" class="btn btn-danger">Confirmar Exclusão</a>
				</div>
			</div>
		</div>
	</div>
</main>

<s:include value="/WEB-INF/templates/LowerBody.jsp"></s:include>