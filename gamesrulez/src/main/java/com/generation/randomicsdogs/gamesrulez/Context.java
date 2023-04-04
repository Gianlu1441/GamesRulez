package com.generation.randomicsdogs.gamesrulez;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;
import com.generation.randomicsdogs.gamesrulez.dao.DAOGames;
import com.generation.randomicsdogs.gamesrulez.dao.DAOListGames;
import com.generation.randomicsdogs.gamesrulez.dao.DAOPropostaGiochi;
import com.generation.randomicsdogs.gamesrulez.dao.DAOUtenti;
import com.generation.randomicsdogs.gamesrulez.entities.Utente;
import dao.Database;

@Configuration
public class Context
{
	@Bean
	public Database db()
	{
		return new Database("boardgame","root","root");
	}	
	@Bean
	public DAOUtenti du()
	{
		return new DAOUtenti();
	}
	@Bean
	public DAOGames dg()
	{
		return new DAOGames();
	}
	
	@Bean
	public DAOListGames dls () {
		
		return new DAOListGames();
	}
	
	@Bean 
	public DAOPropostaGiochi pg () {
		return new DAOPropostaGiochi();
	}
	
	@Bean
	@Scope("prototype")
	public Utente user(int id, String username, String password, String nome, String congome, String email, String admin , String datanascita) {
		
		return new Utente(id,username,password,nome,congome,email,admin,datanascita);
	}
}