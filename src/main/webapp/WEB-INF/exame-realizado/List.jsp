<%@ taglib prefix="s" uri="/struts-tags" %>

<s:include value="/WEB-INF/templates/UpperBody.jsp"></s:include>

<main role="main" class="container my-4">
	
	<div class="d-flex justify-content-between">
		<h2>Exames Realizados</h2>
		<a href="<s:url action='create'></s:url>">
			<button class="btn btn-success">
				Novo Exame Realizado
			</button>
		</a>
	</div>
	
	<s:form action="exames-realizados" cssClass="mt-3 row text-end g-3">
	    <div class="col-auto">
	        <label for="cdExameRealizado" class="visually-hidden">Código</label>
	        <s:textfield type="number" name="cdExameRealizado" id="cdExameRealizado" cssClass="form-control" placeholder="Código"/>
	    </div>
	    
	    <div class="col-auto">
	        <label for="cdFuncionario" class="visually-hidden">Código Funcionário</label>
	        <s:textfield type="number" name="cdFuncionario" id="cdFuncionario" cssClass="form-control" placeholder="Código Funcionário"/>
	    </div>
	    
	    <div class="col-auto">
	        <label for="nmFuncionario" class="visually-hidden">Nome Funcionário</label>
	        <s:textfield name="nmFuncionario" id="nmFuncionario" cssClass="form-control" placeholder="Nome Funcionário"/>
	    </div>
	    
	    <div class="col-auto">
	        <label for="cdExame" class="visually-hidden">Código Exame</label>
	        <s:textfield type="number" name="cdExame" id="cdExame" cssClass="form-control" placeholder="Código Exame"/>
	    </div>
	    
	    <div class="col-auto">
	        <label for="nmExame" class="visually-hidden">Nome Exame</label>
	        <s:textfield name="nmExame" id="nmExame" cssClass="form-control" placeholder="Nome Exame"/>
	    </div>
	    
	    <div class="col-auto">
	        <label for="dtRealizacao" class="visually-hidden">Data Realização</label>
	        <s:textfield type="date" name="dtRealizacao" id="dtRealizacao" value="%{formattedDtRealizacao}" cssClass="form-control" placeholder="Data Realização"/>
	    </div>
	    
	    <div class="col-auto">
	        <s:submit cssClass="btn btn-dark mb-3" value="Buscar"/>
	    </div>
	</s:form>
	
	<table class="table table-hover">
		<thead class="table-light">
	    	<tr>
	    		<th scope="col">#</th>
	      		<th scope="col" class="ps-3">Código Funcionário</th>
	      		<th scope="col">Nome Funcionário</th>
	      		<th scope="col">Código Exame</th>
	      		<th scope="col">Nome Exame</th>
	      		<th scope="col">Data Realização</th>
	      		<th scope="col"></th>
	    	</tr>
	  	</thead>
	  	
	  	<tbody>
		  
			<s:iterator value="examesRealizados">
				<tr>
					<th scope="row">
						<s:property value="cdExameRealizado" />
					</th>
					<td class="ps-3">
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
					<td class="text-end pe-4">
            			<a class="link-info link-underline link-underline-opacity-0" href="<s:url action='exame-realizado'><s:param name='id' value='%{cdExameRealizado}'/></s:url>">Acessar</a>
        			</td>
				</tr>
			</s:iterator>
		    
		</tbody>
	</table>
	
	
	<s:form action="exames-realizados">
		<s:hidden name="page" value="%{page + 1}" />
		
		<s:hidden type="number" name="cdExameRealizado" id="cdExameRealizado" cssClass="form-control"/>
	    
		<s:hidden type="number" name="cdFuncionario" id="cdFuncionario" cssClass="form-control"/>
	    
	    <s:hidden name="nmFuncionario" id="nmFuncionario" cssClass="form-control"/>
	    
	    <s:hidden type="number" name="cdExame" id="cdExame" cssClass="form-control"/>
	    
	    <s:hidden name="nmExame" id="nmExame" cssClass="form-control"/>
	    
	    <s:hidden type="date" name="dtRealizacao" id="dtRealizacao" cssClass="form-control"/>
		
		<div class="text-end mt-4">
			<s:submit class="btn btn-dark" value="Carregar mais" />
		</div>
    </s:form>	

</main>

<s:include value="/WEB-INF/templates/LowerBody.jsp"></s:include>