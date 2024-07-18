<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Online Entertaiment</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<%@ include file="/common/head.jsp"%>

</head>

<body>
	<%@ include file="/common/header.jsp"%>

	<jsp:include page="${view}"></jsp:include>
	<!-- row -->
	<!-- container-fluid, tm-container-content -->

	<%@ include file="/common/footer.jsp"%>


</body>

</html>