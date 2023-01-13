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

						<ocaParchis:layout pageName="Clan">
							<title>CocAPIC</title>
					</head>

					<body style="background-color:#ececec">
						<div>
							<h1 style="font-family:monospace">&nbsp;Cambio de etiqueta</h1>
							<div>	
								<a class="btn btn-danger" href="/clan">Volver</a>
							</div>
							<div style=" float: left; padding: 5px">
								<table class="table table-striped">
									<tr>
										<th>Nombre</th>
										<th>Etiqueta</th>
										<th>Promover</th>
										<th>Degradar</th>
									</tr>
									<c:forEach items="${members}" var="miembro" varStatus="status">
										<c:if test = "${status.index<17}">
										<tr>
											<td>
												<c:out value="${miembro.nombre}"></c:out>
											</td>
											<td>
												<c:out value="${miembro.etiqueta}"></c:out>
											</td>
											<c:if test="${miembro.etiqueta!='Amigo'}">
												<td><a href="/clan/promote/${miembro.id}" style="color:#1b8a37"><span class="glyphicon glyphicon-chevron-up"></a> </td>
												</c:if>
												<c:if test="${miembro.etiqueta=='Amigo'}">
												<td><span class="glyphicon glyphicon-chevron-up" style="color:#3a3a3a"></td>
												</c:if>
												<c:if test="${miembro.etiqueta!='Desconocido'}">
												<td><a href="/clan/demote/${miembro.id}" style="color:#1b8a37"><span class="glyphicon glyphicon-chevron-down"></a> </td>
												</c:if>
												<c:if test="${miembro.etiqueta=='Desconocido'}">
													<td><span class="glyphicon glyphicon-chevron-down" style="color:#3a3a3a"></td>
												</c:if>
										</tr>
									</c:if>
									</c:forEach>
								</table>
							</div>
							<div style=" float: left; padding: 5px">
								<table class="table table-striped">
									<tr>
										<th>Nombre</th>
										<th>Etiqueta</th>
										<th>Promover</th>
										<th>Degradar</th>
									</tr>
									<c:forEach items="${members}" var="miembro" varStatus="status">
										<c:if test = "${status.index>=17 && status.index<34}">
											<tr>
												<td>
													<c:out value="${miembro.nombre}"></c:out>
												</td>
												<td>
													<c:out value="${miembro.etiqueta}"></c:out>
												</td>
												<c:if test="${miembro.etiqueta!='Amigo'}">
												<td><a href="/clan/promote/${miembro.id}" style="color:#1b8a37"><span class="glyphicon glyphicon-chevron-up"></a> </td>
												</c:if>
												<c:if test="${miembro.etiqueta=='Amigo'}">
												<td><span class="glyphicon glyphicon-chevron-up" style="color:#3a3a3a"></td>
												</c:if>
												<c:if test="${miembro.etiqueta!='Desconocido'}">
												<td><a href="/clan/demote/${miembro.id}" style="color:#1b8a37"><span class="glyphicon glyphicon-chevron-down"></a> </td>
												</c:if>
												<c:if test="${miembro.etiqueta=='Desconocido'}">
													<td><span class="glyphicon glyphicon-chevron-down" style="color:#3a3a3a"></td>
												</c:if>
											</tr>
									</c:if>
									</c:forEach>
								</table>
							</div>
							<div style=" float: left; padding: 5px;">
								<table class="table table-striped">
									<tr>
										<th>Nombre</th>
										<th>Etiqueta</th>
										<th>Promover</th>
										<th>Degradar</th>
									</tr>
									<c:forEach items="${members}" var="miembro" varStatus="status">
										<c:if test = "${status.index>=34}">
											<tr>
												<td>
													<c:out value="${miembro.nombre}"></c:out>
												</td>
												<td>
													<c:out value="${miembro.etiqueta}"></c:out>
												</td>
												<c:if test="${miembro.etiqueta!='Amigo'}">
												<td><a href="/clan/promote/${miembro.id}" style="color:#1b8a37"><span class="glyphicon glyphicon-chevron-up"></a> </td>
												</c:if>
												<c:if test="${miembro.etiqueta=='Amigo'}">
												<td><span class="glyphicon glyphicon-chevron-up" style="color:#3a3a3a"></td>
												</c:if>
												<c:if test="${miembro.etiqueta!='Desconocido'}">
												<td><a href="/clan/demote/${miembro.id}" style="color:#1b8a37"><span class="glyphicon glyphicon-chevron-down"></a> </td>
												</c:if>
												<c:if test="${miembro.etiqueta=='Desconocido'}">
													<td><span class="glyphicon glyphicon-chevron-down" style="color:#3a3a3a"></td>
												</c:if>
											</tr>
									</c:if>
									</c:forEach>
								</table>
							</div>
						</div>
					</body>

					</ocaParchis:layout>

					</html>