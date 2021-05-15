<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="it">
<head>
    <jsp:include page="../header.jsp"/>
    <title>Visualizza elemento</title>

    <!-- style per le pagine diverse dalla index -->
    <link href="${pageContext.request.contextPath}/assets/css/global.css" rel="stylesheet">

</head>
<body>
<jsp:include page="../navbar.jsp"/>

<main role="main" class="container">

    <div class='card'>
        <div class='card-header bg-info   '>
            <p class="h3 text-center">Benvenuto nella tua area personale</p>
        </div>


        <div class='card-body'>

            <dl class="row">
                <dt class="col-sm-3 text-right">username:</dt>
                <dd class="col-sm-9">${show_utente_attribute.username}</dd>
            </dl>

            <dl class="row">
                <dt class="col-sm-3 text-right">nome:</dt>
                <dd class="col-sm-9">${show_utente_attribute.nome}</dd>
            </dl>

            <dl class="row">
                <dt class="col-sm-3 text-right">cognome:</dt>
                <dd class="col-sm-9">${show_utente_attribute.cognome}</dd>
            </dl>

            <dl class="row">
                <dt class="col-sm-3 text-right">Data creazione:</dt>
                <dd class="col-sm-9"><fmt:formatDate type="date" value="${show_utente_attribute.dateCreated}"/></dd>
            </dl>

            <dl class="row">
                <dt class="col-sm-3 text-right ">Credito Residuo:</dt>
                <dd class="col-sm-9">${show_utente_attribute.creditoResiduo}</dd>
            </dl>


        </div>

        <div class='card-footer'>
            <a href="${pageContext.request.contextPath }/utente/" class='btn btn-outline-light btn-warning'>
                <i class='fa fa-chevron-left'></i>Modifica i tuoi dati
            </a>

        </div>
    </div>


    <div class="card text-center ">
        <div class="card-header h4 text-center bg-info">
            <p class="h4 text-center">Riepilogo dei tuoi acquisiti</p>
        </div>
        <div class="card-body">
            <div class='table-responsive'>
                <table class='table table-striped '>
                    <thead>
                    <tr>
                        <th>Descrizione</th>
                        <th>Prezzo</th>
                        <th>Data Acquisto</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${lista_acquisti_utente }" var="acquistoItem">
                        <tr>
                            <td>${acquistoItem.descrizione }</td>
                            <td>${acquistoItem.prezzo }</td>
                            <td><fmt:formatDate type="date" value="${acquistoItem.dateAcquisto}"/></td>


                                <%--                            <td>--%>
                                <%--                                <a class="btn  btn-outline btn-outline-secondary"--%>
                                <%--                                   href="${pageContext.request.contextPath }/open/show/${annuncioItem.id }">Dettaglio</a>--%>
                                <%--                                <a class="btn  btn-success  ml-2 mr-2"--%>
                                <%--                                   href="${pageContext.request.contextPath }/acquisto/dettaglio/${annuncioItem.id }">Compra</a>--%>
                        </tr>

                    </c:forEach>
                    </tbody>
                </table>

            </div>
            <div class="card-footer text-muted">
                2 days ago
            </div>
        </div>


        <div class="card text-center ">
            <div class="card-header h4 text-center bg-info">
                <p class="h4 text-center">Gestisci i tuoi annunci</p>
            </div>
            <div class="card-body">
                <h5 class="card-title">Special title treatment</h5>
                <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                <a href="#" class="btn btn-primary">Go somewhere</a>
            </div>
            <div class="card-footer text-muted">
                2 days ago
            </div>
        </div>


        <!-- end main container -->
</main>
<jsp:include page="../footer.jsp"/>

</body>
</html>