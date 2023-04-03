package com.generation.randomicsdogs.gamesrulez.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import dao.Database;

public class DAOListGames {

	@Autowired
	public Database db;
	
	public List<Map<String,String>> leggiTutti()
	{
		
		return db.rows("select * from listgame");
	}

	
	public boolean delete(String giocoId, String utenteId )
	{
		String query = "delete from listgame where giochi_id = "+giocoId +" and utenti_id = "+ utenteId+" ";
		return db.update(query);
	}
	
	public boolean update(Map<String,String> m) {
		String query = "update listgame set utenti_id = ? , giochi_id = ? where id = ? ";
		
		return db.update(query, m.get("utenti_id"), m.get("giochi_id"));
	}
	
	public boolean create2(Map<String, String> m) {
		
		String query = "insert into listgame (utenti_id, giochi_id) values (?,?)";
		
		return db.update(query, m.get("utenti_id"), m.get("giochi_id"));
	}
	
public boolean create(String utenteId, String giocoId) {
		
		String query = "insert into listgame (utenti_id, giochi_id) values (?,?)";
		
		return db.update(query, utenteId, giocoId);
	}
		
}