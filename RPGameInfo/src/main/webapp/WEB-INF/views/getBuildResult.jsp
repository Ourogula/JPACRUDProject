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
				<table class="table table-dark table-striped">
					<thead>
						<tr>
							<th>ID</th>
							<th>Name</th>
							<th>Description</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${build.id}</td>
							<td>${build.name}</td>
							<td>${build.description}</td>
						</tr>
					</tbody>
				</table>
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