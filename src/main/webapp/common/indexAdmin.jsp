<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>


<div class="container">
	<div class="row">
		<div class="col-4">
			<form method="post" class="form-control"
				enctype="multipart/form-data">
				<div>
					Id: <br> <input class="form-control" name="id"
						value="${video.id}">
				</div>
				<div>
					Title: <br> <input class="form-control" name="title"
						value="${video.title}">
				</div>
				<div>
					Poster: (${video.poster})<br> <input class="form-control"
						name="poster" value="${video.poster}" type="hidden"> <input
						name="poster_file" type="file">
				</div>
				<div>
					View Count: <br> <input class="form-control" name="views"
						value="${video.views}">
				</div>
				<div>
					Description: <br> <input class="form-control"
						name="description" value="${video.description}">
				</div>
				<div>
					<button class="btn btn-primary" formaction="${pageContext.request.contextPath}/admin/video/create">Create</button>
					<button class="btn btn-primary" formaction="${pageContext.request.contextPath}/admin/video/update">Update</button>
					<button class="btn btn-primary" formaction="${pageContext.request.contextPath}/admin/video/delete/${video.id}">Delete</button>
					<a href="${pageContext.request.contextPath}/admin/video/index">Reset</a>
				</div>
			</form>
		</div>
		<div class="col-8">
			<table class="table table-striped table-hover">
				<thead class="table-light">
					<tr>
						<th scope="col">STT</th>
						<th scope="col">Youtube Id</th>
						<th scope="col">Youtube Tite</th>
						<th scope="col">Poster</th>
						<th scope="col">View Account</th>
						<th scope="col">Description</th>
						<th scope="col">Chỉnh sửa</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="v" items="${videosAd }" varStatus="loop">
						<tr>
							<th scope="row">${loop.index + 1 }</th>
							<td>${v.id}</td>
							<td>${v.title}</td>
							<td>${v.poster}</td>
							<td>${v.views}</td>
							<td>${v.description}</td>
							<td><a
								href="${pageContext.request.contextPath}/admin/video/edit/${v.id}"
								class="btn btn-warning">Edit</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>


		</div>

	</div>

</div>