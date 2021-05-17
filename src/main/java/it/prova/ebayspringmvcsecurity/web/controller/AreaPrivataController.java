package it.prova.ebayspringmvcsecurity.web.controller;

import it.prova.ebayspringmvcsecurity.model.EditUtenteParam;
import it.prova.ebayspringmvcsecurity.model.Utente;
import it.prova.ebayspringmvcsecurity.service.acquisto.AcquistoService;
import it.prova.ebayspringmvcsecurity.service.annuncio.AnnuncioService;
import it.prova.ebayspringmvcsecurity.service.ruolo.RuoloService;
import it.prova.ebayspringmvcsecurity.service.utente.UtenteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

    @Autowired
    private RuoloService ruoloService;


    @GetMapping("/areaprivata")
    public String accediAreaPrivata(Principal principal, Model model) {
        Utente utenteInSessione = utenteService.findByUsername(principal.getName());
        model.addAttribute("lista_acquisti_utente", acquistoService.findByUtente(utenteInSessione));
        model.addAttribute("lista_annunci_utente", annuncioService.findAllByUtente(utenteInSessione));
        model.addAttribute("show_utente_attribute", utenteInSessione);
        return "/areaprivata/areaprivata";
    }

    @GetMapping("/modificaDatiAccount")
    public String editUtente(Principal principal, Model model) {
        Utente utenteInSessione = utenteService.findByUsername(principal.getName());
        model.addAttribute("ruoli_list_attribute", ruoloService.listAll());
        model.addAttribute("edit_utente_attribute", utenteService.caricaSingoloUtente(utenteInSessione.getId()));
        return "/areaprivata/modificaDatiAccount";
    }

    @PostMapping("/update")
    public String updateUtente(@Validated(EditUtenteParam.class) @ModelAttribute("edit_utente_attribute") Utente utente, BindingResult result,
                               RedirectAttributes redirectAttrs) {
        Utente utenteItem = utenteService.caricaSingoloUtente(utente.getId());

        if (result.hasErrors()) {
            return "/areaprivata/modificaDatiAccount";
        }
        Utente utenteInstance = utenteService.caricaSingoloUtente(utente.getId());
        utente.setPassword(utenteInstance.getPassword());
        utente.setStato(utenteInstance.getStato());
        utente.setAcquisti(utenteInstance.getAcquisti());
        utente.setDateCreated(utenteInstance.getDateCreated());
        utenteService.aggiorna(utente);

        redirectAttrs.addFlashAttribute("successMessage", "Operazione eseguita correttamente");
        return "redirect:/areaprivata/areaprivata";
    }


    @GetMapping("/eliminaAnnuncio/{idAnnuncio}")
    public String eliminaAnnuncio(@PathVariable(required = true) Long idAnnuncio, Model model) {
        model.addAttribute("dettaglio_articolo_attr", annuncioService.caricaSingoloAnnuncioEager(idAnnuncio));

        return "/areaprivata/eliminaAnnuncio";
    }
}
