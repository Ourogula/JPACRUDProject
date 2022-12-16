<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
</head>
<body>
	<c:choose>
		<c:when test="${not empty builds}">
			<table>
				<c:forEach var="build" items="${builds}">
					<tr>
						<td>${build.id}</td>
						<td>${build.name}</td>
						<td>${build.description}</td>

					</tr>

				</c:forEach>


			</table>
		</c:when>
		<c:otherwise>
		No builds found in the database.
		</c:otherwise>

	</c:choose>

</body>
</html>