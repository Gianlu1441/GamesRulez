package com.generation.randomicsdogs.gamesrulez.entities;
import entities.Entity;
public class Utente extends Entity {
	private String username;
	private String password;
	private String nome;
	private String cognome;
	private String email;
	private boolean admin;
	private String datanascita;
	
	
	public Utente () {}
	
	

	public Utente(int id, String username, String password, String nome, String cognome, String email, String admin_check,
			String datanascita) {
		super(id);
		this.username = username;
		this.password = password;
		this.nome = nome;
		this.cognome = cognome;
		this.email = email;
		setAdmin(admin_check);
		this.datanascita=datanascita;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getNome() {
		return nome;
	}


	public void setNome(String nome) {
		this.nome = nome;
	}


	public String getCognome() {
		return cognome;
	}


	public void setCognome(String cognome) {
		this.cognome = cognome;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public boolean isAdmin() {
		return admin;
	}


	public void setAdmin(String admin_check) {
		this.admin = (admin_check.equalsIgnoreCase("1"));
	}


	public String getDataNascita() {
		return datanascita;
	}

	
	
	public void setDataNascita(String dataNascita) {
		System.out.println(dataNascita);
		this.datanascita = dataNascita;
	}

	
	@Override
	public String toString() {
		return "Utente->\nId: " + getId()+"\n username: " + username + "\n password: " + password + "\n nome: " + nome + "\n cognome: " + cognome
				+ "\n email: " + email + "\n admin: " + admin + "\n dataNascita:" + datanascita ;
	}
	
	
	
	
	
	

}
