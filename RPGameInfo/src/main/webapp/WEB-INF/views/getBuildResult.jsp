<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Character Build Search Result</title>
<!-- BootStrap Header -->
<%@ include file="../bootstrapHead.jsp"%>
</head>
<body>
	<!-- Navbar Start -->
	<%@ include file="../nav.jsp"%>
	<!-- Navbar End -->


	<div>
		<c:choose>
			<c:when test="${not empty build}">
				<h1 class="getterResult">The Following Character Build Matches
					ID: ${build.id}</h1>
				<div class="row">
					<div class="col-3">
						<img src="${build.race.image}" class="img-fluid"
							alt="${build.race.name}">
					</div>
					<div class="col-8">
						<table class="table table-dark table-striped">
							<thead>
								<tr>
									<th>ID</th>
									<th>Name</th>
									<th>Race</th>
									<th>Class</th>
									<th>Description</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>${build.id}</td>
									<td>${build.name}</td>
									<td>${build.race.name}</td>
									<td rowspan="5">${build.charClass.name}</td>
									<td rowspan="5">${build.description}</td>
								</tr>
							</tbody>
							<thead>
								<tr>
									<th>Strength</th>
									<th>Dexterity</th>
									<th>Constitution</th>
									<th></th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>${build.strength}</td>
									<td>${build.dexterity}</td>
									<td>${build.constitution}</td>
									<td></td>
									<td></td>
								</tr>
							</tbody>
							<thead>
								<tr>
									<th>Intelligence</th>
									<th>Wisdom</th>
									<th>Charisma</th>
									<th></th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>${build.intelligence}</td>
									<td>${build.wisdom}</td>
									<td>${build.charisma}</td>
									<td></td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</c:when>

			<c:otherwise>
				<h3 class="noResults">No Results Found</h3>
			</c:otherwise>
		</c:choose>
	</div>


	<!-- BootStrap Footer -->
	<%@ include file="../bootstrapFoot.jsp"%>
</body>
</html>