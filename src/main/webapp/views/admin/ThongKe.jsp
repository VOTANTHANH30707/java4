<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container">
	<ul class="nav nav-tabs" id="myTab" role="tablist">
		<li class="nav-item" role="presentation"> 
			<button class="nav-link active" id="home-tab" data-bs-toggle="tab"
				data-bs-target="#home-tab-pane" type="button" role="tab"
				aria-controls="home-tab-pane" aria-selected="true">FAVORITES</button>
		</li>
		<li class="nav-item" role="presentation">
			<button class="nav-link" id="profile-tab" data-bs-toggle="tab"
				data-bs-target="#profile-tab-pane" type="button" role="tab"
				aria-controls="profile-tab-pane" aria-selected="false">FAVORITES
				USER</button>
		</li>
		<li class="nav-item" role="presentation">
			<button class="nav-link" id="share-tab" data-bs-toggle="tab"
				data-bs-target="#share-tab-pane" type="button" role="tab"
				aria-controls="share-tab-pane" aria-selected="false">SHARE
				FRIENDS</button>
		</li> 
	</ul>
	<div class="tab-content" id="myTabContent">

		<!-- favorite -->
		<div class="tab-pane fade show active" id="home-tab-pane"
			role="tabpanel" aria-labelledby="home-tab" tabindex="0">
			<table class="table table-striped table-hover">
				<thead class="table-light">
					<tr>
						<th scope="col">STT</th>
						<th scope="col">VIDEO TITLE</th>
						<th scope="col">FAVORITE COUNT</th>
						<th scope="col">LETTER DAY</th>
						<th scope="col">OLDEST DAY</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">1</th>
						<td>HÔM NAY THỨ HAI</td>
						<td>1500</td>
						<td>31/12/2020</td>
						<td>01/01/2020</td>
					</tr>
					<tr>
						<th scope="row">2</th>
						<td>HÔM NAY THỨ HAI</td>
						<td>1500</td>
						<td>31/12/2020</td>
						<td>01/01/2020</td>
					</tr>
					<tr>
						<th scope="row">3</th>
						<td>HÔM NAY THỨ HAI</td>
						<td>1500</td>
						<td>31/12/2020</td>
						<td>01/01/2020</td>
					</tr>
				</tbody>
			</table>
			<nav aria-label="Page navigation example ">
				<ul class="pagination float-end">
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
					<li class="page-item"><a class="page-link" href="#"><</a></li>
					<li class="page-item"><a class="page-link" href="#">></a></li>
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>
		</div>

		<!-- favorite user -->
		<div class="tab-pane fade" id="profile-tab-pane" role="tabpanel"
			aria-labelledby="profile-tab" tabindex="0">
			<label for="">Videos title ?</label> <input type="text"
				class="input-group">

			<table class="table table-striped table-hover">
				<thead class="table-light">
					<tr>
						<th scope="col">STT</th>
						<th scope="col">USER NAME</th>
						<th scope="col">FULL NAME</th>
						<th scope="col">EMAIL</th>
						<th scope="col">FAVORITES DAY</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">1</th>
						<td>thanhvt</td>
						<td>Võ Tấn Thành</td>
						<td>thanhvtps30707@fpt.edu.vn</td>
						<td>01/01/2020</td>
					</tr>
				</tbody>
			</table>
			<nav aria-label="Page navigation example ">
				<ul class="pagination float-end">
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
					<li class="page-item"><a class="page-link" href="#"><</a></li>
					<li class="page-item"><a class="page-link" href="#">></a></li>
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>
		</div>

		<!-- share friend -->
		<div class="tab-pane fade" id="share-tab-pane" role="tabpanel"
			aria-labelledby="share-tab" tabindex="0">
			<label for="">Videos title ?</label> <input type="text"
				class="input-group">

			<table class="table table-striped table-hover">
				<thead class="table-light">
					<tr>
						<th scope="col">STT</th>
						<th scope="col">SENDER NAME</th>
						<th scope="col">SENDER EMAIL</th>
						<th scope="col">RECEIVER EMAIL</th>
						<th scope="col">SENT DAY</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">1</th>
						<td>Võ Tấn Thành</td>
						<td>thanhvtps30707@fpt.edu.vn</td>
						<td>thanh@gmail.com</td>
						<td>01/01/2020</td>
					</tr>
				</tbody>
			</table>
			<nav aria-label="Page navigation example ">
				<ul class="pagination float-end">
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
					<li class="page-item"><a class="page-link" href="#"><</a></li>
					<li class="page-item"><a class="page-link" href="#">></a></li>
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>
		</div>
	</div>
</div>