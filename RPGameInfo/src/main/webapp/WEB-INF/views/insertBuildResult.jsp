<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Results - Create Character Build</title>
<!-- BootStrap Header -->
<%@ include file="../bootstrapHead.jsp"%>
</head>
<body>
	<!-- Navbar Start -->
	<%@ include file="../nav.jsp"%>
	<!-- Navbar End -->


	<div>
		<c:choose>
			<c:when test="${not empty insertBuild}">
				<h1 class="insertResult">The Following Character Build was
					Created</h1>
				<table class="table table-dark table-striped">
					<thead>
						<tr>
							<th>ID</th>
							<th>Name</th>
							<th>Description</th>
							<th>Strength</th>
							<th>Dexterity</th>
							<th>Constitution</th>
							<th>Intelligence</th>
							<th>Wisdom</th>
							<th>Charisma</th>
							<th>Race</th>
							<th>Class</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${insertBuild.id}</td>
							<td>${insertBuild.name}</td>
							<td>${insertBuild.description}</td>
							<td>${insertBuild.strength}</td>
							<td>${insertBuild.dexterity}</td>
							<td>${insertBuild.constitution}</td>
							<td>${insertBuild.intelligence}</td>
							<td>${insertBuild.wisdom}</td>
							<td>${insertBuild.charisma}</td>
							<td>${insertBuild.race.name}</td>
							<td>${insertBuild.charClass.name}</td>
						</tr>
					</tbody>
				</table>
			</c:when>
			<c:otherwise>
				<h3 class="noResults">Unable to create the Character Build</h3>
			</c:otherwise>
		</c:choose>
	</div>



	<!-- BootStrap Footer -->
	<%@ include file="../bootstrapFoot.jsp"%>
</body>
</html>