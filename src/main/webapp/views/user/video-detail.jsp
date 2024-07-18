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
<div class="container-fluid tm-container-content tm-mt-60">
	<div class="row mb-4">
		<h2 class="col-12 tm-text-primary">Video title goes here</h2>
	</div>
	<div class="row tm-mb-90">
		<div class="col-xl-8 col-lg-7 col-md-6 col-sm-12">
			<div class="video-wrapper">
				<iframe width="560" height="315"
					src="https://www.youtube.com/embed/${video.id}"
					title="YouTube video player" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
					referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

			</div>
			<form method="post">
				<div class="row">
					<div class="d-flex justify-content-between mt-3 h4 col-md-9">
						${video.title}</div>
					<%-- <div>${viewVideo }</div> --%>
					<div class="col-md-3 mt-3 float-end">
						<button id="likeButton"
							formaction="${pageContext.request.contextPath}/video/like/${video.id}"
							type="submit" class="btn btn-primary"
							${isLiked ? 'disabled' : ''}>
							<span>Like</span>
						</button>

						<button type="button" class="btn btn-primary">Share</button>
					</div>
				</div>
			</form>
		</div>
		<div class="col-xl-4 col-lg-5 col-md-6 col-sm-12">
			<div class="tm-video-details">
				<c:forEach var="f" items="${favorites}">
					<div class="card text-center mb-5" style="margin-top: -40px;">
						<div class="card-body">
							<div class="video-wrapper">
								<a
									href="${pageContext.request.contextPath}/video/detail/${f.video.id}">
									<!--lấy video trong ds yêu thích  --> <img
									class="img-responsive w-100"
									src="${pageContext.request.contextPath}/template/user/img/${f.video.poster}">
								</a>
							</div>
						</div>
						<div class="card-footer text-body-secondary">
							<div class="d-flex justify-content-between ">${f.video.title}</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>





