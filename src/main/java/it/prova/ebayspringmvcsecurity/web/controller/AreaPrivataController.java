package it.prova.ebayspringmvcsecurity.web.controller;

import it.prova.ebayspringmvcsecurity.model.Utente;
import it.prova.ebayspringmvcsecurity.service.acquisto.AcquistoService;
import it.prova.ebayspringmvcsecurity.service.annuncio.AnnuncioService;
import it.prova.ebayspringmvcsecurity.service.utente.UtenteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;

@Controller
@RequestMapping(value = "/areaprivata")
public class AreaPrivataController {

    @Autowired
    private UtenteService utenteService;

    @Autowired
    private AcquistoService acquistoService;

    @Autowired
    private AnnuncioService annuncioService;


    @GetMapping("/areaprivata")
    public String accediAreaPrivata(Principal principal, Model model) {
        Utente utenteInSessione = utenteService.findByUsername(principal.getName());
        model.addAttribute("lista_acquisti_utente", acquistoService.findByUtente(utenteInSessione));
        model.addAttribute("lista_annunci_utente", annuncioService.findAllByUtente(utenteInSessione));
        model.addAttribute("show_utente_attribute", utenteInSessione);
        return "/areaprivata/areaprivata";
    }
}
