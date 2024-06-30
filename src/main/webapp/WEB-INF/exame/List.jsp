<%@ taglib prefix="s" uri="/struts-tags" %>

<s:include value="/WEB-INF/templates/UpperBody.jsp"></s:include>

<main role="main" class="container">

	<div class="mt-3">
		<h1>Exames</h1>
	</div>
	
	<table class="table table-hover">
		<thead class="table-light">
	    	<tr>
	    		<th scope="col">#</th>
	      		<th scope="col">Name</th>
	    	</tr>
	  	</thead>
	  	
	  	<tbody>
		  
			<s:iterator value="exames">
				<tr>
					<th scope="row">1</th>
					<td>
			      		<s:property value="nmExame" />
			      	</td>
				</tr>
			</s:iterator>
		    
		</tbody>
	</table>

</main>

<s:include value="/WEB-INF/templates/LowerBody.jsp"></s:include>