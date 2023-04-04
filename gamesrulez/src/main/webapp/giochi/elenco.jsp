<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.generation.randomicsdogs.gamesrulez.entities.*"%>
<%	List<Map<String,String>> tutti = (List<Map<String,String>>) request.getAttribute("tutti");%>
<%	
	Utente u = (Utente) request.getAttribute("user");
	%>
<html>
<head>
<link rel="icon" href="/res/Image20230329185711.png">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Rubik+Iso&display=swap"
	rel="stylesheet">
<link href="../stile.css" type="text/css" rel="stylesheet" />
<link href="/stile/StyleForJsp.css" type="text/css" rel="stylesheet" />
<meta charset="ISO-8859-1">
<title>RANDOMIC DOGS</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
	
	<style>
	#overlayLogin {
		display: none;
		position: absolute;
  		top: -50px;
  		left: 0;
  		width: 100%;
  		height: 100%
		}
		@import url('https://fonts.googleapis.com/css?family=Poppins');
	
	#overlaySignin {
		display: none;
		position: absolute;
		top: -50px;
	  	left: 0;
	  	width: 100%;
	  	height: 100%
		}
		@import url('https://fonts.googleapis.com/css?family=Poppins');

/* BASIC */


body {
  font-family: "Poppins", sans-serif;
}

a {
  color: #92badd;
  display:inline-block;
  text-decoration: none;
  font-weight: 400;
}

h2 {
  text-align: center;
  font-size: 16px;
  font-weight: 600;
  text-transform: uppercase;
  display:inline-block;
  margin: 40px 8px 10px 8px; 
  color: #cccccc;
}



/* STRUCTURE */

.wrapper {
  display: flex;
  align-items: center;
  flex-direction: column; 
  justify-content: center;
  width: 100%;
  min-height: 100%;
  padding: 20px;
}

#formContent {
  -webkit-border-radius: 10px 10px 10px 10px;
  border-radius: 10px 10px 10px 10px;
  background: #fff;
  padding: 30px;
  width: 90%;
  max-width: 450px;
  position: relative;
  padding: 0px;
  -webkit-box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
  box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
  text-align: center;
}

#formFooter {
  background-color: #f6f6f6;
  border-top: 1px solid #dce8f1;
  padding: 25px;
  text-align: center;
  -webkit-border-radius: 0 0 10px 10px;
  border-radius: 0 0 10px 10px;
}



/* TABS */

h2.inactive {
  color: #cccccc;
}

h2.active {
  color: #0d0d0d;
  border-bottom: 2px solid #5fbae9;
}



/* FORM TYPOGRAPHY*/

input[type=button], input[type=submit], input[type=reset]  {
  background-color: #56baed;
  border: none;
  color: white;
  padding: 15px 80px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  text-transform: uppercase;
  font-size: 13px;
  -webkit-box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
  box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
  margin: 5px 20px 40px 20px;
  -webkit-transition: all 0.3s ease-in-out;
  -moz-transition: all 0.3s ease-in-out;
  -ms-transition: all 0.3s ease-in-out;
  -o-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}

input[type=button]:hover, input[type=submit]:hover, input[type=reset]:hover  {
  background-color: #39ace7;
}

input[type=button]:active, input[type=submit]:active, input[type=reset]:active  {
  -moz-transform: scale(0.95);
  -webkit-transform: scale(0.95);
  -o-transform: scale(0.95);
  -ms-transform: scale(0.95);
  transform: scale(0.95);
}

input[type=text] {
  background-color: #f6f6f6;
  border: none;
  color: #0d0d0d;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 5px;
  width: 85%;
  border: 2px solid #f6f6f6;
  -webkit-transition: all 0.5s ease-in-out;
  -moz-transition: all 0.5s ease-in-out;
  -ms-transition: all 0.5s ease-in-out;
  -o-transition: all 0.5s ease-in-out;
  transition: all 0.5s ease-in-out;
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
}

