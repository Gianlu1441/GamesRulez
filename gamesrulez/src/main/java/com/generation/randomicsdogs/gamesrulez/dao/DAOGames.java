package com.generation.randomicsdogs.gamesrulez.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import dao.Database;

public class DAOGames {

	@Autowired
	public Database db;
	
	public List<Map<String,String>> read(String query, String... params)
	{
		return db.rows(query, params);
	}
	
	public List<Map<String,String>> leggiTutti()
	{
		return db.rows("select * from giochi");
	}
	
	public boolean delete(int id)
	{
		String query = "delete from giochi where id = ?";
		return db.update(query, id + "");
	}

	public boolean create(Map<String,String> m)
	{
		String query = "insert into giochi (titolo,descrizione,regole,minGiocatori,etaMinima"
						+",durataMedia,linkAmazon,maxGiocatori,immagini) values (?,?,?,?,?,?,?,?,?)";
		return db.update(query, m.get("titolo"), m.get("descrizione"), 
								m.get("regole"), m.get("minGiocatori"), 
								m.get("etaMinima"),m.get("durataMedia"), 
								m.get("linkAmazon"),m.get("maxGiocatori"), 
								m.get("immagini"));
	}
	
	public boolean update(Map<String,String> m)
	{
		String query = "update giochi set titolo = ?, descrizione = ?, regole = ?, mingiocatori = ?,"
					  +"etaminima = ?, duratamedia = ?,linkamazon = ?, maxgiocatori = ?, immagini = ?, categoria = ? where id = ?";
		return db.update(query, m.get("titolo"),
								m.get("descrizione"), m.get("regole"), 
								m.get("mingiocatori"), m.get("etaminima"), 
								m.get("duratamedia"), m.get("linkamazon"),
								m.get("maxgiocatori"), m.get("immagini"),
								m.get("categoria"),
								m.get("id"));
		}
	
	public Map<String, String> cercaPerId(int id)
	{
		String query = "select * from giochi where id = ?";
		return db.row(query, id + "");
	}


	public List<Map<String, String>> cercaPerTitolo (String valore){

        String query = "select * from giochi where titolo LIKE '%"+ valore +"%' ;";
        return db.rows(query);

    }

public List<Map<String, String>> giochiMinori(){
		
		return db.rows( "select * from giochi where giochi.etaMinima<18");
		
	}
public List<Map<String, String>> giochiMinGio4(){	
	return db.rows( "select * from giochi where giochi.minGiocatori>=4");
	
}

public List<Map<String, String>> giochiDurataMax60(){
	
	return db.rows( "select * from giochi where giochi.durataMedia<=60");	
}

public List<Map<String, String>> giochi2persone(){
	
	return db.rows( "select * from giochi where giochi.maxGiocatori=2");

	}

public List<Map<String, String>> giochiStrategia(){
	
	return db.rows( "select * from giochi where giochi.categoria='Strategia'");
	
}


public List<Map<String, String>> giochiCarte(){
	
	return db.rows( "select * from giochi where giochi.categoria='Carte'");
	
}


public List<Map<String, String>> giochiCoop(){
	
	return db.rows( "select * from giochi where giochi.categoria='Cooperativo'");
	
}


public List<Map<String, String>> giochiParty(){
	
	return db.rows( "select * from giochi where giochi.categoria='Party'");
	
}



}
