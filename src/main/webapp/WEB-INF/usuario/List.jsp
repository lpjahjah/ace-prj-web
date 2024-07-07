<%@ taglib prefix="s" uri="/struts-tags" %>

<s:include value="/WEB-INF/templates/UpperBody.jsp"></s:include>

<main role="main" class="container my-4">
	
	<div class="d-flex justify-content-between">
		<h2>Usuários</h2>
		<a href="<s:url action='create'></s:url>">
			<button class="btn btn-success">
				Novo Usuario
			</button>
		</a>
	</div>
	
	<s:form action="usuarios" cssClass="mt-3 row text-end g-3">
	    <div class="col-auto">
	        <label for="cdUsuario" class="visually-hidden">Código</label>
	        <s:textfield type="number" name="cdUsuario" id="cdUsuario" cssClass="form-control" placeholder="Código"/>
	    </div>
	    <div class="col-auto">
	        <label for="nmLogin" class="visually-hidden">Login</label>
	        <s:textfield name="nmLogin" id="nmLogin" cssClass="form-control" placeholder="Login"/>
	    </div>
	    <div class="col-auto">
	        <s:submit cssClass="btn btn-dark mb-3" value="Buscar"/>
	    </div>
	</s:form>
	
	<table class="table table-hover">
		<thead class="table-light">
	    	<tr>
	    		<th scope="col">#</th>
	      		<th scope="col">Login</th>
	      		<th scope="col">Tempo de Inatividade</th>
	      		<th scope="col"></th>
	    	</tr>
	  	</thead>
	  	
	  	<tbody>
		  
			<s:iterator value="usuarios">
				<tr>
					<th scope="row">
						<s:property value="cdUsuario" />
					</th>
					<td>
			      		<s:property value="nmLogin" />
			      	</td>
			      	<td>
				      	<s:property value="qtTempoInatividade" />
			      	</td>
					<td class="text-end pe-4">
            			<a class="link-info link-underline link-underline-opacity-0" href="<s:url action='usuario'><s:param name='id' value='cdUsuario'/></s:url>">Acessar</a>
        			</td>
				</tr>
			</s:iterator>
		    
		</tbody>
	</table>
	
	
	<s:form action="exames">
		<s:hidden name="page" value="%{page + 1}" />
		
		<s:hidden type="number" name="cdUsuario" id="cdUsuario" cssClass="form-control" placeholder="Código"/>
	    
	    <s:hidden name="nmLogin" id="nmLogin" cssClass="form-control" placeholder="Login"/>
	    		
		<div class="text-end mt-4">
			<s:submit class="btn btn-dark" value="Carregar mais" />
		</div>
    </s:form>	

</main>

<s:include value="/WEB-INF/templates/LowerBody.jsp"></s:include>