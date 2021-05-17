<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="it">
<head>
    <jsp:include page="../header.jsp"/>
    <title>Visualizza elemento</title>

    <!-- style per le pagine diverse dalla index -->
    <link href="${pageContext.request.contextPath }/assets/css/global.css" rel="stylesheet">

</head>
<body>
<jsp:include page="../navbar.jsp"/>

<main role="main" class="container">

    <div class='card'>
        <div class='card-header'>
            Dati dell'annuncio da eliminare
        </div>

        <div class='card-body'>
            <dl class="row">
                <dt class="col-sm-3 text-right">Id:</dt>
                <dd class="col-sm-9">${dettaglio_articolo_attr.id}</dd>
            </dl>

            <dl class="row">
                <dt class="col-sm-3 text-right">Descrizione annuncio:</dt>
                <dd class="col-sm-9">${dettaglio_articolo_attr.testoAnnuncio}</dd>
            </dl>

            <dl class="row">
                <dt class="col-sm-3 text-right">Prezzo:</dt>
                <dd class="col-sm-9">${dettaglio_articolo_attr.prezzo}</dd>
            </dl>

            <dl class="row">
                <dt class="col-sm-3 text-right">Stato annuncio:</dt>
                <dd class="col-sm-9">${dettaglio_articolo_attr.statoAnnuncio}</dd>
            </dl>

            <dl class="row">
                <dt class="col-sm-3 text-right">Data pubblicazione:</dt>
                <dd class="col-sm-9"><fmt:formatDate type="date"
                                                     value="${dettaglio_articolo_attr.dataPubblicazione}"/></dd>
            </dl>

            <dl class="row">
                <dt class="col-sm-3 text-right">Categoria:</dt>
                <c:forEach items="${dettaglio_articolo_attr.categorie }" var="categoriaItem">
                    <dd class="col-sm-9">${categoriaItem.descrizione}</dd>
                </c:forEach>
            </dl>


        </div>

        <div class='card-footer'>
            <a href="${pageContext.request.contextPath }/areaprivata/areaprivata" class='btn btn-outline-secondary'
               style='width:80px'>
                <i class='fa fa-chevron-left'></i> Back
            </a>
            <a id="changeStatoLink_#_${dettaglio_articolo_attr.id }" class="btn btn-danger  btn-outline-secondary"
               data-toggle="modal" data-target="#confirmBuyModal">Elimina</a>
        </div>
    </div>

    <div class="modal fade" id="confirmBuyModal" tabindex="-1" role="dialog" aria-labelledby="confirmBuyModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="confirmBuyModalLabel">Eliminazione annuncio</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Sei sicuro di voler eliminare l'annuncio?
                </div>
                <form method="post"
                      action="${pageContext.request.contextPath }/areaprivata/delete/${dettaglio_articolo_attr.id }">
                    <div class="modal-footer">
                        <input type="hidden" name="idCartellaEsattorialeForChangingStato"
                               id="idCartellaEsattorialeForChangingStato">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Chiudi</button>
                        <input type="submit" value="Continua" class="btn  btn-danger  ml-2 mr-2">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- end Modal -->
    <script type="text/javascript">
        $(".link-for-modal").click(function () {
            <!-- mi prendo il numero che poi sarà l'id. Il 18 è perché 'changeStatoLink#' è appunto lungo 18  -->
            var callerId = $(this).attr('id').substring(18);
            <!-- imposto nell'hidden del modal l'id da postare alla servlet -->
            $('#idCartellaEsattorialeForChangingStato').val(callerId);
        });
    </script>


    <!-- end main container -->
</main>
<jsp:include page="../footer.jsp"/>

</body>
</html>