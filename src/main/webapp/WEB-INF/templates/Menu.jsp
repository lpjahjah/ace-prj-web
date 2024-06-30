<%@ taglib prefix="s" uri="/struts-tags" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="<s:url namespace='/' action=''/>">SOC</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
      
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="<s:url namespace='/exames' action=''/>">Exames</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link" href="#">Agenda</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link" href="#">Usuarios</a>
        </li>
        
      </ul>
    </div>
  </div>
</nav>