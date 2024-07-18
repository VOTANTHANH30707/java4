<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
	crossorigin="anonymous"></script>
</head>

<body>
	<form method="post" class="vh-100" style="background-color: #508bfc;">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-12 col-md-8 col-lg-6 col-xl-5">
					<div class="card shadow-2-strong" style="border-radius: 1rem;">
						<div class="card-body p-5">

							<h3 class="mb-5 text-center">Đổi Mật Khẩu</h3>
							<span class="text-center text-danger">${message }</span>

							<div class="form-outline mb-4">
								<label class="form-label">Tên Đăng Nhập</label> <input
									type="text" name="username"
									class="form-control form-control-lg" />
							</div>
							<div class="form-outline mb-4">
								<label class="form-label">Mật Khẩu Cũ</label> <input
									type="password" name="old_pass"
									class="form-control form-control-lg" />

							</div>
							<div class="form-outline mb-4">
								<label class="form-label">Mật Khẩu Mới</label> <input
									type="password" name="new_pass"
									class="form-control form-control-lg" />

							</div>
							<div class="form-outline mb-4">
								<label class="form-label">Nhập Lại Mật Khẩu </label> <input
									type="password" name="again_pass"
									class="form-control form-control-lg" />

							</div>
							<div class="text-center">
								<button formaction="${pageContext.request.contextPath}/doi-mat-khau" class="btn btn-primary btn-lg btn-block ps-5 pe-5"
									type="submit">Đổi Mật Khẩu</button>

								<hr class="my-4">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>

</html>