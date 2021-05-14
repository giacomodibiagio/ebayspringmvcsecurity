package it.prova.ebayspringmvcsecurity.service.acquisto;

import it.prova.ebayspringmvcsecurity.model.Acquisto;
import it.prova.ebayspringmvcsecurity.repository.acquisto.AcquistoRepository;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class AcquistoServiceImpl implements AcquistoService {

    @Autowired
    private AcquistoRepository repository;

    @Override
    public List<Acquisto> listAllElements() {
        return (List<Acquisto>) repository.findAll();
    }

    @Override
    public Acquisto caricaSingoloElemento(Long id) {
        return repository.findById(id).orElse(null);
    }

 /*   @Override
    public Acquisto caricaSingoloElementoEager(Long id) {
        return repository.caricaSingoloElementoEager(id).orElse(null);
    }*/

    @Override
    public void aggiorna(Acquisto acquistoInstance) {
        repository.save(acquistoInstance);
    }

    @Override
    public void inserisciNuovo(Acquisto acquistoInstance) {
        repository.save(acquistoInstance);
    }

    @Override
    public void rimuovi(Acquisto acquistoInstance) {
        repository.delete(acquistoInstance);
    }

 /*   @Override
    public List<Acquisto> findByExample(Acquisto example) {
        return repository.findByExample(example);
    }*/
}
