<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Get a Character Build</title>
<!-- BootStrap Header -->
<%@ include file="../bootstrapHead.jsp"%>
</head>
<body>
<!-- Navbar Start -->
	<%@ include file="../nav.jsp"%>
<!-- Navbar End -->


<div style="text-align:center;">
<form id="getterForm" action="getterForm.do" method="POST">
<p>Character Build ID:</p> <input type="text">
<button type="button" value="submit" form="getterForm">Find a Build</button>
</form>
</div>


<!-- BootStrap Footer -->
<%@ include file="../bootstrapFoot.jsp"%>
</body>
</html>