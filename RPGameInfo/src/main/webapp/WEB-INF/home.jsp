<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<!-- BootStrap Header -->
<%@ include file="bootstrapHead.jsp"%>
</head>
<body style="background-color: black;">
<!-- Navbar Start -->
	<%@ include file="nav.jsp"%>
<!-- Navbar End -->
<div class="container-fluid">
	<c:choose>
		<c:when test="${not empty builds}">
		<div class="table-responsive">
			<table class="table table-dark table-striped">
				<c:forEach var="build" items="${builds}">
					<tr>
						<td>${build.id}</td>
						<td>${build.name}</td>
						<td>${build.description}</td>

					</tr>

				</c:forEach>


			</table>
		</div>
		</c:when>
		<c:otherwise>
		No builds found in the database.
		</c:otherwise>

	</c:choose>
	</div>
<!-- BootStrap Footer -->
<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>