package it.prova.ebayspringmvcsecurity.service.annuncio;

import it.prova.ebayspringmvcsecurity.model.Annuncio;
import it.prova.ebayspringmvcsecurity.repository.annuncio.AnnuncioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AnnuncioServiceImpl implements AnnuncioService {

    @Autowired
    private AnnuncioRepository repository;

    @Override
    public List<Annuncio> listAllElements() {
        return (List<Annuncio>) repository.findAll();
    }

    @Override
    public Annuncio caricaSingoloElemento(Long id) {
        return repository.findById(id).orElse(null);
    }

    @Override
    public void aggiorna(Annuncio annuncioInstance) {
        repository.save(annuncioInstance);
    }

    @Override
    public void inserisciNuovo(Annuncio annuncioInstance) {
        repository.save(annuncioInstance);
    }

    @Override
    public void rimuovi(Annuncio annuncioInstance) {
        repository.delete(annuncioInstance);
    }

    @Override
    public List<Annuncio> findByExample(Annuncio annuncioExample) {
        return repository.findByExample(annuncioExample);
    }

    @Override
    public Annuncio caricaSingoloAnnuncioEager(Long idAnnuncio) {
        return repository.findSingleAnnuncioEager(idAnnuncio);
    }
}
