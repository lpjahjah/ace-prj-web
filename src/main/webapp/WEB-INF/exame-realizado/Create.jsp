<%@ taglib prefix="s" uri="/struts-tags" %>

<s:include value="/WEB-INF/templates/UpperBody.jsp"></s:include>

<main role="main" class="container my-4">

	<div class="d-flex justify-content-between">
		<h2>Novo Exame Realizado</h2>
	</div>
	
	<s:form class="mt-3" action="create">
	
		<div class="mb-3">
	    	<label for="dtRealizacao" class="form-label">Data Realização</label>
	        <s:textfield type="date" cssClass="form-control" id="dtRealizacao" name="exameRealizado.dtRealizacao"/>
		    <s:fielderror fieldName="dtRealizacao" cssClass="text-danger" />
		</div>	
		
		<div class="mb-3">
	    	<label for="funcionario" class="form-label">Funcionário</label>
		    <s:select
		    	id="funcionario"
		        name="selectedCdFuncionario" 
		        list="funcionarios" 
		        listKey="cdFuncionario" 
		        listValue="nmFuncionario" 
		        headerKey=""
		        headerValue="Selecione um Funcionário"
		        cssClass="form-select"
	        />
	        <s:fielderror fieldName="funcionario" cssClass="text-danger" />
        </div>    
        
		<div class="mb-3">
	    	<label for="exame" class="form-label">Exame</label>
		    <s:select
		    	id="exame"
		        name="selectedCdExame" 
		        list="exames" 
		        listKey="cdExame" 
		        listValue="nmExame" 
		        headerKey=""
		        headerValue="Selecione um Exame"
		        cssClass="form-select"
	        />
	        <s:fielderror fieldName="exame" cssClass="text-danger" />
        </div> 	
        	
		<div>
	        <s:submit cssClass="btn btn-success mb-3" value="Criar"/>
	    </div>
		
	</s:form>
	<s:actionerror cssClass="text-danger" />
	
</main>

<s:include value="/WEB-INF/templates/LowerBody.jsp"></s:include>