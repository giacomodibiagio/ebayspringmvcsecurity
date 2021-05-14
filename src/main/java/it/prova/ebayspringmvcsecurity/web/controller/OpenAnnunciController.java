package it.prova.ebayspringmvcsecurity.web.controller;


import it.prova.ebayspringmvcsecurity.model.Annuncio;
import it.prova.ebayspringmvcsecurity.service.annuncio.AnnuncioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping(value = "/open")
public class OpenAnnunciController {

    @Autowired
    private AnnuncioService annuncioService;

    @PostMapping("/list")
    public String ricercaAnnunci(Annuncio annuncioExample, ModelMap model) {
        List<Annuncio> utenti = annuncioService.findByExample(annuncioExample);
        model.addAttribute("annunci_list_attribute", utenti);
        return "open/list";
    }

//    public String cambiaStato(@RequestParam(name = "idUtenteForChangingStato", required = true) Long idUtente) {


}
