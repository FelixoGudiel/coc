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
							<title>CocAPIC</title>
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
							float: left;
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
							animation-duration: 4s;
							height: auto;
							width: auto;
							float: right;
						}

						@keyframes der {
							0% {
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
					</style>

					<body style="background-color:#ececec;">
						<div>
							<div class="arriba">
								<h1 style="font-family:monospace">&nbsp;Todos los Asaltos</h1>
							</div>
							<div>

								<a class="btn btn-success" style="position: relative;
								animation-name: izqlento;
								animation-duration: 4s;
								;" href="/asaltos/addAsalto">Actualizar</a>

								<div class="der lento">
									<a class="btn btn-success" href="/asaltos/analisis/1">Analisis</a>
								</div>

							</div>
							<br>
							
							<div class="izq" style="overflow-y:hidden ; overflow-x: hidden; height: 700px;">
								<table class="table table-striped" style="width: 500px;">
									<tr>
										<th>Fecha</th>
										<th>
											<spring:url value="/resources/images/raid_medal_mini.png" htmlEscape="true"
												var="logoImage" />
											<img src="${logoImage}" style="margin-top: 0px; margin-right: 5px;"
												width="20" height="20" /></span>
										</th>
										<th>
											<spring:url value="/resources/images/distrito_caido.png" htmlEscape="true"
												var="logoImage" />
											<img src="${logoImage}" style="margin-top: 0px; margin-right: 5px;"
												width="20" height="20" /></span>
										</th>
										<th>
											<spring:url value="/resources/images/capital_gold_mini.png"
												htmlEscape="true" var="logoImage" />
											<img src="${logoImage}" style="margin-top: 0px; margin-right: 5px;"
												width="20" height="20" /></span>
										</th>
										<th>
											<spring:url value="/resources/images/trofeo.png" htmlEscape="true"
												var="logoImage" />
											<img src="${logoImage}" style="margin-top: 0px; margin-right: 5px;"
												width="20" height="20" /></span>
										</th>
										<th>
											Nº Atacantes
										</th>
									</tr>
									<c:forEach items="${asaltos}" var="asalto">
										<tr>
											<td>
												<c:out value="${asalto.fecha}"></c:out>
											</td>
											<td>
												<c:out value="${asalto.monedasGanadas}"></c:out>
											</td>
											<td>
												<c:out value="${asalto.distritosTumbados}"></c:out>
											</td>
											<td>
												<c:out value="${asalto.oroCapital}"></c:out>
											</td>
											<td>
												<c:out value="${asalto.copasCapital}"></c:out>
											</td>
											<td>
												<c:out value="${asalto.gamerRecord.size()}"></c:out>
											</td>
										</tr>
									</c:forEach>
								</table>
							</div>
							</div>
							<div style="overflow-y:scroll ; overflow-x: hidden; height: 700px;">
								<div id="container" class="der">
									<script>
										Highcharts.chart('container', {

											title: {
												text: 'Oro de Capital',
												align: 'left'
											},

											legend: {
												layout: 'vertical',
												align: 'right',
												verticalAlign: 'middle'
											},

											series: [{
												name: 'Oro de Capital',
												data: ${ OroRecord },
												color: '#1b8a37'
										}],

											responsive: {
											rules: [{
												condition: {
													maxWidth: 500
												},
												chartOptions: {
													legend: {
														layout: 'horizontal',
														align: 'center',
														verticalAlign: 'bottom'
													}
												}
											}]
										}

									});
									</script>
								</div>
								<div id="container2" class="der">
									<script>
										Highcharts.chart('container2', {

											title: {
												text: 'Monedas Grises',
												align: 'left'
											},

											legend: {
												layout: 'vertical',
												align: 'right',
												verticalAlign: 'middle'
											},

											series: [{
												name: 'Monedas Grises',
												data: ${ MonedasRecord },
												color: '#1b8a37'
										}],


											responsive: {
											rules: [{
												condition: {
													maxWidth: 500
												},
												chartOptions: {
													legend: {
														layout: 'horizontal',
														align: 'center',
														verticalAlign: 'bottom'
													}
												}
											}]
										}

									});
									</script>
								</div>
								<div id="container3" class="der">
									<script>
										Highcharts.chart('container3', {

											title: {
												text: 'Copas por asalto',
												align: 'left'
											},

											legend: {
												layout: 'vertical',
												align: 'right',
												verticalAlign: 'middle'
											},

											series: [{
												name: 'Copas por asalto',
												data: ${ CopasRecord },
												color: '#1b8a37'
										}],

											responsive: {
											rules: [{
												condition: {
													maxWidth: 500
												},
												chartOptions: {
													legend: {
														layout: 'horizontal',
														align: 'center',
														verticalAlign: 'bottom'
													}
												}
											}]
										}

									});
									</script>
								</div>
								<div id="container4" class="der">
									<script>
										Highcharts.chart('container4', {

											title: {
												text: 'Distritos y Atacantes',
												align: 'left'
											},

											legend: {
												layout: 'vertical',
												align: 'right',
												verticalAlign: 'middle'
											},

											series: [{
												name: 'Distritos tumbados',
												data: ${ DistritosRecord },
												color: '#1b8a37'
										}, {
											name: 'Atacantes por asalto',
											data: ${ AtacantesRecord },
											color: '#A128CC'
										}],

											responsive: {
											rules: [{
												condition: {
													maxWidth: 500
												},
												chartOptions: {
													legend: {
														layout: 'horizontal',
														align: 'center',
														verticalAlign: 'bottom'
													}
												}
											}]
										}

									});
									</script>
								</div>
							</div>
						</div>
					</body>

					</ocaParchis:layout>

					</html>