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
	<div class="container">
		<div class="row">
			<form class="col-4" method="post" enctype="multipart/form-data">
				<div class="form-control">
					<label>ID </label> 
					<input type="text" class="form-control"name="id" value=${video.id }>
					 <label>Title</label> 
					 <input class="form-control" value="${video.title }"> 
					 <label>youtube	Count</label>
					  <input type="number" value="0" disabled id="email"class="form-control" value="${video.views }">
					   <input class="mt-2 mb-2" name="poster_file" type="file"> 
					   <input type="text" placeholder="poster" disabled class="form-control"value="${video.poster }"> 
						
						<label>Description</label>
					<textarea class="form-control" cols="30"value="">${video.description }</textarea>

					<div id="role" class="btn-group btn-group-toggle mt-3"
						data-toggle="buttons">
						<label class="btn btn-secondary active"> <input
							type="radio" name="options" value="true"
							${video.active ?'checked':'' }> Active
						</label> <label class="btn btn-secondary"> <input type="radio"
							name="options" value="false" ${!video.active ?'checked':'' }>
							InActive
						</label>
					</div>
					<div class="mt-2">
						<a href="${pageContext.request.contextPath}/video/create"
							class="btn btn-success">Create</a> <a
							href="${pageContext.request.contextPath}/video/delete"
							class="btn btn-danger">Delete</a> <a
							href="${pageContext.request.contextPath}/video/update"
							class="btn btn-warning">Update</a>
						<button class="btn btn-primary">Reset</button>
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
					<c:forEach var="v" items="${videos }" varStatus="loop">
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

</body>
</html>