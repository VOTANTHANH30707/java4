<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<%@ include file="/common/head.jsp"%>
</head>
<!--  -->
<body style="background-color: #508bfc;">
	<div class="container py-5 h-100">
		<div
			class="row d-flex justify-content-center align-items-center h-100">
			<div class="col-12 col-md-8 col-lg-6 col-xl-5">
				<div class="card shadow-2-strong" style="border-radius: 1rem;">

					<div class="card-body p-5">
						<form action="${pageContext.request.contextPath}/dang-nhap"
							method="post">
							<h3 class="mb-5 text-center">Đăng Nhập</h3>
							<span class="text-center text-danger">${message }</span>
							<div class="form-outline mb-4">
								<label class="form-label">Tên Đăng Nhập</label> <input
									value="${usernameLg}" name="username"
									class="form-control form-control-lg" />
							</div>
 
							<div class="form-outline mb-4">
								<label class="form-label">Password</label> <input
									type="password" value="${passwordLg}" name="password"
									class="form-control form-control-lg" />
							</div>

							<!-- Checkbox -->
							<div class="form-check d-flex justify-content-between mb-4">

								<input name="remember" type="checkbox" value="true"> Ghi
								nhớ? </label> <label class="ms-auto mb-0" for=""> <a
									href="${pageContext.request.contextPath }/quen-mat-khau">Quên
										Mật Khẩu</a>
								</label>
							</div>

							<div class="text-center">
								<button class="btn btn-primary btn-lg btn-block ps-5 pe-5"
									type="submit">Đăng nhập</button>
								<hr class="my-4">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>

</html>