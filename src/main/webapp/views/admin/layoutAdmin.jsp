<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Online Entertaiment</title>
<%@ include file="/common/head.jsp"%>

</head>
<style>
/* Đảm bảo rằng textarea có thể mở rộng theo chiều cao của văn bản */
textarea {
	resize: vertical;
	min-height: 100px; /* Chiều cao tối thiểu của textarea */
	max-height: 400px; /* Chiều cao tối đa của textarea */
}
</style>

<body>
	<%@ include file="/common/headerAdmin.jsp"%>
	<div class="container">
		<nav class="navbar navbar-expand-lg">
			<div class="container">
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
					aria-controls="navbarNavDropdown" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNavDropdown">
					<ul class="navbar-nav">
						<li class="nav-item"><a
							class="nav-link active navbar-text text-uppercase text-danger fw-bold"
							aria-current="page"
							href="${pageContext.request.contextPath}/admin/user/index">User</a></li>
						<li class="nav-item"><a
							class="nav-link navbar-text text-uppercase fw-bold text-success"
							href="${pageContext.request.contextPath}/admin/video/index">Video</a></li>
						<%-- <li class="nav-item"><a
							class="nav-link navbar-text text-uppercase fw-bold text-warning" href="${pageContext.request.contextPath}/admin/report">Report</a></li> --%>
					</ul>
				</div>
			</div>
		</nav>

	</div>
	<jsp:include page="${viewAdmin}"></jsp:include>



	<!-- container-fluid, tm-container-content -->
	<%@ include file="/common/footer.jsp"%>
</body>

</html>