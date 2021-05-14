package it.prova.ebayspringmvcsecurity.service.annuncio;


import it.prova.ebayspringmvcsecurity.model.Annuncio;

import java.util.List;

public interface AnnuncioService {
    public List<Annuncio> listAllElements();

    public Annuncio caricaSingoloElemento(Long id);

    //  public Acquisto caricaSingoloElementoEager(Long id);

    public void aggiorna(Annuncio annuncioInstance);

    public void inserisciNuovo(Annuncio annuncioInstance);

    public void rimuovi(Annuncio annuncioInstance);

    //  public List<Acquisto> findByExample(Acquisto example);
}
