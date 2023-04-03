
package com.generation.randomicsdogs.gamesrulez.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import dao.Database;

public class DAOPropostaGiochi {
	@Autowired
	public Database db;
	
	public List<Map<String,String>> read(String query, String... params)
	{
		return db.rows(query, params);
	}
	
	public List<Map<String,String>> leggiTutti()
	{
		return db.rows("select * from propostagiochi");
	}
	
	public boolean delete(int id)
	{
		String query = "delete from propostagiochi where id = ?";
		return db.update(query, id + "");
	}

	public boolean create(Map<String,String> m)
	{
		String query = "insert into propostagiochi (titolo,descrizione,regole,nGiocatori,etaMinima"
						+",durataMedia,maxGiocatori,utentePropostaId) values (?,?,?,?,?,?,?,?)";
		return db.update(query, m.get("titolo"), m.get("descrizione"), m.get("regole"), m.get("nGiocatori"), m.get("etaMinima"), 
								m.get("durataMedia"), m.get("maxGiocatori"), m.get("utentePropostaId"));
	}
	
	public boolean update(Map<String,String> m)
	{
		String query = "update propostagiochi set titolo = ?, descrizione = ?, regole = ? nGiocatori = ?,"
					  +"etaMinima = ?, durataMedia = ?, maxGiocatori = ?, utentePropostaId = ? where id = ?";
		return db.update(query, m.get("titolo"), m.get("descrizione"), m.get("regole"), m.get("nGiocatori"), m.get("etaMinima"), 
								m.get("durataMedia"), m.get("maxGiocatori"), m.get("utentePropostaId"));
		}
	
	public Map<String, String> cercaPerId(int id)
	{
		String query = "select * from propostagiochi where id = ?";
		return db.row(query, id + "");
	}
}
