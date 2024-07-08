<%@ taglib prefix="s" uri="/struts-tags" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="<s:url namespace='/home' action=''/>">SOC</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
      
        <li class="nav-item">
          <a class="nav-link" href="<s:url namespace='/exames' action=''/>">Exames</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link" href="<s:url namespace='/funcionarios' action=''/>">Funcionarios</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link" href="<s:url namespace='/exames-realizados' action=''/>">Exames Realizados</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link" href="<s:url namespace='/relatorios' action=''/>">Relatórios</a>
        </li>
        
      </ul>
    </div>
    
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
    	<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
    		<li class="nav-item dropdown ml-auto">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            <i class="fas fa-user"></i>
            <s:property value="#session.user.login"/>
          </a>
          <ul class="dropdown-menu dropdown-menu-end">
            <li><a class="dropdown-item" href="<s:url namespace='/usuarios' action=''/>">Gerenciar Usuários</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="<s:url namespace='/' action='logout'/>">Sair</a></li>
          </ul>
        </li>
    	</ul>
    </div>
    
  </div>
</nav>