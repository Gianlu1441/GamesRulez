package com.generation.randomicsdogs.gamesrulez.dao;
import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import com.generation.randomicsdogs.gamesrulez.entities.Utente;
import dao.Database;

public class DAOUtenti
{
	@Autowired
	public Database db;
	
	@Autowired
	public ApplicationContext context;
	
	
	public List<Map<String,String>> read(String query, String... params)
	{
		return db.rows(query, params);
	}
	
	public List<Map<String,String>> leggiTutti()
	{
		return db.rows("select * from utenti");
	}
	
	public boolean delete(int id)
	{
		String query = "delete from utenti where id = ?";
		return db.update(query, id + "");
	}
	
	public boolean create(Map<String,String> m)
	{
		String query = "insert into utenti (nome,cognome,username,userPassword, dataNascita, email) values (?,?,?,?,?,?)";
		return db.update(query, m.get("nome"), m.get("cognome"), 
								m.get("username"), m.get("userPassword"),
								m.get("datanascita"), m.get("email"));
	}
	
	public boolean update(Map<String,String> m)
	{
		String query = "update utenti set nome = ?, cognome = ?, username = ?, userPassword = ? "
					+  "dataNascita = ? email = ? admin = ? where id = ?";
		return db.update(query, m.get("nome"), m.get("cognome"), 
								m.get("username"), m.get("userPassword"),
								m.get("datanascita"), m.get("email"), 
								m.get("admin"));
		}
	
	public Map<String, String> cercaPerId(int id)
	{
		String query = "select * from utenti where id = ?";
		return db.row(query, id + "");
	}
	
	public Map<String, String> autentica(String username, String password)
	{
		String query = "select * from utenti where username = ? and userpassword = ?";
		return db.row(query, username, password);
	}
	

		public Utente caricaUtente(String user, String pass)
		{
			Utente u = null;
			String query = 	"select * from utenti where username = ? and userpassword = ?";
			Map<String,String> m = db.row(query, user, pass);
			if(m != null)
			{
				//String id_check, String username, String password, String nome, String cognome, String email, String admin_check,String dataNascita_check)				
				int id =Integer.parseInt( m.get("id"));
				switch(m.get("admin"))
				{
					case "1":
						u = (Utente)context.getBean("user",id, m.get("username"), m.get("userpassword"), m.get("nome"),
								m.get("cognome"), m.get("email"), m.get("admin"), m.get("datanascita"));
						
					break;
					case "0":
						u = (Utente) context.getBean("user",id, m.get("username"), m.get("userpassword"), m.get("nome"),
								m.get("cognome"), m.get("email"), m.get("admin"), m.get("datanascita"));
					break;
				}
			}
			return u;
		
	}
	
		public List<Map<String,String>> listaGiochi(int idUtente)
		{
			String query =	"select distinct giochi.id, \n"
					+ "giochi.titolo, \n"
					+ "giochi.descrizione, \n"
					+ "giochi.regole, \n"
					+ "giochi.mingiocatori, \n"
					+ "giochi.maxgiocatori, \n"
					+ "giochi.etaminima, \n"
					+ "giochi.duratamedia, \n"
					+ "giochi.immagini, \n"
					+ "giochi.linkamazon \n"
					+ "from utenti \n"
					+ "inner join listgame \n"
					+ "on \n"
					+ "utenti.id = listgame.utenti_id \n"
					+ "inner join giochi \n"
					+ "on \n"
					+ "listgame.giochi_id = giochi.id \n"
					+ "where utenti.id=?;";
			return db.rows(query, idUtente + "");
		}
		
}