<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<nav class="navbar navbar-expand-lg bg-secondary-subtle fixed-top">
	<div class="container-fluid">
		<a class="navbar-brand"
			href="${pageContext.request.contextPath}/index"> <i
			class="fas fa-film mr-2"></i> Giải trí Trực tuyến
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<i class="fas fa-bars"></i>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ml-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link nav-link-1 active"
					aria-current="page" href="${pageContext.request.contextPath}/index">Trang
						Chủ</a></li>
				<li class="nav-item"><a class="nav-link nav-link-1 active"
					aria-current="page"
					href="${pageContext.request.contextPath}/video/favorite">Video
						yêu thích</a></li>
				<li class="nav-item"><a class="nav-link nav-link-3"
					href="${pageContext.request.contextPath}/about">Giới thiệu</a></li>
				<li class="nav-item"><a class="nav-link nav-link-4"
					href="${pageContext.request.contextPath}/contact">Liên hệ</a></li>
				<li class="nav-item dropdown"><c:choose>
						<c:when test="${empty sessionScope.user}">
							<a class="nav-link dropdown-toggle" href="#" role="button"
								data-bs-toggle="dropdown" aria-expanded="false"> Đăng nhập </a>
						</c:when>
						<c:otherwise>
							<a class="nav-link dropdown-toggle" href="#" role="button"
								data-bs-toggle="dropdown" aria-expanded="false"> ${username}
							</a>
						</c:otherwise>
					</c:choose>
					<ul class="dropdown-menu">
						<c:choose>
							<c:when test="${empty sessionScope.user}">
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/dang-nhap">Đăng
										nhập</a></li>
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/dang-ky">Đăng Ký</a></li>
							</c:when>
							<c:otherwise>
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/dang-xuat">Đăng
										xuất</a></li>
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/doi-mat-khau">Đổi
										Mật Khẩu</a></li>
							</c:otherwise>
						</c:choose>
					</ul></li>
			</ul>
		</div>
	</div>
</nav>

<!-- <div class="tm-hero d-flex justify-content-center align-items-center"
	data-parallax="scroll" data-image-src="">
	<form class="d-flex tm-search-form">
		<input class="form-control tm-search-input" type="search"
			placeholder="Search" aria-label="Search">
		<button class="btn btn-outline-success tm-search-btn" type="submit">
			<i class="fas fa-search"></i>
		</button>
	</form>
</div> -->
