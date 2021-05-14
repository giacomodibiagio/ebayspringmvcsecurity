package it.prova.ebayspringmvcsecurity.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping(value = {"/home",""})
	public String loginMessage() {
		return "open/index";
	}
}
