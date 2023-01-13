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

					<body style="background-color:#ececec">
						<div>
							<h1 style="font-family:monospace">&nbsp;Todos los Asaltos</h1>
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
							<div id="container" style="height: auto;width: auto; float: right;">
								<script>
									Highcharts.chart('container', {

										title: {
											text: 'Progreso',
											align: 'left'
										},

									

										legend: {
											layout: 'vertical',
											align: 'right',
											verticalAlign: 'middle'
										},

										series: [{
											name: 'Installation & Developers',
											data: [43934, 48656, 65165, 81827, 112143, 142383,
												171533, 165174, 155157, 161454, 154610],
											color: '#d9534f'
										}, {
											name: 'Manufacturing',
											data: [24916, 37941, 29742, 29851, 32490, 30282,
												38121, 36885, 33726, 34243, 31050]
										}, {
											name: 'Sales & Distribution',
											data: [11744, 30000, 16005, 19771, 20185, 24377,
												32147, 30912, 29243, 29213, 25663]
										}, {
											name: 'Operations & Maintenance',
											data: [null, null, null, null, null, null, null,
												null, 11164, 11218, 10077]
										}, {
											name: 'Other',
											data: [21908, 5548, 8105, 11248, 8989, 11816, 18274,
												17300, 13053, 11906, 10073]
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
					</body>

					</ocaParchis:layout>

					</html>