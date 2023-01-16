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
							animation-duration: 5s;
							height: auto;
							width: auto;
							float: right;
						}

						@keyframes der {
							0% {
								left: 2000px;
								top: 0px;
							}

							30% {
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
							animation-delay: 4s;
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
					</style>

					<body style="background-color:#ececec;">
						<div>
							<div class="arriba">
								<h1 style="font-family:monospace">&nbsp;Analisis</h1>
							</div>
							<div>

								<a class="btn btn-success" style="position: relative;
								animation-name: izqlento;
								animation-duration: 4s;" href="/asaltos">Volver</a>
							</div>
							<br>
							<div style="float: left; width: 100%;">
								<div class="izq">
									<table class="table table-bordered"
										style="float: left;  height: 700px; width: 100px; overflow-y: hidden; border-radius: 6px; border-width: 2px; border-color: black;">
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
										style="float: left;  height: 700px; width: 100px; overflow-y: hidden; border-radius: 6px; border-width: 2px 2px 2px 0; border-color: black;">
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
								</div>

								<div class="der">
									<div
										style="height:200px; background-color:rgb(255, 173, 96); width: 700px; border-radius: 20px;position: relative;">
										<spring:url value="/resources/images/ligas/${dirLiga}.png" htmlEscape="true"
											var="logoImage" />
										<img src="${logoImage}" class="meneillo"
											style="margin-top: 0px; margin-right: 5px; height: 150px; left: 20px; position: relative; top: 20px; float:left">
										<spring:url value="/resources/images/trofeo.png" htmlEscape="true" var="copa" />
										<div style="left: 200px;, top: 10px; position: relative; float:left">
											<h2> ${asaltoReciente.copasCapital}<span><img src="${copa}"
														style="margin-top: -10px; margin-right: 5px;" width="30" /></span></h2>
										</div>
									</div>


								</div>
					</body>

					</ocaParchis:layout>

					</html>