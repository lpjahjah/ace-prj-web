<%@ taglib prefix="s" uri="/struts-tags" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>SOC</title>
		
		<link rel="stylesheet" href="<s:url value='/css/global.css'/>">
				
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

		<style>
	        body {
	            height: 100vh;
	            display: flex;
	            justify-content: center;
	            align-items: center;
	        }
	        .card {
	            width: 100%;
	            max-width: 400px;
	            padding: 2rem;
	            border-radius: 10px;
	            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	        }
    	</style>
	</head>
	<body class="bg-secondary">
		<div class="card">
		        <div class="card-body">
		        
		        	<h2 class="text-center mb-4">SOC</h2>
					
					<s:form action="login">
					
						<s:hidden id="firstAccess" name="firstAccess" value="false" />
					
						<div class="mb-3">
						    <label for="username" class="form-label">Login</label>
					    	<s:textfield class="form-control" id="username" name="username" />
					    	<s:fielderror fieldName="username" cssClass="text-danger" />
						</div>
					    
					    <div class="mb-3">
						    <label for="password" class="form-label">Senha</label>
					    	<s:textfield type="password" class="form-control" id="password" name="password" />
					    	<s:fielderror fieldName="password" cssClass="text-danger" />
						</div>
						
						<s:actionerror cssClass="text-danger" />
						
						<div class="d-grid">
					        <s:submit cssClass="btn btn-success mb-3" value="Acessar"/>
					    </div>
						
					</s:form>
					
		        </div>
		    </div>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	</body>
</html>