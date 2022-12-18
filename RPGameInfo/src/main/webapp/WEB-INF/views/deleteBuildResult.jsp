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
			<c:when test="${not empty deletedBuild}">
				<h1 class="deleteResults">Deleted the following Character Build</h1>
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
							<td>${deletedBuild.id}</td>
							<td>${deletedBuild.name}</td>
							<td>${deletedBuild.description}</td>
							<td>${deletedBuild.strength}</td>
							<td>${deletedBuild.dexterity}</td>
							<td>${deletedBuild.constitution}</td>
							<td>${deletedBuild.intelligence}</td>
							<td>${deletedBuild.wisdom}</td>
							<td>${deletedBuild.charisma}</td>
							<td>${deletedBuild.race.name}</td>
							<td>${deletedBuild.charClass.name}</td>
						</tr>
					</tbody>
				</table>
			</c:when>
			<c:otherwise>
				<h3 class="noResults">No Results Found to Delete</h3>
			</c:otherwise>
		</c:choose>
	</div>



	<!-- BootStrap Footer -->
	<%@ include file="../bootstrapFoot.jsp"%>
</body>
</html>