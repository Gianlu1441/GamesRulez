package com.generation.randomicsdogs.gamesrulez.controllers;

import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.generation.randomicsdogs.gamesrulez.dao.DAOGames;
import com.generation.randomicsdogs.gamesrulez.dao.DAOListGames;
import com.generation.randomicsdogs.gamesrulez.entities.Utente;

@Controller
@RequestMapping("/giochi")	//lo
public class GiochiController {
	
	@Autowired
	public DAOGames dg;
	
	@Autowired
	public DAOListGames dl;
	
	@GetMapping("/elenco")
	public String elenco( HttpSession session,Model model)
	{
		model.addAttribute("tutti",dg.leggiTutti());
		model.addAttribute("user",(Utente) session.getAttribute("user"));
		if(model.getAttribute("user") == null)
		{
			return "/utenti/elencoVisitatore.jsp";
		}
		else
		{
			return "/giochi/elenco.jsp";
		}
	}
	@GetMapping("aggiungigioco")
	public String aggiungiGiocoAllaListaUtente(@RequestParam("id") String idGioco, String idUtente, HttpSession session)
	{
		idUtente = (((Utente) session.getAttribute("user")).getId())+"";
		dl.create(idUtente, idGioco);
		return "redirect:/giochi/elenco";
		
	}
	
	@GetMapping("eliminagioco")
	public String eliminagioco(@RequestParam("id") String idGioco,  String idUtente, HttpSession session)
	{
		idUtente = (((Utente) session.getAttribute("user")).getId())+"";
		System.out.println("Gioco: "+idGioco+" Utente: "+idUtente);
		
		dl.delete(idGioco,idUtente);
		
		return "redirect:/utenti/profilo";
	}
	@GetMapping("/elimina")
    public String eliminagiocoDaDB(@RequestParam("id") int idGioco ,HttpSession session, Model model) {
        System.out.println("Gioco eliminato");
        dg.delete(idGioco);
        model.addAttribute("user",(Utente) session.getAttribute("user"));
        if(model.getAttribute("user") == null){
			return "redirect:/utenti/elencoVisitatore";
		}else{
			return "redirect:/giochi/elenco";
		}
	}
    
	@GetMapping("/cerca")
    public String cercaGioco(@RequestParam("valoriRicerca") String valoriRicerca, HttpSession session, Model model) {

        System.out.println("Sono dentro ");

        model.addAttribute("tutti",dg.cercaPerTitolo(valoriRicerca));
        System.out.println(valoriRicerca);
        System.out.println(dg.cercaPerTitolo(valoriRicerca));
        model.addAttribute("user",(Utente) session.getAttribute("user"));
        if(model.getAttribute("user") == null)
        {
            System.out.println("cavoletti ");
            System.out.println(valoriRicerca);
            return "/utenti/elencoVisitatore.jsp";
        }
        else
        {
            System.out.println("errore di cerca ");
            return "/giochi/elenco.jsp";
        }

    }
	
	@GetMapping("/minori18")
	public String elencominori(HttpSession session, Model model)
	{
		model.addAttribute("tutti",dg.giochiMinori());
		model.addAttribute("user",(Utente) session.getAttribute("user"));
		if(model.getAttribute("user") == null)
		{
			return "/utenti/elencoVisitatore.jsp";
		}
		else
		{
			return "/giochi/elenco.jsp";
		}
	}
	@GetMapping("/giochimingio4")
	public String elencomingio4 ( HttpSession session,Model model)
	{
		model.addAttribute("tutti",dg.giochiMinGio4());
		model.addAttribute("user",(Utente) session.getAttribute("user"));
		if(model.getAttribute("user") == null)
		{
			return "/utenti/elencoVisitatore.jsp";
		}
		else
		{
			return "/giochi/elenco.jsp";
		}
	}

	@GetMapping("/giochiDurataMax60")
	public String giochiDurataMax60(HttpSession session,Model model)
	{
		model.addAttribute("tutti",dg.giochiDurataMax60());
		model.addAttribute("user",(Utente) session.getAttribute("user"));
		if(model.getAttribute("user") == null)
		{
			return "/utenti/elencoVisitatore.jsp";
		}
		else
		{
			return "/giochi/elenco.jsp";
		}
	}
	
	@GetMapping("/giochi2persone")
	public String giochi2persone(HttpSession session,Model model)
	{
		model.addAttribute("tutti",dg.giochi2persone());
		model.addAttribute("user",(Utente) session.getAttribute("user"));
		if(model.getAttribute("user") == null)
		{
			return "/utenti/elencoVisitatore.jsp";
		}
		else
		{
			return "/giochi/elenco.jsp";
		}
	}
	
	@GetMapping("/giochiStrategia")
	public String giochiStrategia(HttpSession session, Model model)
	{
		model.addAttribute("tutti",dg.giochiStrategia());
		model.addAttribute("user",(Utente) session.getAttribute("user"));
		if(model.getAttribute("user") == null)
		{
			return "/utenti/elencoVisitatore.jsp";
		}
		else
		{
			return "/giochi/elenco.jsp";
		}
	}



	@GetMapping("/giochiCarte")
	public String giochiCarte(HttpSession session, Model model)
	{
		model.addAttribute("tutti",dg.giochiCarte());
		model.addAttribute("user",(Utente) session.getAttribute("user"));
		if(model.getAttribute("user") == null)
		{
			return "/utenti/elencoVisitatore.jsp";
		}
		else
		{
			return "/giochi/elenco.jsp";
		}
	}	



@GetMapping("/giochiCoop")
	public String giochiCoop(HttpSession session, Model model)
	{
		model.addAttribute("tutti",dg.giochiCoop());
		model.addAttribute("user",(Utente) session.getAttribute("user"));
		if(model.getAttribute("user") == null)
		{
			return "/utenti/elencoVisitatore.jsp";
		}
		else
		{
			return "/giochi/elenco.jsp";
		}
	}	



@GetMapping("/giochiParty")
	public String giochiParty(HttpSession session, Model model)
	{
		model.addAttribute("tutti",dg.giochiParty());
		model.addAttribute("user",(Utente) session.getAttribute("user"));
		if(model.getAttribute("user") == null)
		{
			return "/utenti/elencoVisitatore.jsp";
		}
		else
		{
			return "/giochi/elenco.jsp";
		}
	}
	
	@GetMapping("/formmoficagioco")
	public String modificagioco(@RequestParam("id") int idgiocoEliminare , Model model)
	{
		model.addAttribute("mapgiocomod", dg.cercaPerId(idgiocoEliminare));
		return "/giochi/formmodificagioco.jsp";
	}
	
	
	@GetMapping("modificagioco")
	public String aggiornagioco(@RequestParam Map<String, String> nuovidati) {
		
		System.out.println(nuovidati);
		
		if(dg.update(nuovidati)) {
			System.out.println("Aggiornato");
		return "redirect:/utenti/profilo/#";
		}else {
			System.out.print("Non riuscito");		
			return "/errorehtml.html";
		}
	}
}
	
	
	

