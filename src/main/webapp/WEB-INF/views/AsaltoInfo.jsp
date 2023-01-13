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

						<ocaParchis:layout pageName="home">
							<title>CocAPIC</title>
					</head>

					<body style="background-color:#ececec">
						<div>
							<h1 style="font-family:monospace">&nbsp;Asaltos Info</h1>
							<div style=" float: left;">
								<table class="table table-striped">
									<tr>
										<th>Fecha Asalto</th>
										<th>Monedas Ganadas</th>
										<th>Distritos Tirados</th>
										<th>Oro de Capital</th>
									</tr>
									<c:forEach items="${asaltos}" var="asalto">
										<tr>
											<td>
												<c:out value="{asalto.fecha}"></c:out>
											</td>
											<td>
												<c:out value="{asalto.monedasGanadas}"></c:out>
											</td>
											<td>
												<c:out value="{asalto.distritosTumbados}"></c:out>
											</td>
											<td>
												<c:out value="{asalto.oroCapital}"></c:out>
											</td>
										</tr>
									</c:forEach>
								</table>
							</div>
							<div style=" float: right;">
								<table class="table table-striped">
									<tr>
										<th>Fecha Asalto</th>
										<th>Monedas Ganadas</th>
										<th>Distritos Tirados</th>
										<th>Oro de Capital</th>
									</tr>
									<c:forEach items="${asaltos}" var="asalto">
										<tr>
											<td>
												<c:out value="{asalto.fecha}"></c:out>
											</td>
											<td>
												<c:out value="{asalto.monedasGanadas}"></c:out>
											</td>
											<td>
												<c:out value="{asalto.distritosTumbados}"></c:out>
											</td>
											<td>
												<c:out value="{asalto.oroCapital}"></c:out>
											</td>
										</tr>
									</c:forEach>
								</table>
							</div>
						</div>
					</body>

					</ocaParchis:layout>

					</html>