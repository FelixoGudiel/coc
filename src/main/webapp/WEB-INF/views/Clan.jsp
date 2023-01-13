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
							<h1 style="font-family:monospace">&nbsp;Clan Info</h1>
							<div>	
									<a class="btn btn-danger" href="/clan/update">Actualizar</a>
									<div style="float:right">
									<a class="btn btn-danger" href="/clan/promote">Cambiar etiquetas</a>
									</div>
							</div>
							<br>
							<div style=" float: left; padding: 5px">
								<table class="table table-striped">
									<tr>
										<th>Nombre</th>
										<th>Donado</th>
										<th>Etiqueta</th>
										<th>Tag</th>
									</tr>
									<c:forEach items="${members}" var="miembro" varStatus="status">
										<c:if test="${status.index<17}">
											<tr>
												<td>
													<c:out value="${miembro.nombre}"></c:out>
												</td>
												<td>
													<c:out value="${miembro.donado}"></c:out>
												</td>
												<td>
													<c:out value="${miembro.etiqueta}"></c:out>
												</td>
												<td>
													<c:out value="${miembro.tag}"></c:out>
												</td>
											</tr>
										</c:if>
									</c:forEach>
								</table>
							</div>
							<div style=" float: left; padding: 5px">
								<table class="table table-striped">
									<tr>
										<th>Nombre</th>
										<th>Donado</th>
										<th>Etiqueta</th>
										<th>Tag</th>
									</tr>
									<c:forEach items="${members}" var="miembro" varStatus="status">
										<c:if test="${status.index>=17 && status.index<34}">
											<tr>
												<td>
													<c:out value="${miembro.nombre}"></c:out>
												</td>
												<td>
													<c:out value="${miembro.donado}"></c:out>
												</td>
												<td>
													<c:out value="${miembro.etiqueta}"></c:out>
												</td>
												<td>
													<c:out value="${miembro.tag}"></c:out>
												</td>
											</tr>
										</c:if>
									</c:forEach>
								</table>
							</div>
							<div style=" float: left; padding: 5px;">
								<table class="table table-striped">
									<tr>
										<th>Nombre</th>
										<th>Donado</th>
										<th>Etiqueta</th>
										<th>Tag</th>
									</tr>
									<c:forEach items="${members}" var="miembro" varStatus="status">
										<c:if test="${status.index>=34}">
											<tr>
												<td>
													<c:out value="${miembro.nombre}"></c:out>
												</td>
												<td>
													<c:out value="${miembro.donado}"></c:out>
												</td>
												<td>
													<c:out value="${miembro.etiqueta}"></c:out>
												</td>
												<td>
													<c:out value="${miembro.tag}"></c:out>
												</td>
											</tr>
										</c:if>
									</c:forEach>
								</table>
							</div>
						</div>
					</body>

					</ocaParchis:layout>

					</html>