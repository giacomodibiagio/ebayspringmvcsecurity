package it.prova.ebayspringmvcsecurity.web.controller;

import it.prova.ebayspringmvcsecurity.model.Ruolo;
import it.prova.ebayspringmvcsecurity.model.StatoUtente;
import it.prova.ebayspringmvcsecurity.model.Utente;
import it.prova.ebayspringmvcsecurity.service.ruolo.RuoloService;
import it.prova.ebayspringmvcsecurity.service.utente.UtenteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping(value = "/utente")
public class UtenteController {

	@Autowired
	private UtenteService utenteService;

	@Autowired
	private RuoloService ruoloService;

	@GetMapping
	public ModelAndView listAllUtenti() {
		ModelAndView mv = new ModelAndView();
		List<Utente> utenti = utenteService.listAllUtenti();
		mv.addObject("utente_list_attribute", utenti);
		mv.setViewName("utente/list");
		return mv;
	}

	@GetMapping("/search")
	public String searchUtente(ModelMap model) {
		List<Ruolo> ruoli = ruoloService.listAll();
		List<StatoUtente> statiUtente = utenteService.listAllStati();
		model.addAttribute("ruoli_list_attribute", ruoli);
		model.addAttribute("stato_list_attribute", statiUtente);
		return "utente/search";
	}

	@PostMapping("/list")
	public String listUtenti(Utente utenteExample, ModelMap model) {
		List<Utente> utenti = utenteService.findByExample(utenteExample);
		model.addAttribute("utente_list_attribute", utenti);
		return "utente/list";
	}

	@PostMapping("/cambiaStato")
	public String cambiaStato(@RequestParam(name = "idUtenteForChangingStato", required = true) Long idUtente) {
		utenteService.invertUserAbilitation(idUtente);
		return "redirect:/utente";
	}

	@GetMapping("/insert")
	public String createUtente(Model model) {
		List<Ruolo> ruoli = ruoloService.listAll();
		model.addAttribute("insert_utente_attribute", new Utente());
		model.addAttribute("ruoli_list_attribute", ruoli);
		return "utente/insert";
	}

	@PostMapping("/save")
	public String saveContribuente(@Valid @ModelAttribute("insert_utente_attribute") Utente utente, BindingResult result, RedirectAttributes redirectAttrs) {
		if (result.hasErrors()) {
			return "utente/insert";
		}
		utente.setStato(StatoUtente.CREATO);
		utente.setCreditoResiduo(0D);
		utenteService.inserisciNuovo(utente);
		redirectAttrs.addFlashAttribute("successMessage", "Operazione eseguita correttamente");
		return "redirect:/utente";
	}

}
