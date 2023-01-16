<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ocaParchis" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!--  >%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%-->
<%@ attribute name="name" required="true" rtexprvalue="true"
	description="Name of the active menu: home, Oca Lobbies, vets or error"%>

	
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

<nav class="navbar navbar-inverse" role="navigation">
	<div class="container" style ="position:relative">
		<div class="navbar-header">
			<a class="navbar-brand" href="<spring:url value="/" htmlEscape="true" />"><span style="font-family: 'Impact', cursive; font-size: 30px; color:#1b8a37">POPUCOC</span></a>
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#main-navbar">
				<span class="sr-only"><os-p>Toggle navigation</os-p></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>
		<div class="navbar-collapse collapse" id="main-navbar">
			<ul class="nav navbar-nav">
				<li>
					<spring:url value="/resources/images/monchis.png" htmlEscape="true" var="logoImage"/>
				<img src="${logoImage}" style="margin-top: 0px; margin-right: 5px;" width="50" height="50"/></span>
				</li>
				<ocaParchis:menuItem active="${name eq 'home'}" url="/"
					title="home page">
					<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
					<span>Home</span>
				</ocaParchis:menuItem>

				
			
				<ocaParchis:menuItem active="${name eq 'Asaltos'}" url="/asaltos"
					title="Asaltos">
					<spring:url value="/resources/images/espadas.png" htmlEscape="true" var="espadas"/>
						<img src="${espadas}" width="16" height="16"/></span>
					<span>Asaltos</span>
				</ocaParchis:menuItem>
				
				<ocaParchis:menuItem active="${name eq 'Clan'}" url="/clan"
					title="Clan">
					<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
					<span>Clan</span>
				</ocaParchis:menuItem>

			</ul>

		</div>



	</div>
</nav>
