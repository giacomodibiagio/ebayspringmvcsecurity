package it.prova.ebayspringmvcsecurity.repository.annuncio;

import it.prova.ebayspringmvcsecurity.model.Annuncio;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface AnnuncioRepository extends CrudRepository<Annuncio, Long>,CustomAnnuncioRepository {

    @Query("from Annuncio a left join fetch a.categorie c where a.id = ?1")
    Annuncio findSingleAnnuncioEager(Long id);

}
