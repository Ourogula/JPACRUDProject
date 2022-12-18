<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create a Character Build</title>
<!-- BootStrap Header -->
<%@ include file="../bootstrapHead.jsp"%>
</head>
<body>
	<!-- Navbar Start -->
	<%@ include file="../nav.jsp"%>
	<!-- Navbar End -->

	<div class="row" style="text-align: center;">
		<h2 style="color: white;">Creating Character Build</h2>
	</div>
	<div class="row">
		<div class="col-2"></div>
		<div class="col-8 formContainer">
			<form action="insertForm.do" method="POST" id="insertForm">
					Name: <input type="text" name="name" value="${build.name}" placeholder="Name"
					REQUIRED> Description: <input type="text" name="description" placeholder="Description"> <br />Strength:  <input type="text"
					name="strength" placeholder="Strength" REQUIRED> Dexterity: <input type="text"
					name="dexterity" placeholder="Dexterity" REQUIRED> Constitution: <input type="text"
					name="constitution" placeholder="Constitution" REQUIRED> <br /> Intelligence: <input
					type="text" name="intelligence" placeholder="Intelligence" REQUIRED> Wisdom: <input
					type="text" name="wisdom" placeholder="Wisdom" REQUIRED> Charisma: <input
					type="text" name="charisma" placeholder="Charisma" REQUIRED> <br />
				Race: 
				<select name="characterRace">
					<c:forEach var="race" items="${races}">
						<option value="${race.id}">${race.name}</option>
					</c:forEach>
				</select>
				 Class: 
				<select name="characterClass">
					<c:forEach var="charClass" items="${classes}">
						<option value="${charClass.id}">${charClass.name}</option>
					</c:forEach>
				</select>
				<button type="submit">Create Character Build</button>

			</form>
		</div>
		<div class="col-2"></div>
	</div>



	<!-- BootStrap Footer -->
	<%@ include file="../bootstrapFoot.jsp"%>
</body>
</html>