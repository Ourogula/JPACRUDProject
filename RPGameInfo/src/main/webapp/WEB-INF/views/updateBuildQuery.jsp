<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Choose a Character Build to Update</title>
<!-- BootStrap Header -->
<%@ include file="../bootstrapHead.jsp"%>
</head>
<body>
	<!-- Navbar Start -->
	<%@ include file="../nav.jsp"%>
	<!-- Navbar End -->


	<div style="text-align: center;" class="container-fluid">
		<div class="row">
			<div class="col-4"></div>
			<div class="col-4 formContainer">
				<h3>Insert ID of Character Build to Update</h3>
				<form id="updateForm" action="updateFormQuery.do" method="POST">
					<p>Character Build ID:</p>
					<input type="text" name="id" REQUIRED>
					<button type="submit" form="updateForm">Update a Build</button>
				</form>
			</div>
			<div class="col-4"></div>
		</div>
	</div>
	<div class="container-fluid">
		<c:choose>
			<c:when test="${not empty builds}">
				<div class="table-responsive">
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
							<c:forEach var="build" items="${builds}">
								<tr>
									<td>${build.id}</td>
									<td>${build.name}</td>
									<td>${build.description}</td>
									<td>${build.strength}</td>
									<td>${build.dexterity}</td>
									<td>${build.constitution}</td>
									<td>${build.intelligence}</td>
									<td>${build.wisdom}</td>
									<td>${build.charisma}</td>
									<td>${build.race.name}</td>
									<td>${build.charClass.name}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</c:when>
			<c:otherwise>
				<h1 style="color: white;">No builds found in the database.</h1>
			</c:otherwise>

		</c:choose>
	</div>


	<!-- BootStrap Footer -->
	<%@ include file="../bootstrapFoot.jsp"%>
</body>
</html>