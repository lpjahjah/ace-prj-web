<%@ taglib prefix="s" uri="/struts-tags" %>

<s:include value="/WEB-INF/templates/UpperBody.jsp"></s:include>

<main role="main" class="container my-4">
	
	<div class="d-flex justify-content-between">
		<h2>Relatório de Exames Realizados</h2>
	</div>
	
	<s:actionerror />
	
	<s:form action="relatorio" cssClass="mt-3 row text-end g-3">
	    <div class="col-auto">
	    	<label for="dtInicial" class="visually-hidden">Data Inicial</label>
	        <s:textfield type="date" cssClass="form-control" id="dtInicial" name="dtInicial" value="%{formattedDtInicial}" placeholder="Data Inicial"/>
		    <s:fielderror fieldName="dtInicial" cssClass="text-danger" />
		</div>	
	    
	    <div class="col-auto">
	    	<label for="dtFinal" class="visually-hidden">Data Final</label>
	        <s:textfield type="date" cssClass="form-control" id="dtFinal" name="dtFinal" value="%{formattedDtFinal}" placeholder="Data Final"/>
		    <s:fielderror fieldName="dtFinal" cssClass="text-danger" />
		</div>

	    <div class="col-auto">
	        <s:submit cssClass="btn btn-dark mb-3" value="Buscar"/>
	    </div>
	</s:form>
	
	<table class="table table-bordered">
		<thead class="table-light">
	    	<tr>
	    		<th scope="col">Código Funcionário</th>
	    		<th scope="col">Nome Funcionário</th>
	    		<th scope="col">Código Exame</th>
	      		<th scope="col">Nome Exame</th>
	      		<th scope="col">Data Realização</th>
	    	</tr>
	  	</thead>
	  	
	  	<tbody>
		  
			<s:iterator value="examesRealizados">
				<tr>
					<td>
			      		<s:property value="funcionario.cdFuncionario" />
			      	</td>
			      	<td>
			      		<s:property value="funcionario.nmFuncionario" />
			      	</td>
			      	<td>
			      		<s:property value="exame.cdExame" />
			      	</td>
			      	<td>
			      		<s:property value="exame.nmExame" />
			      	</td>
			      	<td>
			      		<s:property value="dtRealizacao" />
			      	</td>
				</tr>
			</s:iterator>
		    
		</tbody>
	</table>

</main>

<s:include value="/WEB-INF/templates/LowerBody.jsp"></s:include>