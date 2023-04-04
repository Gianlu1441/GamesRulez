package com.generation.randomicsdogs.gamesrulez.controllers;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.generation.randomicsdogs.gamesrulez.dao.DAOGames;
import com.generation.randomicsdogs.gamesrulez.entities.Utente;


@Controller
public class HomeController
{	
	@Autowired 
    public DAOGames dg;
    @GetMapping("/")
    public String home(HttpSession session, Model model)
    {    model.addAttribute("tutti",dg.leggiTutti());
        model.addAttribute("user",(Utente) session.getAttribute("user"));
        if(model.getAttribute("user") == null)
        {
            return "home.jsp";
        }
        else
        {
            return "home.jsp";
        }
    }

	@GetMapping("/errorehtml")
	public String errore(HttpSession session, Model model)
	{
		return "errorehtml.html";
	
		
	}

	
}
