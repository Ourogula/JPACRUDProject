<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update a Character Build</title>
<!-- BootStrap Header -->
<%@ include file="../bootstrapHead.jsp"%>
</head>
<body>
	<!-- Navbar Start -->
	<%@ include file="../nav.jsp"%>
	<!-- Navbar End -->
			<c:choose>
				<c:when test="${success == true}">

	<div class="row" style="text-align: center;">
		<h2 style="color: white;">Updating Character Build ${build.id}</h2>
	</div>
	<div class="row">
		<div class="col-2"></div>
		<!--  UPDATE FORM START -->
		<div class="col-8 formContainer">
					<form action="updateForm.do" method="POST" id="updateForm">
						<input type="hidden" value="${build.id}" name="id"> Name:
						<input type="text" name="name" value="${build.name}" REQUIRED>
						Description: <input type="text" name="description"
							value="${build.description}"> <br />Strength: <input
							type="text" name="strength" value="${build.strength}" REQUIRED>
						Dexterity: <input type="text" name="dexterity"
							value="${build.dexterity}" REQUIRED> Constitution: <input
							type="text" name="constitution" value="${build.constitution}"
							REQUIRED> <br /> Intelligence: <input type="text"
							name="intelligence" value="${build.intelligence}" REQUIRED>
						Wisdom: <input type="text" name="wisdom" value="${build.wisdom}"
							REQUIRED> Charisma: <input type="text" name="charisma"
							value="${build.charisma}" REQUIRED> <br /> Race: <select
							name="characterRace">
							<c:forEach var="race" items="${races}">
								<option value="${race.id}">${race.name}</option>
							</c:forEach>
						</select> Class: <select name="characterClass">
							<c:forEach var="charClass" items="${classes}">
								<option value="${charClass.id}">${charClass.name}</option>
							</c:forEach>
						</select>

						<button type="submit">Update Character Build</button>

					</form>
		</div>
		<!--  UPDATE FORM END -->
		<div class="col-2"></div>
	</div>

	</c:when>
	<c:otherwise>
		<h1 class="noResults">Invalid ID provided. Please try again at a
			later time.</h1>
	</c:otherwise>
	</c:choose>
	<!-- BootStrap Footer -->
	<%@ include file="../bootstrapFoot.jsp"%>
</body>
</html>