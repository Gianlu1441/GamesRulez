<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.generation.randomicsdogs.gamesrulez.entities.*"%>
<%	List<Map<String,String>> lista = (List<Map<String,String>>) request.getAttribute("listagiochi");%>
<%Utente u = (Utente) request.getAttribute("user");
int i=0;%>
<html>
<head>
<link rel="icon" href="/res/Image20230329185711.png">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Rubik+Iso&display=swap"
	rel="stylesheet">
<link href="/stile/stile.css" type="text/css" rel="stylesheet" />
<meta charset="ISO-8859-1">
<title>RANDOMIC DOGS</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" 
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
</head>
<body>

	<div class="imgGameRulez " id="imgGameRulez" style="text-align: center">
		<a class="navbar-brand" href="/">
			<img src="/res/GamesRulez.png" width="50%" >
		</a>
	</div>

	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> 
						<img src='/res/Image20230329185118.png' width='30px'>
					</a>

						<ul class='dropdown-menu'>
							<li><%= ((Utente) request.getAttribute("user") == null)
									? " <button onclick='onLogin();offSignin()'>Login</button>"
									: "<a class='dropdown-item' href='/utenti/profilo'>Profilo</a>"%>
							</li>

							<li><%= ((Utente) request.getAttribute("user")== null)
	                      			?" <button onclick='onSignin();offLogin()'>Registrati</button>"
	                      			:"<a class='dropdown-item' href='/utenti/logout'>Esci</a>"%>
                      		</li>
						</ul>
					</li>
				</ul>
				
				<ul>
					<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="/giochi/elenco" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							Giochi </a>
					
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="/giochi/elenco">Tutti</a></li>
							<li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="/giochi/giochimingio4">Da 4 giocatori in su</a></li>
                            <li><a class="dropdown-item" href="/giochi/giochiDurataMax60">Durata massima 60 minuti</a></li>
                            <li><a class="dropdown-item" href="/giochi/giochi2persone">Da 2 giocatori</a></li>
                            <li><a class="dropdown-item" href="/giochi/minori18">Per maggiori di 18 anni</a></li>
                            <li><a class="dropdown-item" href="/giochi/giochiStrategia">Di Strategia</a></li>
                            <li><a class="dropdown-item" href="/giochi/giochiCarte">Di Carte</a></li>
                            <li><a class="dropdown-item" href="/giochi/giochiParty">Party</a></li>
                            <li><a class="dropdown-item" href="/giochi/giochiCoop">Cooperativi</a></li>
                        </ul>
					</li>
				</ul>
			</div>
			<ul>
				<li>
					<form class="d-flex" role="search" method="get" action="/giochi/cerca">
                        <input class="form-control me-2" type="search" placeholder="Cerca"
                            aria-label="Search" name="valoriRicerca">
                        <button class="btn btn-outline-success" type="submit">Cerca</button>
                    </form>
				</li>
			</ul>
		</div>
	</nav>

	<h1> La lista di <%= u.getUsername()%></h1>
		<h3><%= u.getNome()%> <%= u.getCognome()%></h3>

		
		<table>
			<tr>
				<td>
				<%=(u.isAdmin())?"ID":"" %>
				
				</td>
				<td>
					TITOLO
				</td>
				<td>
					DESCRIZIONE
				</td>
				<td>
					REGOLE
				</td>
				<td>
					GIOCATORI MINIMI
				</td>
				<td>
					GIOCATORI MASSIMI
				</td>
				<td>
					ETà MINIMA
				</td>
				<td>
					DURATA MEDIA
				</td>
				<td>
					LINK AMAZON
				</td>
				<td>
					IMMAGINE
				</td>
			</tr>

			<% for(Map<String,String> m : lista) {%>
			<tr>
				<td>
					<%=((u.isAdmin())?m.get("id"):"")%>
				</td>
				<td><%= m.get("titolo")%></td>
				<td><%= m.get("descrizione")%></td>
				<td><%= m.get("regole")%></td>
				<td><%= m.get("mingiocatori")%></td>
				<td><%= m.get("maxgiocatori")%></td>
				<td><%= m.get("etaminima")%></td>
				<td><%= m.get("duratamedia")%></td>
				<td><a href="<%= m.get("linkamazon")%>"><button class="bottoneAmazon"></button></a></td>
				<td><img src="<%= m.get("immagini")%>" height="200px"></td>
				<td>
				<% if (!(((Utente) request.getAttribute("user")).isAdmin())){ %>
					<%=""%>
				<%}else{ %>
				<a href="/giochi/elimina?id=<%= m.get("id") %>">
				<button class='bottoneAddGame' value='bottoneAddGame'>Elimina</button></a>
				<%} %>
					
				</td>
				<td>
				<% if (!(((Utente) request.getAttribute("user")).isAdmin())){ %>
					<%=""%>
				<%}else{ %>
				<a href="/giochi/modificagioco?id=<%= m.get("id") %>">
				<button class='bottoneAddGame' value='bottoneAddGame' onclick='document.getElementById("overlayModifica<%=i%>").style.display = "block";'>Modifica</button></a>
				<%} %>
				</td>
				<td>
				<% if (((Utente) request.getAttribute("user") == null)||(((Utente) request.getAttribute("user")).isAdmin())){ %>
					<%=""%>
				<%}else{ %>
				<a href="/giochi/eliminagioco?id=<%= m.get("id") %>">
				<button class='bottoneAddGame' value='bottoneAddGame'>Elimina dalla tua lista</button></a>
				<%} %>
				</td>
			</tr>
			<div class="container-fluid" id="overlayModifica<%=i%>" 
				style="display: none;
				position: absolute;
				top: -50px;
			  	left: 0;
			  	width: 100%;
			  	height: 100%">
			<div class="wrapper fadeInDown">
			<div id="formContent" style="background-color: #f6f6f6;
  border-top: 1px solid #dce8f1;
  padding: 25px;
  text-align: center;
  -webkit-border-radius: 0 0 10px 10px;
  border-radius: 0 0 10px 10px;">
				<!-- Tabs Titles -->
				<div class="col-12" style="text-align: right">
				<a href="#imgGameRulez" onclick='document.getElementById("overlayModifica<%=i%>").style.display = "none";'> 
				<img  src="/res/crocetta.png" width="20%"> </a></div>
				<h2 class="active">Modifica</h2>
				<!-- Login Form -->
				<form action="/giochi/modificagioco?id=<%= m.get("id") %>" method="get">
					<input type="text" id="titolo<%=i%>" class="fadeIn second" name="titolo"
						value="<%= m.get("titolo")%>" required>
						<br> 
					<input type="text" id="descrizione<%=i%>" class="fadeIn second" name="descrizione"
						value="<%= m.get("descrizione")%>" required>					
						<br>
					<input type="text" id="regole<%=i%>" class="fadeIn second" name="regole"
						value="<%= m.get("regole")%>" required>					
						<br>
					<input type="text" id="mingiocatori<%=i%>" class="fadeIn second" name="mingiocatori"
						value="<%= m.get("mingiocatori")%>" required>					
						<br>
					<input type="text" id="maxgiocatori<%=i%>" class="fadeIn second" name="maxgiocatori"
						value="<%= m.get("maxgiocatori")%>" required>					
						<br>
					<input type="text" id="etaminima<%=i%>" class="fadeIn second" name="etaminima"
						value="<%= m.get("etaminima")%>" required>					
						<br>
					<input type="text" id="linkamazon<%=i%>" class="fadeIn second" name="linkamazon"
						value="<%= m.get("linkamazon")%>" required>					
						<br>
						<img src="<%= m.get("immagini")%>" height="100px">
					<input type="text" id="immagini<%=i%>" class="fadeIn second" name="immagine"
						value="<%= m.get("immagini")%>" required>	  										
						<br>
					<input type="submit" class="fadeIn fourth" value="CONFERMA MODIFICA">
				</form>
				
			</div>
		</div>
	</div>
	<%i++;} %>		
		</table>
	
	
<!-- Footer -->
	<footer class="text-center text-lg-start bg-white text-muted">
		<!-- Section: Social media -->
		
		<!-- Section: Social media -->

		<!-- Section: Links  -->
		
		<!-- Section: Links  -->

		<!-- Copyright -->
		<div class="text-center p-4"
			style="background-color: rgba(0, 0, 0, 0.025);">
			© 2021 Copyright: <a class="text-reset fw-bold"
				href="https://random.dog/" target="_blank">Randomics Dogs</a>
		</div>
		<!-- Copyright -->
	</footer>
	<!-- Footer -->



</body>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous">
</script>

</html>

