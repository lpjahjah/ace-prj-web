<%@ taglib prefix="s" uri="/struts-tags" %>

<s:include value="/WEB-INF/templates/UpperBody.jsp"></s:include>

<main role="main" class="container my-4">

	<div class="d-flex justify-content-between">
		<h2>Novo Exame</h2>
	</div>
	
	<s:form class="mt-3" action="update">
	
		<s:hidden id="cdExame" name="exame.cdExame" value="%{exame.cdExame}" />
		
		<div class="mb-3">
		    <label for="nmExame" class="form-label">Nome do Exame</label>
	    	<s:textfield class="form-control" id="nmExame" name="exame.nmExame" value="%{exame.nmExame}" />
	    	<s:fielderror fieldName="nmExame" cssClass="text-danger" />
		</div>
	    
	    <div class="mb-3 form-check">
	    	<s:checkbox class="form-check-input" id="icAtivo" name="exame.icAtivo" value="%{exame.icAtivo}" fieldValue="true" />
		    <label for="icAtivo" class="form-check-label">Ativo</label>
		    <s:fielderror fieldName="icAtivo" cssClass="text-danger" />
		</div>
	    
	    <div class="mb-3">
		    <label for="dsDetalheExame" class="form-label">Detalhes do Exame 1</label>
	    	<s:textarea class="form-control" id="dsDetalheExame" name="exame.dsDetalheExame" value="%{exame.dsDetalheExame}" rows="4" />
	    	<s:fielderror fieldName="dsDetalheExame" cssClass="text-danger" />
		</div>
	    
	    <div class="mb-3">
		    <label for="dsDetalheExame1" class="form-label">Detalhes do Exame 2</label>
	    	<s:textarea class="form-control" id="dsDetalheExame1" name="exame.dsDetalheExame1" value="%{exame.dsDetalheExame1}" rows="4" />
	    	<s:fielderror fieldName="dsDetalheExame1" cssClass="text-danger" />
		</div>
		
		<div>
	        <s:submit cssClass="btn btn-primary mb-3" value="Atualizar"/>
	    </div>
		
	</s:form>
	<s:actionerror cssClass="text-danger" />
	
</main>

<s:include value="/WEB-INF/templates/LowerBody.jsp"></s:include>