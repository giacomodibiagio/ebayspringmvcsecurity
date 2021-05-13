<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="it">
<head>
	<jsp:include page="../header.jsp" />
	<title>Inserisci nuovo</title>
	
	<!-- style per le pagine diverse dalla index -->
    <link href="${pageContext.request.contextPath}/assets/css/global.css" rel="stylesheet">
    
</head>
<body>
	<jsp:include page="../navbar.jsp" />
	
	<main role="main" class="container">
	
			<%-- alert con lista errori --%>
		<div class="alert alert-danger ${utenteDaModificare.hasErrors()?'':'d-none'}" role="alert">
			<c:forEach var ="errorItem" items="${utenteDaModificare.errors }">
	        	<ul>
					<li> ${errorItem }</li>	
				</ul>
	      	</c:forEach>
		</div>
	
		<div class="alert alert-danger alert-dismissible fade show ${errorMessage==null?'d-none': ''}" role="alert">
		  ${errorMessage}
		  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
		    <span aria-hidden="true">&times;</span>
		  </button>
		</div>
		
		<div class='card'>
		    <div class='card-header'>
		        <h5>Modifica elemento</h5> 
		    </div>
		    <div class='card-body'>
		    
		    		<h6 class="card-title">I campi con <span class="text-danger">*</span> sono obbligatori</h6>

					<form method="post" action="${pageContext.request.contextPath}/admin/ExecuteUpdateUtenteServlet" novalidate="novalidate" >
					
						<div class="form-row">
							<div class="form-group col-md-6">
								<label>username <span class="text-danger">*</span></label>
								<input type="text" name="username" id="username" class="form-control" placeholder="Inserire il username" value="${utenteDaModificare.username }" autocomplete="nope" required>
							</div>
							
							<div class="form-group col-md-6">
								<label>nome <span class="text-danger">*</span></label>
								<input type="text" name="nome" id="nome" class="form-control" placeholder="Inserire il nome" value="${utenteDaModificare.nome }" required>
							</div>
						</div>
						
						<div class="form-row">	
							<div class="form-group col-md-6">
								<label>cognome <span class="text-danger">*</span></label>
								<input type="text" class="form-control" name="cognome" id="cognome" placeholder="Inserire il cognome" value="${utenteDaModificare.cognome }" required>
							</div>
							
							<div class="form-group col-md-6">
								<label>password <span class="text-danger">*</span></label>
								<input type="password" class="form-control" name="password" id="password" placeholder="Inserire la password" value="${utenteDaModificare.password }" autocomplete="new-password" required>
							</div>
							
							<div class="form-group col-md-6">
								<label>conferma password <span class="text-danger">*</span></label>
								<input type="password" class="form-control" name="confermaPassword" id="confermaPassword" placeholder="conferma Password"  required>
							</div>
							
						</div>
							<input type ="hidden" name="id" value ="${utenteDaModificare.id}">
						<button type="submit" name="submit" value="submit" id="submit" class="btn btn-primary">Conferma</button>

						<br/>
						Ruoli:
						<div class="form-check">
						<c:forEach items="${ruoli_list_attribute}" var="ruoloItem">
						  <input name="ruolo.id" class="form-check-input" type="checkbox" value="${ruoloItem.id}" id="defaultCheck1" ${utenteDaModificare.ruoli.contains(ruoloItem)?"checked":"" }>
						  <label class="form-check-label" for="defaultCheck1">
						    ${ruoloItem.descrizione}
						  </label>
						  <br/>
						  </c:forEach>
						</div>

					</form>

		    
		    
			<!-- end card-body -->			   
		    </div>
		</div>	
	
	
	<!-- end container -->	
	</main>
	<jsp:include page="../footer.jsp" />
	
</body>
</html>