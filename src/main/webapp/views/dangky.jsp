<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/common/head.jsp"%>
</head>
<body>

	<div class="container-fuild py-5 h-100 vh-100"
		style="background-color: #508bfc;">
		<div
			class="row d-flex justify-content-center align-items-center h-100">
			<div class="col-12 col-md-8 col-lg-6 col-xl-5">
				<div class="card shadow-2-strong" style="border-radius: 1rem;">
					<div class="card-body p-5">
						<form method="post"
							action="${pageContext.request.contextPath}/dang-ky">
							<h3 class="mb-5 text-center">Đăng Ký</h3>
							<span class="text-center text-danger">${message }</span>

							<div class="form-outline mb-4">
								<label class="form-label">Email</label> 
								<input type="email"	 name="email" class="form-control form-control-lg" />

							</div>

							<div class="form-outline mb-4">
								<label class="form-label">Tên Đăng Nhập</label> 
								<input type="text" name="username" 	class="form-control form-control-lg" />

							</div>
							<div class="form-outline mb-4">
								<label class="form-label">Họ Và Tên</label>
								 <input type="text"	name="fullname" class="form-control form-control-lg" />

							</div>

							<div class="form-outline mb-4">
								<label class="form-label">Password</label>
								 <input type="password" name="password" class="form-control form-control-lg" />
							</div>

							<div class="text-center">
								<button  class="btn btn-primary btn-lg btn-block ps-5 pe-5"
									type="submit">Đăng Ký</button>
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