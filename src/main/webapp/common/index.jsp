<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="container tm-container-content tm-mt-60">
	<div class="row mb-4">
		<h2 class="col-6 tm-text-primary">List videos</h2>
	</div>

	<div class="row tm-mb-90 tm-gallery">
		<c:forEach var="v" items="${videos}">
			<div class="col-xl-4 col-lg-5 col-md-6 col-sm-6 col-12 mb-5">
				<figure class="effect-ming tm-video-item">
					<img
						src="${pageContext.request.contextPath}/template/user/img/${v.poster}"
						alt="Image" class="img-fluid">
					<figcaption
						class="d-flex align-items-center justify-content-center">
						<h2>Play</h2>
						<a href="${pageContext.request.contextPath}/video/detail/${v.id}"></a>
					</figcaption>
				</figure>
				<div class="d-flex justify-content-between ">
					<b>${v.title}</b>
				</div>
				
			</div>
		</c:forEach>
	</div>
</div>
<!-- <div class=" tm-mb-90 d-flex justify-content-center mb-5"
	style="width: 100px; margin: 0 auto;">
	<div class="btn-group btn-group-lg" role="group"
		aria-label="Large button group">
		<button type="button" class="btn btn-outline-primary"><<</button>
		<button type="button" class="btn btn-outline-primary">1</button>
		<button type="button" class="btn btn-outline-primary">2</button>
		<button type="button" class="btn btn-outline-primary">3</button>
		<button type="button" class="btn btn-outline-primary">>></button>
	</div>
</div> -->