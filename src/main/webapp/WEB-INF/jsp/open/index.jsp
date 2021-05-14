<!doctype html>
<html lang="it">
<head>

    <jsp:include page="../header.jsp"/>

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/static/assets/css/global.css" rel="stylesheet" type="text/css">
    <style type="text/css">
        body {
            padding-top: 3.5rem;
        }
    </style>

    <title>Gestione della Raccolta Film</title>
</head>
<body>

<jsp:include page="../navbar.jsp"/>


<main role="main">

    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">Piattaforma di e-commerce</h1>
            <h4 class="display-4">Grandi Sconti sull elettronica!</h4>
            <br>
            <h4>Fino a -60% su smartphone, tv e molto altro!</h4>
        </div>
    </div>

    <div class="container">

        <div class="alert alert-danger alert-dismissible fade show ${errorMessage==null?'d-none': ''}" role="alert">
            ${errorMessage}
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>

        <form method="post" action="list">

            <div class="form-row">
                <div class="form-group col-md-6">
                    <label>Nome</label>
                    <input type="text" name="nome" id="nome" class="form-control" placeholder="Inserire il nome">
                </div>

                <div class="form-group col-md-6">
                    <label>Cognome</label>
                    <input type="text" name="cognome" id="cognome" class="form-control"
                           placeholder="Inserire il cognome">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group col-md-6">
                    <label>Codice Fiscale</label>
                    <input type="text" class="form-control" name="codiceFiscale" id="codiceFiscale"
                           placeholder="Inserire il codice Fiscale">
                </div>
                <div class="form-group col-md-6">
                    <label>Indirizzo</label>
                    <input type="text" class="form-control" name="indirizzo" id="indirizzo"
                           placeholder="Inserire l'indirizzo">
                </div>
                <div class="form-group col-md-3">
                    <label>Data di Nascita</label>
                    <input class="form-control" id="dataDiNascita" type="date" placeholder="dd/MM/yy"
                           title="formato : gg/mm/aaaa" name="dataDiNascita">
                </div>


            </div>

            <button type="submit" name="submit" value="submit" id="submit" class="btn btn-primary">Conferma</button>
            <input class="btn btn-outline-warning" type="reset" value="Ripulisci">

            <a class="btn btn-outline-primary ml-2" href="${pageContext.request.contextPath }/contribuente/insert">Add
                New</a>

        </form>

        <hr>

    </div> <!-- /container -->

</main>

<jsp:include page="../footer.jsp"/>
</body>
</html>