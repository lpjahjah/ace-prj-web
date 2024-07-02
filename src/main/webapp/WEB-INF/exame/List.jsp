<%@ taglib prefix="s" uri="/struts-tags" %>

<s:include value="/WEB-INF/templates/UpperBody.jsp"></s:include>

<main role="main" class="container my-4">
	
	<div class="d-flex justify-content-between">
		<h2>Exames</h2>
		<a href="<s:url action='create'></s:url>">
			<button class="btn btn-success">
				Novo Exame
			</button>
		</a>
	</div>
	
	<s:form action="exames" cssClass="mt-3 row text-end g-3">
	    <div class="col-auto">
	        <label for="cdExame" class="visually-hidden">Código</label>
	        <s:textfield type="number" name="cdExame" id="cdExame" cssClass="form-control" placeholder="Código"/>
	    </div>
	    <div class="col-auto">
	        <label for="nmExame" class="visually-hidden">Nome</label>
	        <s:textfield name="nmExame" id="nmExame" cssClass="form-control" placeholder="Nome"/>
	    </div>
	    <div class="col-auto">
	    	<label for="statusExame" class="visually-hidden">Status</label>
		    <s:select
		        name="statusExame" 
		        list="allStatusExame" 
		        listKey="name()" 
		        listValue="name()" 
		        headerKey=""
		        headerValue="Status"
		        cssClass="form-select"
		        id="statusExame"
	        />
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
	      		<th scope="col">Ativo</th>
	      		<th scope="col"></th>
	    	</tr>
	  	</thead>
	  	
	  	<tbody>
		  
			<s:iterator value="exames">
				<tr>
					<th scope="row">
						<s:property value="cdExame" />
					</th>
					<td>
			      		<s:property value="nmExame" />
			      	</td>
			      	<td>
				      	<s:if test="%{icAtivo}">
							<i class="fas fa-dot-circle text-success"></i>
	    				</s:if>
	    				<s:else>
	    					<i class="fas fa-dot-circle text-danger"></i>
	    				</s:else>
			      	</td>
					<td>
            			<a class="link-info link-underline link-underline-opacity-0" href="<s:url action='exame'><s:param name='id' value='%{cdExame}'/></s:url>">Acessar</a>
        			</td>
				</tr>
			</s:iterator>
		    
		</tbody>
	</table>
	
	
	<s:form action="exames">
		<s:hidden name="page" value="%{page + 1}" />
		
		<s:hidden type="number" name="cdExame" id="cdExame" cssClass="form-control" placeholder="Código"/>
	    
	    <s:hidden name="nmExame" id="nmExame" cssClass="form-control" placeholder="Nome"/>
	    
		<s:hidden name="statusExame" id="statusExame" cssClass="form-select"/>
		
		<div class="text-end mt-4">
			<s:submit class="btn btn-dark" value="Carregar mais" />
		</div>
    </s:form>	

</main>

<s:include value="/WEB-INF/templates/LowerBody.jsp"></s:include>