input[type=password] {
  background-color: #f6f6f6;
  border: none;
  color: #0d0d0d;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 5px;
  width: 85%;
  border: 2px solid #f6f6f6;
  -webkit-transition: all 0.5s ease-in-out;
  -moz-transition: all 0.5s ease-in-out;
  -ms-transition: all 0.5s ease-in-out;
  -o-transition: all 0.5s ease-in-out;
  transition: all 0.5s ease-in-out;
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
}
input[type=text]:focus {
  background-color: #fff;
  border-bottom: 2px solid #5fbae9;
}

input[type=text]:placeholder {
  color: #cccccc;
}

input[type=password]:focus {
  background-color: #fff;
  border-bottom: 2px solid #5fbae9;
}

input[type=password]:placeholder {
  color: #cccccc;
}



/* ANIMATIONS */

/* Simple CSS3 Fade-in-down Animation */
.fadeInDown {
  -webkit-animation-name: fadeInDown;
  animation-name: fadeInDown;
  -webkit-animation-duration: 1s;
  animation-duration: 1s;
  -webkit-animation-fill-mode: both;
  animation-fill-mode: both;
}

@-webkit-keyframes fadeInDown {
  0% {
    opacity: 0;
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0);
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
}

@keyframes fadeInDown {
  0% {
    opacity: 0;
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0);
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
}

/* Simple CSS3 Fade-in Animation */
@-webkit-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
@-moz-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
@keyframes fadeIn { from { opacity:0; } to { opacity:1; } }

.fadeIn {
  opacity:0;
  -webkit-animation:fadeIn ease-in 1;
  -moz-animation:fadeIn ease-in 1;
  animation:fadeIn ease-in 1;

  -webkit-animation-fill-mode:forwards;
  -moz-animation-fill-mode:forwards;
  animation-fill-mode:forwards;

  -webkit-animation-duration:1s;
  -moz-animation-duration:1s;
  animation-duration:1s;
}

.fadeIn.first {
  -webkit-animation-delay: 0.4s;
  -moz-animation-delay: 0.4s;
  animation-delay: 0.4s;
}

.fadeIn.second {
  -webkit-animation-delay: 0.6s;
  -moz-animation-delay: 0.6s;
  animation-delay: 0.6s;
}

.fadeIn.third {
  -webkit-animation-delay: 0.8s;
  -moz-animation-delay: 0.8s;
  animation-delay: 0.8s;
}

.fadeIn.fourth {
  -webkit-animation-delay: 1s;
  -moz-animation-delay: 1s;
  animation-delay: 1s;
}

/* Simple CSS3 Fade-in Animation */
.underlineHover:after {
  display: block;
  left: 0;
  bottom: -10px;
  width: 0;
  height: 2px;
  background-color: #56baed;
  content: "";
  transition: width 0.2s;
}

/* OTHERS */

*:focus {
    outline: none;
} 

#icon {
  width:60%;
}

* {
  box-sizing: border-box;
}
.imgGameRulez {
           position: absolute;
            top: 0;
            left: 35%;
            width: 15%;
            height: 25%;
            z-index: 9999;
        }
        
 #dataNascita {
    width: 386px;
    height: 41px;
    text-align: center;
    background-color: #ffffffed;
    border-radius: 5px;
    cursor: pointer;
}
#email {
    width: 391px;
    height: 46px;
    text-align: center;
    background-color: #ffffffe8;
    border-radius: 7px;
    
}


	.bottoneAmazon{
	color: blue;
	background-image: url("/res/amazon_e-commerce_business_20574.png");
	height: 30px;
	width: 100%;
	background-position: center;
	background-size: cover;	
	cursor: pointer;
	border-radius: 12px;
	}
	
	.bottoneAmazon:hover {
	background-image: url("/res/IMG_20201014_0002.jpg");
	height: 30px;
	width: 100%;
	background-position: center;
	background-size: cover;	
	opacity: 0.6;
	}
	
	
	   
	footer {
	  position: fixed;
	  bottom: 0;
	  left: 0;
	  right: 0;
	  align-items: baseline;
	   
	}
	
	li {
		list-style-type: none;
	}
	

