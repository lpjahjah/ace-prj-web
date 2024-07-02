<%@ taglib prefix="s" uri="/struts-tags" %>

<s:include value="/WEB-INF/templates/UpperBody.jsp"></s:include>

<main role="main" class="container my-4">

	<div class="d-flex justify-content-between">
		<h2>Novo Funcionário</h2>
	</div>
	
	<s:form class="mt-3" action="create">
		
		<div class="mb-3">
		    <label for="nmFuncionario" class="form-label">Nome do Funcionário</label>
	    	<s:textfield class="form-control" id="nmExame" name="funcionario.nmFuncionario" />
	    	<s:fielderror fieldName="nmFuncionario" cssClass="text-danger" />
		</div>
		
		<div>
	        <s:submit cssClass="btn btn-success mb-3" value="Criar"/>
	    </div>
		
	</s:form>
	<s:actionerror cssClass="text-danger" />
	
</main>

<s:include value="/WEB-INF/templates/LowerBody.jsp"></s:include>