<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.generation.randomicsdogs.gamesrulez.entities.*"%>
<%	List<Map<String,String>> tutti = (List<Map<String,String>>) request.getAttribute("tutti");%>
<%	if(!((Utente) request.getAttribute("user")==null)){
	Utente u = (Utente) request.getAttribute("user");
	}%>
<html>
<head>
<link rel="icon" href="/res/Image20230329185711.png">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Rubik+Iso&display=swap"
	rel="stylesheet">
<link href="stile/stile.css" type="text/css" rel="stylesheet" />
<meta charset="ISO-8859-1">
<title>RANDOMIC DOGS</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" 
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script src="script/script.js"></script>
</head>
<body>

	<div class="imgGameRulez" style="text-align: center">
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
			
		</div>
	</nav>

	

<!-- container A -->
	<div class="container-fluid" id="overlayLogin">


		<div class="wrapper fadeInDown">
			<div id="formContent">
				<!-- Tabs Titles -->
				<div class="col-12" style="text-align: right"><a href="" onclick="offLogin()" > <img  src="/res/crocetta.png" width="20%"> </a>   </div>
				<h2 class="active">Accedi</h2>
				<!-- Icon -->
				<div class="fadeIn first">
					<img src="/res/Image20230329185118.png" id="icon"
						alt="User Icon" />
				</div>

				<!-- Login Form -->
				<form action="/utenti/login" method="get">
					<input type="text" id="login" class="fadeIn second" name="username"
						placeholder="username">
						<br>
						 <input type="password" id="password"
						class="fadeIn third" name="userpassword" placeholder="password">
						<br>
					<input type="submit" class="fadeIn fourth" value="LOGIN">
				</form>
				
			</div>
		</div>

	</div>

	<!-- container A end -->
	<!-- container B -->
	<div class="container-fluid" id="overlaySignin">


		<div class="wrapper fadeInDown">
			<div id="formContent">
				<!-- Tabs Titles -->
				<div class="col-12" style="text-align: right"><a href="/"> <img  src="/res/crocetta.png" width="20%"> </a>   </div>
				<h2 class="active">Registrati</h2>
				<!-- Icon -->
				<div class="fadeIn first">
					<img src="/res/Cane.png" id="icon"
						alt="User Icon" />
				</div>

				<!-- Login Form -->
				<form action="/utenti/registrati" method="get">
					<input type="text" id="name" class="fadeIn second" name="nome"
						placeholder="Nome" required>
						<br>
						 <input type="text" id="cognome"
						class="fadeIn second" name="cognome" placeholder="Cognome" required>
						<br>
					<input type="text" id="user" class="fadeIn second" name="username"
						placeholder="User" required>
						<br>
						<input type="password" id="password" class="fadeIn second" name="userPassword"
						placeholder="Password" required>
						<br>
						 <input type="date" id="dataNascita"
						class="fadeIn second" name="datanascita" required value="">
						<br>
					<input type="email" id="email" class="fadeIn second" name="email"
						placeholder="E-mail" required>
						<br>
					<input type="submit" class="fadeIn fourth" value="REGISTRATI">
				</form>
				
			</div>
		</div>

	</div>
	
<!-- container B end-->
	<div class="container mt-sm-5">
		<div class="row ow align-items-center">
		<div class="col-3 col-sm-1"></div>
			<div class="col-6 col-sm-10 " style="margin-top: 10%;">
			
				<form class="d-flex" role="search" method="get" action="/giochi/cerca">
				<input class="form-control me-2" type="search" placeholder="Cerca"
		               aria-label="Search" name="valoriRicerca">
				<button class="btn btn-outline-success" type="submit">Cerca</button>
				</form>
			</div>
		<div class="col-3 col-sm-1"></div>
		</div>
	</div>  

	<!-- Footer -->
	<footer class="text-center text-lg-start bg-white text-muted d-xxs-none d-xs-none d-sm-none d-md-block align-baseline">
		<!-- Copyright -->
		<div class="text-center p-4"
			style="background-color: rgba(0, 0, 0, 0.025);">
			© 2021 Copyright: <a class="text-reset fw-bold"
				href="https://random.dog/" target="_blank">Randomics Dogs</a>
				<h5>
					 Se mancano dei giochi contattaci qui: <a href="mailto: skullofnakedsnake@gmail.com">randomicsgods@boardgame.com</a>
				</h5>
		</div>
		<!-- Copyright -->
	</footer>
	<!-- Footer -->

<!-- 
   / \__		
  (    @\___	*WOOF WOOF*
  /         O
 /   (_____/
/_____/   U
 -->


</body>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous">
</script>
</html>