<%@ taglib prefix="s" uri="/struts-tags" %>

<s:include value="/WEB-INF/templates/UpperBody.jsp"></s:include>

<main role="main" class="container my-4">

	<div class="d-flex justify-content-between">
		<h2>Novo Usuário</h2>
	</div>
	
	<s:form class="mt-3" action="create">
		
		<div class="mb-3">
		    <label for="nmLogin" class="form-label">Login</label>
	    	<s:textfield class="form-control" id="nmLogin" name="usuario.nmLogin" />
	    	<s:fielderror fieldName="nmLogin" cssClass="text-danger" />
		</div>
	    
	    <div class="mb-3">
		    <label for="dsSenha" class="form-label">Senha</label>
	    	<s:textfield type="password" class="form-control" id="dsSenha" name="usuario.dsSenha" />
	    	<s:fielderror fieldName="dsSenha" cssClass="text-danger" />
		</div>
	    
	    <div class="mb-3">
		    <label for="qtTempoInatividade" class="form-label">Tempo de Inatividade (em minutos)</label>
	    	<s:textfield type="number" class="form-control" id="qtTempoInatividade" name="usuario.qtTempoInatividade" />
	    	<s:fielderror fieldName="qtTempoInatividade" cssClass="text-danger" />
		</div>
		
		<div>
	        <s:submit cssClass="btn btn-success mb-3" value="Criar"/>
	    </div>
		
	</s:form>
	<s:actionerror cssClass="text-danger" />
	
</main>

<s:include value="/WEB-INF/templates/LowerBody.jsp"></s:include>