<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="container">
	<div class="row">
		<div class="col-4">
			<form class="form-control" method="post">
				<input type="hidden" name="id""> <label
					for="id">Username</label> <input type="text" name="username"
					class="form-control" > <label
					for="password">Password</label> <input type="password"
					name="password" class="form-control" >

				<label for="email">Email</label> <input type="text" name="email"
					class="form-control" > <label
					for="fullname">Fullname</label> <input type="text" name="fullname"
					class="form-control" > <br>
				<button
					formaction="${pageContext.request.contextPath}/admin/user/create"
					type="submit" class="btn btn-primary">Create</button>
				<button
					formaction="${pageContext.request.contextPath}/admin/user/reset"
					type="submit" class="btn btn-primary">Reset</button>
			</form>

		</div>
		<div class="col-8">
			<table class="table table-striped table-hover">
				<thead class="table-light">
					<tr>
						<th scope="col">STT</th>
						<th scope="col">User name</th>
						<th scope="col">Fullname</th>
						<th scope="col">Email</th>
						<th scope="col">Role</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="u" items="${usersAd}" varStatus="loop">
						<tr>
							<th scope="row">${loop.index + 1}</th>
							<td>${u.id}</td>
							<td>${u.fullname}</td>
							<td>${u.email}</td>
							<td>${u.admin ? 'admin' : 'user'}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
