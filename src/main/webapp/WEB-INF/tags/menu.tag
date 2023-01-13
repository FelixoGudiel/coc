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
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="<spring:url value="/" htmlEscape="true" />"><span style="font-family: 'Fredoka One', cursive; font-size: 30px; color:#d9534f">Oca & Parchis</span></a>
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
					<spring:url value="/resources/images/logo.png" htmlEscape="true" var="logoImage"/>
				<img src="${logoImage}" style="margin-top: 10px; margin-right: 5px;" width="35" height="35"/></span>
				</li>
				<ocaParchis:menuItem active="${name eq 'home'}" url="/"
					title="home page">
					<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
					<span>Home</span>
				</ocaParchis:menuItem>

				
			
				<ocaParchis:menuItem active="${name eq 'Asaltos'}" url="/asaltos"
					title="Asaltos">
					<spring:url value="/resources/images/people.png" htmlEscape="true" var="peopleImage"/>
						<img src="${peopleImage}" width="16" height="16"/></span>
					<span>Asaltos</span>
				</ocaParchis:menuItem>

				<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"> <spring:url value="/resources/images/stats.png" htmlEscape="true" var="statsImage"/>
						<img src="${statsImage}" width="16" height="16"/> Stats
							<span class="glyphicon glyphicon-chevron-down"></span>
					</a>
						<ul class="dropdown-menu">
							<li>
								<ocaParchis:menuItem active="${name eq 'My stats'}" url="/playerstats"
								title="My stats">
								<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
								<span>My stats</span>
								</ocaParchis:menuItem>
							</li>
							<li class="divider"></li>							
                            <li> 
								<ocaParchis:menuItem active="${name eq 'Global Stats'}" url="/playerstats/global"
								title="Global Stats">
								<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
								<span>Global</span>
								</ocaParchis:menuItem>
							</li>
							<li class="divider"></li>							
                            <li> 
								<ocaParchis:menuItem active="${name eq 'Ranking'}" url="/playerstats/ranking?wins=true"
								title="Ranking">
								<span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
								<span>Ranking</span>
								</ocaParchis:menuItem>
							</li>
						</ul></li>
				
				<ocaParchis:menuItem active="${name eq 'Achievements'}" url="/achievements"
					title="Achievements">
					<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
					<span>Achievements</span>
				</ocaParchis:menuItem>

			</ul>

		</div>



	</div>
</nav>
