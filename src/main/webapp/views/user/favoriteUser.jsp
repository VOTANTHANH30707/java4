<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<style>
.video-wrapper {
	position: relative;
	padding-bottom: 56.25%;
	height: 0;
	overflow: hidden;
}

.video-wrapper iframe {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}
</style>
<div class="container tm-container-content tm-mt-60">
	<div class="row mb-4">
		<h2 class="col-6 tm-text-primary">List videos Favorite</h2>
	</div>

	<div class="row tm-mb-90 tm-gallery">
		<c:forEach var="f" items="${favoritesList}">
			<c:set var="v" value="${f.video}" />
			<div class="col-md-4">
				<div class="panel panel-default">
					<div class="panel-body">
						<a href="${pageContext.request.contextPath}/video/detail/${v.id}"> <img
							class="imgs-responsive w-100" src="${pageContext.request.contextPath}/template/user/img/${v.poster}">
						</a>
					</div>
					<div class="panel-footer" style="height: 80px">${v.title}</div>
					<div class="panel-footer text-right">
						<a href="${pageContext.request.contextPath}/video/khonglike/${f.id}"
							class="btn btn-xs btn-success">Unlike</a> <a href=""
							class="btn btn-xs btn-info">Share</a>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>

