<%@ taglib prefix="s" uri="/struts-tags" %>

<s:include value="/WEB-INF/templates/UpperBody.jsp"></s:include>

<main role="main" class="container my-4">

	<div class="d-flex justify-content-between">
		<h2>Atualizar Exame Realizado</h2>
	</div>
	
	<s:if test="hasActionErrors()">
	    <div class="alert alert-danger mt-3" role="alert">
	    	<s:actionerror />
	    </div>
	</s:if>
	
	<s:form class="mt-3" action="update">
	
		<s:hidden id="cdExame" name="exameRealizado.cdExameRealizado" value="%{exameRealizado.cdExameRealizado}" />
		
		<div class="mb-3">
	    	<label for="dtRealizacao" class="form-label">Data Realização</label>
	        <s:textfield type="date" cssClass="form-control" id="dtRealizacao" value="%{formattedDtRealizacao}" name="exameRealizado.dtRealizacao"/>
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
		        value="%{exameRealizado.funcionario.cdFuncionario}"
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
		        value="%{exameRealizado.exame.cdExame}"
		        cssClass="form-select"
	        />
	        <s:fielderror fieldName="exame" cssClass="text-danger" />
        </div> 	
		
		<div>
	        <s:submit cssClass="btn btn-primary mb-3" value="Atualizar"/>
	    </div>
		
	</s:form>
	
</main>

<s:include value="/WEB-INF/templates/LowerBody.jsp"></s:include>