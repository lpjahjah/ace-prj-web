<%@ taglib prefix="s" uri="/struts-tags" %>

<s:include value="/WEB-INF/templates/UpperBody.jsp"></s:include>

<main role="main" class="container my-4">

	<div class="d-flex justify-content-between">
		<h2>Visualiza��o de Exame Realizado</h2>
		<div class="d-flex">
			<a href="<s:url action='update'><s:param name="id" value="%{exameRealizado.cdExameRealizado}" /></s:url>">
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
		    <label for="cdExameRealizado" class="form-label">C�digo do Exame Realizado</label>
		    <s:textfield class="form-control" id="cdExameRealizado" name="exameRealizado.cdExameRealizado" value="%{exameRealizado.cdExameRealizado}" disabled="true" readonly="true" />
		</div>
		
		<div class="mb-3">
		    <label for=cdFuncionario class="form-label">C�digo do Funcion�rio</label>
		    <s:textfield class="form-control" id="cdFuncionario" name="exameRealizado.funcionario.cdFuncionario" value="%{exameRealizado.funcionario.cdFuncionario}" disabled="true" readonly="true" />
		</div>
		
	    <div class="mb-3">
		    <label for="nmFuncionario" class="form-label">Nome do Funcion�rio</label>
	    	<s:textfield class="form-control" id="nmFuncionario" name="exameRealizado.funcionario.nmFuncionario" value="%{exameRealizado.funcionario.nmFuncionario}" disabled="true" readonly="true" />
		</div>
		
		<div class="mb-3">
		    <label for="cdExame" class="form-label">C�digo do Exame</label>
		    <s:textfield class="form-control" id="cdExame" name="exameRealzado.exame.cdExame" value="%{exameRealizado.exame.cdExame}" disabled="true" readonly="true" />
		</div>
		
		<div class="mb-3">
		    <label for="nmExame" class="form-label">Nome do Exame</label>
	    	<s:textfield class="form-control" id="nmExame" name="exameRealizado.exame.nmExame" value="%{exameRealizado.exame.nmExame}" disabled="true" readonly="true" />
		</div>
	    
	    <div class="mb-3">
	    	<label for="dtRealizacao" class="form-label">Data Realiza��o</label>
	        <s:textfield type="date" cssClass="form-control" id="dtRealizacao" name="exameRealizado.dtRealizacao." value="%{formattedDtRealizacao}" disabled="true" readonly="true"/>
		</div>	
		
	</s:form>
	
	<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="deleteModalLabel">Confirmar Exclus�o</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					Tem certeza que deseja excluir o exame realizado?
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
					<a href="<s:url action='delete' ><s:param name="toDelete" value="%{exameRealizado.cdExameRealizado}" /></s:url>" class="btn btn-danger">Confirmar Exclus�o</a>
				</div>
			</div>
		</div>
	</div>
</main>

<s:include value="/WEB-INF/templates/LowerBody.jsp"></s:include>