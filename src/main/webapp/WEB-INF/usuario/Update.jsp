<%@ taglib prefix="s" uri="/struts-tags" %>

<s:include value="/WEB-INF/templates/UpperBody.jsp"></s:include>

<main role="main" class="container my-4">

	<div class="d-flex justify-content-between">
		<h2>Atualizar Usuário</h2>
	</div>
	
	<s:form class="mt-3" action="update">
	
		<s:hidden id="cdUsuario" name="usuario.cdUsuario" value="%{usuario.cdUsuario}" />
		
		<div class="mb-3">
		    <label for="nmLogin" class="form-label">Login</label>
	    	<s:textfield class="form-control" id="nmLogin" name="usuario.nmLogin" value="%{usuario.nmLogin}" />
	    	<s:fielderror fieldName="nmLogin" cssClass="text-danger" />
		</div>
	    
	    <div class="mb-3">
		    <label for="dsSenha" class="form-label">Senha</label>
	    	<s:textfield type="password" class="form-control" id="dsSenha" name="usuario.dsSenha" value="%{usuario.dsSenha}" />
	    	<span class="text-warning"> Para não alterar deixe em branco</span>
	    	<s:fielderror fieldName="dsSenha" cssClass="text-danger" />
		</div>
		
		<div class="mb-3">
		    <label for="qtTempoInatividade" class="form-label">Tempo de Inatividade (em minutos)</label>
	    	<s:textfield type="number" class="form-control" id="qtTempoInatividade" name="usuario.qtTempoInatividade" value="%{usuario.qtTempoInatividade}" />
	    	<s:fielderror fieldName="qtTempoInatividade" cssClass="text-danger" />
		</div>
		
		<div>
	        <s:submit cssClass="btn btn-primary mb-3" value="Atualizar"/>
	    </div>
		
	</s:form>
	<s:actionerror cssClass="text-danger" />
	
</main>

<s:include value="/WEB-INF/templates/LowerBody.jsp"></s:include>