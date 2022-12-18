<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete a Character Build</title>
<!-- BootStrap Header -->
<%@ include file="../bootstrapHead.jsp"%>
</head>
<body>
	<!-- Navbar Start -->
	<%@ include file="../nav.jsp"%>
	<!-- Navbar End -->


	<div>
		<c:choose>
			<c:when test="${not empty updateBuild}">
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
							<td>${updateBuild.id}</td>
							<td>${updateBuild.name}</td>
							<td>${updateBuild.description}</td>
							<td>${updateBuild.strength}</td>
							<td>${updateBuild.dexterity}</td>
							<td>${updateBuild.constitution}</td>
							<td>${updateBuild.intelligence}</td>
							<td>${updateBuild.wisdom}</td>
							<td>${updateBuild.charisma}</td>
							<td>${updateBuild.race.name}</td>
							<td>${updateBuild.charClass.name}</td>
						</tr>
					</tbody>
				</table>
			</c:when>
			<c:otherwise>
				<h3>Unable to Update the Character Build</h3>
			</c:otherwise>
		</c:choose>
	</div>



	<!-- BootStrap Footer -->
	<%@ include file="../bootstrapFoot.jsp"%>
</body>
</html>