</style>

<script>
	function onLogin() {
		document.getElementById("overlayLogin").style.display = "block";
	}

	function offLogin() {
		document.getElementById("overlayLogin").style.display = "none";
	}
	function onSignin() {
		document.getElementById("overlaySignin").style.display = "block";
	}

	function offSignin() {
		document.getElementById("overlaySignin").style.display = "none";
	}
</script>

</head>
<body>

	<div class="imgGameRulez " style="text-align: center">
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

	

<!-- container A -->
	<div class="container-fluid" id="overlayLogin">


		<div class="wrapper fadeInDown">
			<div id="formContent">
				<!-- Tabs Titles -->
				<div class="col-12" style="text-align: right"><a href="/"> <img  src="/res/crocetta.png" width="20%"> </a>   </div>
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
					<input type="email" id="" class="fadeIn second" name="email"
						placeholder="E-mail" required>
						<br>
					<input type="submit" class="fadeIn fourth" value="LOGIN">
				</form>
				
			</div>
		</div>

	</div>

	<!-- container B end -->
		
		<br>
		<table>
			<tr>
				<td>
				<%=	u.isAdmin()?"":"ID"%>
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
					MININMO GIOCATORI
				</td>
				<td>
					ETÀ MINIMA
				</td>
				<td>
					DURATA MEDIA
				</td>
				<td>
					LINK AMAZON
				</td>
				<td>
					MASSIMO GIOCATORI
				</td>
				<td>
					IMMAGINI
					
				</td>
			</tr>
			<% for(Map<String,String> m : tutti) {%>
				
			<tr>
				<td><%=(u.isAdmin())?m.get("id"):"" %></td>
				<td><%= m.get("titolo")%></td>
				<td><%= m.get("descrizione")%></td>
				<td><%= m.get("regole")%></td>
				<td><%= m.get("mingiocatori")%></td>
				<td><%= m.get("etaminima")%></td>
				<td><%= m.get("duratamedia")%></td>
				<td><a href="<%= m.get("linkamazon")%>"><button class="bottoneAmazon"></button></a></td>
				<td><%= m.get("maxgiocatori")%></td>
				<td><img src="<%= m.get("immagini")%>" height="200px">
				</td>
				<td>
				<% if (u.isAdmin()){%>
					<%=""%>
				<%}else{ %>
				<a href='/giochi/aggiungigioco?id=<%= m.get("id")%>'>
				<button class='bottoneAddGame' value='bottoneAddGame'>Aggiungi alla tua lista</button></a>
				<%} %>

					</td>
				
									
			</tr>
			<%} %>
		</table>
<!-- Footer -->
	<footer class="text-center text-lg-start bg-white text-muted">
		<!-- Section: Social media -->
		<section
			class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
			<!-- Left -->
			<div class="me-5 d-none d-lg-block"></div>
			<!-- Left -->

			<!-- Right -->
			<div>
				<a href="" class="me-4 link-secondary"> <i class=""></i>
				</a> <a href="" class="me-4 link-secondary"> <i class=""></i>
				</a> <a href="" class="me-4 link-secondary"> <i class=""></i>
				</a> <a href="" class="me-4 link-secondary"> <i class=""></i>
				</a> <a href="" class="me-4 link-secondary"> <i class=""></i>
				</a>
			</div>
			<!-- Right -->
		</section>
		<!-- Section: Social media -->

		<!-- Section: Links  -->
		<section class="">
			<div class="container text-center text-md-start mt-5">
				<!-- Grid row -->
				<div class="row mt-3">
					<!-- Grid column -->
					<div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4"></div>
					<!-- Grid column -->

					<!-- Grid column -->
					<div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4"></div>
					<!-- Grid column -->

					<!-- Grid column -->
					<div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4"></div>
					<!-- Grid column -->

					<!-- Grid column -->
					<div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
					</div>
					<!-- Grid column -->
				</div>
				<!-- Grid row -->
			</div>
		</section>
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