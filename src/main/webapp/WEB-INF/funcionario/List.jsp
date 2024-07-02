<%@ taglib prefix="s" uri="/struts-tags" %>

<s:include value="/WEB-INF/templates/UpperBody.jsp"></s:include>

<main role="main" class="container my-4">
	
	<div class="d-flex justify-content-between">
		<h2>Funcionários</h2>
		<a href="<s:url action='create'></s:url>">
			<button class="btn btn-success">
				Novo Funcionário
			</button>
		</a>
	</div>
	
	<s:form action="funcionarios" cssClass="mt-3 row text-end g-3">
	    <div class="col-auto">
	        <label for="cdFuncionario" class="visually-hidden">Código</label>
	        <s:textfield name="cdFuncionario" id="cdFuncionario" cssClass="form-control" placeholder="Código"/>
	    </div>
	    
	    <div class="col-auto">
	        <label for="nmFuncionario" class="visually-hidden">Nome</label>
	        <s:textfield name="nmFuncionario" id="nmFuncionario" cssClass="form-control" placeholder="Nome"/>
	    </div>

	    <div class="col-auto">
	        <s:submit cssClass="btn btn-dark mb-3" value="Buscar"/>
	    </div>
	</s:form>
	
	<table class="table table-hover">
		<thead class="table-light">
	    	<tr>
	    		<th scope="col">#</th>
	      		<th scope="col">Nome</th>
	      		<th scope="col"></th>
	    	</tr>
	  	</thead>
	  	
	  	<tbody>
		  
			<s:iterator value="funcionarios">
				<tr>
					<th scope="row">
						<s:property value="cdFuncionario" />
					</th>
					<td>
			      		<s:property value="nmFuncionario" />
			      	</td>
					<td class="text-end pe-4">
            			<a class="link-info link-underline link-underline-opacity-0" href="<s:url action='funcionario'><s:param name='id' value='%{cdFuncionario}'/></s:url>">Acessar</a>
        			</td>
				</tr>
			</s:iterator>
		    
		</tbody>
	</table>
	
	
	<s:form action="funcionarios">
		<s:hidden name="page" value="%{page + 1}" />
		
		<s:hidden type="number" name="cdFuncionario" id="cdFuncionario" cssClass="form-control" />
	    
	    <s:hidden name="nmFuncionario" id="nmFuncionario" cssClass="form-control" />
		
		<div class="text-end mt-4">
			<s:submit class="btn btn-dark" value="Carregar mais" />
		</div>
    </s:form>	

</main>

<s:include value="/WEB-INF/templates/LowerBody.jsp"></s:include>