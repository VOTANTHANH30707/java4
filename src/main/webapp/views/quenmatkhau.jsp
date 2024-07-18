<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/common/head.jsp"%>
</head>
<body>
	<form class="vh-100" style="background-color: #508bfc;">
		<div class="container py-5 h-100">
			<div class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-12 col-md-8 col-lg-6 col-xl-5">
					<div class="card shadow-2-strong" style="border-radius: 1rem;">
						<div class="card-body p-5">

							<h3 class="mb-5 text-center">Quên Mật Khẩu</h3>

							<div class="form-outline mb-4">
								<label class="form-label" >Email</label>
								 <input type="email" name="email" class="form-control form-control-lg" />

							</div>

							<div class="text-center">
								<button class="btn btn-primary btn-lg btn-block ps-5 pe-5"
									type="submit">Xác Nhận</button>

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