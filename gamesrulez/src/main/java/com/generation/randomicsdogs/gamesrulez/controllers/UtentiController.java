package com.generation.randomicsdogs.gamesrulez.controllers;
import java.util.*;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.generation.randomicsdogs.gamesrulez.dao.DAOGames;
import com.generation.randomicsdogs.gamesrulez.dao.DAOUtenti;
import com.generation.randomicsdogs.gamesrulez.entities.Utente;

@Controller
@RequestMapping("/utenti")
public class UtentiController
{
	@Autowired
	public DAOUtenti du;
	
	@Autowired
	public DAOUtenti db;
	
	@Autowired
	public DAOGames dg;
	
	@Autowired
	public ApplicationContext context;
	
	
	//Questo mapping sfrutta il metodo caricaUtente per caricare cercare e caricare l'utente
	//nella SESSION e renderlo disponibile su ogni pagina.
	//Se non riesce va in nullpointer oppure in exception generica
	@GetMapping("/login")
	public String login(@RequestParam Map<String,String> inputs, HttpSession session)
	{
		String user = inputs.get("username");
		String pass = inputs.get("userpassword");
		System.out.println("user "+user+" "+"pass "+pass);
		try
		{
			Utente u = du.caricaUtente(user, pass);
			System.out.println(u.toString());
			
			session.setAttribute("user", u);
			return "redirect:/utenti/profilo";
		}
		catch(NullPointerException e)
		{
			System.out.println("NullPointer su login");
			return "redirect:/errorehtml";
		}
		catch(Exception e)
		{
			System.out.println("Exception su login");
			e.printStackTrace();
			return "redirect:/errorehtml";
		}
	}
	
	@GetMapping("/logout")
	public String login(HttpSession session)
	{
		session.setAttribute("user", null);
		return "redirect:/";
	}
	
	@GetMapping("/profilo")
	public String formlogin(HttpSession session, Model model)
	{
		model.addAttribute("user",(Utente) session.getAttribute("user"));
		
		int idUtente = ((Utente) session.getAttribute("user")).getId();
		
		model.addAttribute("listagiochi",(((Utente) session.getAttribute("user")).isAdmin())
				?
				dg.leggiTutti()
				:
				du.listaGiochi(idUtente));
		return "/utenti/profilo.jsp";
	}
	
	@GetMapping("/formregistrati")
	public String formregistrati(HttpSession session){
		
		if(session.getAttribute("user")==null) {
			return "/utenti/formregistrati.html";
		}else {
			return "/utenti/profilo.html";
		}
	}
	@GetMapping("/registrati")
	public String registrati(@RequestParam Map<String,String> inputs, HttpSession session){
		
	if(du.create(inputs)) {
		System.out.println("Inserimento avvenuto con successo");
		
		String user = inputs.get("username");
		String pass = inputs.get("userPassword");
		System.out.println("user "+user+" "+"pass "+pass);
		try
		{
			Utente u = du.caricaUtente(user, pass);
			System.out.println(u.toString());
			
			session.setAttribute("user", u);
			return "redirect:/utenti/profilo";
		}
		catch(NullPointerException e)
		{
			System.out.println("NullPointer su login");
			return "redirect:/errorehtml";
		}
		catch(Exception e)
		{
			System.out.println("Exception su login");
			e.printStackTrace();
			return "redirect:/errorehtml";
		}
	

	}else {
		System.out.println("Something wrong Padawan!");
		return "redirect:/errorehtml";
	}
		
	}
	
	
		

	
	
	
	
	
	
	
	
	
	
}