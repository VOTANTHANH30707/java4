<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<nav class="navbar navbar-expand-lg bg-secondary-subtle">
	<div class="container-fluid"> 
		<a class="navbar-brand" href="${pageContext.request.contextPath}/admin/home"> <i
			class="fas fa-film mr-2"></i> Online Entertaiment
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
					aria-current="page" href="${pageContext.request.contextPath}/admin/home">HOME</a></li>
				<li class="nav-item dropdown">
					<!-- Place this where you want to display the username --> <a
					class="nav-link dropdown-toggle" href="#" role="button"
					data-bs-toggle="dropdown" aria-expanded="false">${username}</a>

					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="${pageContext.request.contextPath}/dang-nhap">Đăng
								nhập</a></li>
						<li><a class="dropdown-item" href="${pageContext.request.contextPath}/dang-ky">Đăng
								Ký</a></li>
						<li><a class="dropdown-item" href="${pageContext.request.contextPath}/dang-xuat">Đăng
								xuất</a></li>
						<li><a class="dropdown-item" href="${pageContext.request.contextPath}/doi-mat-khau">Đổi
								Mật Khẩu</a></li>
						<li><a class="dropdown-item" href="${pageContext.request.contextPath}/cap-nhat">Cập
								nhật tài khoảng</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</nav>