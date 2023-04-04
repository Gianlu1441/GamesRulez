package com.generation.randomicsdogs.gamesrulez.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.generation.randomicsdogs.gamesrulez.dao.DAOUtenti;


@Controller
	@RequestMapping("/utenti/profilo")
public class ProfiloController {
	@Autowired
	public DAOUtenti du;
	
	@Autowired
	public ApplicationContext context;
	
	@GetMapping("/profilo")
	public String profilo()
	{
		return "/utenti/profilo.jsp";
	}


}
