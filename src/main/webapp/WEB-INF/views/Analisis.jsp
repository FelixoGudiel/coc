<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
				<%@ taglib prefix="ocaParchis" tagdir="/WEB-INF/tags" %>


					<!DOCTYPE html
						PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
					<html>

					<head>
						<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
						<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />

						<script src="/webjars/jquery/jquery.min.js"></script>
						<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
						<script src="https://code.highcharts.com/highcharts.js"></script>
						<script src="https://code.highcharts.com/modules/series-label.js"></script>
						<script src="https://code.highcharts.com/modules/exporting.js"></script>
						<script src="https://code.highcharts.com/modules/export-data.js"></script>
						<script src="https://code.highcharts.com/modules/accessibility.js"></script>

						<ocaParchis:layout pageName="Asaltos">
							<title>POPUCOC</title>
					</head>
					<style>
						.arriba {
							position: relative;
							animation-name: arriba;
							animation-duration: 1s;
						}

						@keyframes arriba {
							0% {
								left: -2000px;
								top: 0px;
								opacity: 0%;
							}

							100% {
								left: 0px;
								top: 0px;
								opacity: 100%
							}
						}

						.izq {
							position: relative;
							animation-name: izq;
							animation-duration: 4s;
						}

						@keyframes izq {
							0% {
								left: -2000px;
								top: 0px;
							}

							100% {
								left: 0px;
								top: 0px;
							}
						}

						.der {
							position: relative;
							animation-name: der;
							animation-duration: 3s;
							height: auto;
							width: auto;
							float: right;
						}

						.der1 {
							position: relative;
							animation-name: der1;
							animation-duration: 3.1s;
							height: auto;
							width: auto;
							float: right;
						}

						.der2 {
							position: relative;
							animation-name: der2;
							animation-duration: 3.3s;
							height: auto;
							width: auto;
							float: right;
						}

						@keyframes der {
							0% {
								left: 2000px;
								top: 0px;
							}

							50% {
								left: 2000px;
								top: 0px;
							}

							100% {
								left: 0px;
								top: 0px;
							}
						}

						@keyframes der1 {
							0% {
								left: 2000px;
								top: 0px;
							}

							48.387096774% {
								left: 2000px;
								top: 0px;
							}

							100% {
								left: 0px;
								top: 0px;
							}
						}

						@keyframes der2 {
							0% {
								left: 2000px;
								top: 0px;
							}

							45.454545454% {
								left: 2000px;
								top: 0px;
							}

							100% {
								left: 0px;
								top: 0px;
							}
						}

						.der.lento {
							position: relative;
							animation-name: derlento;
							animation-duration: 4s;
							float: right;
						}

						.izq.lento {
							position: relative;
							animation-name: izqlento;
							animation-duration: 4s;

						}

						@keyframes izqlento {
							0% {
								left: -2000px;
								top: 0px;
							}

							60% {
								left: -2000px;
								top: 0px;
							}

							100% {
								left: 0px;
								top: 0px;
							}
						}

						@keyframes derlento {
							0% {
								left: 2000px;
								top: 0px;
							}

							60% {
								left: 2000px;
								top: 0px;
							}

							100% {
								left: 0px;
								top: 0px;
							}
						}

						.meneillo {
							position: relative;
							animation-name: meneillo;
							animation-duration: 0.5s;
							animation-delay: 5s;
							transition-duration: 0.5s;

						}

						@keyframes meneillo {
							0% {
								transform: rotate(0deg);
							}

							40% {
								transform: rotate(0deg);
							}

							50% {
								transform: rotate(5deg);
							}

							60% {
								transform: rotate(-5deg);
							}

							100% {
								transform: rotate(0deg);
							}
						}

						.subida {
							height: ${200*porcentajePuro}px;
							width: 60px;
							background-color: rgb(81, 171, 255);
							float: right;
							left: 600px;
							bottom: 0;
							animation-name: subida;
							position: absolute;
							animation-duration: 8s;
							overflow-y: hidden;
							border-style: solid;
							border-color: black;
							border-width: 2px
						}

						@keyframes subida {
							0% {
								height: 0px;

							}

							50% {
								height: 0px;
							}

							100% {
								height: ${200*porcentajePuro}px;
							}
						}
					</style>

					<body style="background-color:#ececec;">
						<div>
							<div class="arriba">
								<c:if test="${semanas!=1}">
								<h1 style="font-family:monospace">&nbsp;Analisis de ${semanas} semanas</h1>
							</c:if>
							<c:if test="${semanas==1}">
								<h1 style="font-family:monospace">&nbsp;Analisis de ${semanas} semana</h1>
							</c:if>
							</div>
							<div class="btn btn-success" style="position: relative;
									animation-name: derlento;
									animation-duration: 4s;float: right;">
								<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"
										style="color:white">Alcance
										<span class="glyphicon glyphicon-chevron-down"></span>
									</a>
									<ul class="dropdown-menu">
										<li>
											<ocaParchis:menuItem active="${name eq '1 semana'}"
												url="/asaltos/analisis/1" title="1 semana">
												<span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
												<span>1 semana</span>
											</ocaParchis:menuItem>
										</li>
										<li class="divider"></li>
										<li>
											<ocaParchis:menuItem active="${name eq '2 semanas'}"
												url="/asaltos/analisis/2" title="2 semanas">
												<span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
												<span>2 semanas</span>
											</ocaParchis:menuItem>
										</li>
										<li class="divider"></li>
										<li>
											<ocaParchis:menuItem active="${name eq '3 semanas'}"
												url="/asaltos/analisis/3" title="3 semanas">
												<span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
												<span>3 semanas</span>
											</ocaParchis:menuItem>
										</li>
									</ul>
								</li>
							</div>
							<div>
								<a class="btn btn-success" style="position: relative;
								animation-name: izqlento;
								animation-duration: 4s;float: left;
								" href="/asaltos">Volver</a>
							</div>
							
						</div>
						<br>
						<div style="float: left; width: 100%;">
							<div class="izq">
								<table class="table table-bordered"
									style="float: left;  height: 450px; width: 100px; overflow-y: hidden; border-radius: 6px; border-width: 2px; border-color: black;">
									<colgroup>
										<col style="background-color: #ED6467;">
									</colgroup>
									<tr>
										<th style="height: 80px; border-color: black;">
											<h2>Miembros no aptos </h2>
										</th>
									</tr>
									<c:if test="${morosos.size() == 0}">
										<tr>
											<td style="background-color: #7bed64; font-size: 20px;">
												<c:out value="Nadie! :)"></c:out>
											</td>
										</tr>
									</c:if>
									<c:forEach items="${morosos}" var="moroso">
										<tr>
											<td style="border-color: #ED6467; font-size: 20px">
												<c:out value="${moroso}"></c:out>
											</td>
										</tr>
									</c:forEach>
								</table>
								<table class="table table-bordered"
									style="float: left;  height: 450px; width: 100px; overflow-y: hidden; border-radius: 6px; border-width: 2px 2px 2px 0; border-color: black;">
									<colgroup>
										<col style="background-color: #FFEF6F;">
									</colgroup>
									<tr>
										<th style="height: 80px; border-color: black;">
											<h2>Miembros despistados </h2>
										</th>
									</tr>
									<c:if test="${avisar.size() == 0}">
										<tr>
											<td style="background-color: #7bed64; font-size: 20px;">
												<c:out value="Nadie! :)"></c:out>
											</td>
										</tr>
									</c:if>
									<c:forEach items="${avisar}" var="avisado">
										<tr>
											<td style="border-color: #FFEF6F; font-size: 20px">
												<c:out value="${avisado}"></c:out>
											</td>
									</c:forEach>
								</table>
								<div
									style="position: absolute; height: 200px; width: 330px; border-radius: 20px; background-color: #6cd7f8; top: 450px;">
									<spring:url value="/resources/images/capital_gold_mini.png" htmlEscape="true"
										var="oro" />
									<h2 style="position: relative; top: -10px;left:10px">Mejores miembros:</h2>
									<h3 style="position: relative; top: -10px;left:10px">
										${orderBeneficio[0].gamer.nombre} - ${orderBeneficio[0].beneficioObtenido}
										<span><img src="${oro}" style="margin-right: 5px;" width="20" /></span>
									</h3>
									<h3 style="position: relative; top: -10px;left:10px">
										${orderBeneficio[1].gamer.nombre} - ${orderBeneficio[1].beneficioObtenido}
										<span><img src="${oro}" style=" margin-right: 5px;" width="20" /></span>
									</h3>
									<h3 style="position: relative; top: -10px; left:10px;">
										${orderBeneficio[2].gamer.nombre} - ${orderBeneficio[2].beneficioObtenido}
										<span><img src="${oro}" style=" margin-right: 5px;" width="20" /></span>
									</h3>
								</div>

							</div>

							<div class="der">
								<div
									style="height:200px; background-color:#7bed64; width: 700px; border-radius: 20px;position: relative;">
									<spring:url value="/resources/images/ligas/${dirLiga}.png" htmlEscape="true"
										var="logoImage" />
									<img src="${logoImage}" class="meneillo"
										style="margin-top: 0px; margin-right: 5px; height: 150px; left: 20px; position: relative; top: 20px; float:left">
									<spring:url value="/resources/images/trofeo.png" htmlEscape="true" var="copa" />
									<div style="left: 200px;, top: 10px; position: relative; float:left">
										<h2> ${asaltoReciente.copasCapital}<span><img src="${copa}"
													style="margin-top: -10px; margin-right: 5px;" width="30" /></span>
										</h2>
									</div>
									<div style="position: relative; top: 80px; left: -50px;">
										<h1>Actualmente en ${ligaActual}</h1>
										<c:if test="${progresoCopas!=0}">
											<h2>Hemos obtenido ${progresoCopas}<span><img src="${copa}"
														style="margin-top: -10px; margin-right: 5px;"
														width="30" /></span></h2>
										</c:if>
									</div>
								</div>
							</div>
							<div class="der1">
								<div
									style="height:200px; background-color:#be64d4; width: 700px; border-radius: 20px;position: relative;">
									<div style="width: 0; 
										height: 0; 
										border-left: 150px solid transparent;
										border-right: 150px solid #a8a8a8;
										border-bottom: 200px solid #a8a8a8;
										position: absolute;
										left: 275px;">
									</div>
									<div
										style="background-color: #a8a8a8;float: right ; width: 275px; border-radius: 20px;position: relative; height:200px">
										<spring:url value="/resources/images/raid_medal_mini.png" htmlEscape="true"
											var="gris" />
										<h2
											style="right: 25px ; top: -10px;position: relative;align-self: center; float: right;">
											Medallas ganadas:</h2>
										<h2 style="right: 200px ; top: -20px;position: relative;float: right; ">
											${totalMonedas}<span><img src="${gris}" style=" margin-left: 10px;"
													width="30" /></span></h2>
										<h3
											style="right: 90px ; top: -3px;position: relative; align-self: center; overflow-x: hidden; width: 750px;">
											Medallas por atacante:</h3>
										<h3 style="right: 80px ; top: -20px;position: relative; ">
											${ratioAtacanteMonedas}<span><img src="${gris}" style=" margin-left: 10px;"
													width="25" /></span></h3>
										<img src="${gris}" class="meneillo"
											style="margin-top: 0px; margin-right: 5px; height: 100px; right: 0px; position: absolute; top: 90px; float:left">
									</div>
									<spring:url value="/resources/images/capital_gold_mini.png" htmlEscape="true"
										var="oro" />
									<img src="${oro}" class="meneillo"
										style="margin-top: 0px; margin-right: 5px; height: 100px; left: 10px; position: relative; top: 20px; float:left">
									<h2 style="left: 30px ; top: 10px;position: relative;align-self: center; ">
										Oro ganado:</h2>
									<h2 style="left: 50px ; top: 10px;position: relative; ">
										${totalOro}<span><img src="${oro}" style=" margin-left: 10px;"
												width="30" /></span></h2>
									<h3 style="left: 15px ; top: 15px;position: relative; ">
										Oro ganado por atacante:</h3>
									<h3 style="left: 30px ; top: 0px;position: relative; ">
										${ratioAtacanteOro}<span><img src="${oro}" style=" margin-left: 10px;"
												width="25" /></span></h3>


								</div>
							</div>
							<div class="der2">
								<div
									style="height:200px; background-color:#FFEF6F; width: 700px; border-radius: 20px;position: relative;">
									<div
										style="height: 200px; width: 60px;  background-color: gray; float:right; left: 600px; position: absolute; border-style: solid; border-color:  black;  border-width: 2px">
									</div>
									<div class="subida"></div>
									<spring:url value="/resources/images/people.png" htmlEscape="true" var="people" />
									<img src="${people}" class="meneillo"
										style=" margin-right: 50px; height: 100px; left: 10px; position: relative; top: 0px; float:left">
									<h2 style="top:5px">Miembros totales:
										${trabajadores.size()+morosos.size()+avisar.size()}</h2>
									<h2>Miembros activos: ${trabajadores.size()}</h2>
									<h2>Porcentaje de activos: ${porcentaje}%</h2>
									<h2>${evaluation}</h2>

								</div>
							</div>
						</div>
						</div>
					</body>

					</ocaParchis:layout>

					</html>