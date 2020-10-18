<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
    <!-- Required meta tags -->
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <style>
    </style>
    <title>INNERSPACE</title>
</head>
<body>
	<div class="container justify-content-center">
		<%@ include file="/WEB-INF/views/nav.jsp"%>
		<div style="height: 100vh">
			<div class="bg-info p-4 justify-content-center" style="height: 25vh;">
				<h1>갤러리</h1>
				<h5>인스 추억을 담는 공간입니다.</h5>
			</div>
			<div class="mt-4">
				<div id="gallery-list">
					<div class="row justify-content-center m-4">
						<div class="col-sm-3 p-2">
							<div class="card p-2">
								<img src="케로베로니.gif" class="card-img" style="width: 100%;" alt="...">
								<div class="card-body">
									<h4 class="card-title">2016</h4>
									<p class="card-text">
										<small class="text-muted"> 이메일 : @gmail.com<br>
										</small>
									</p>
								</div>
							</div>
						</div>
						<div class="col-sm-3 p-2">
							<div class="card p-2">
								<img src="panda_maltesers.png" class="card-img" style="width: 100%;" alt="...">
								<div class="card-body">
									<h4 class="card-title">2017</h4>
									<p class="card-text">
										<small class="text-muted"> 이메일 : @gmail.com<br>
										</small>
									</p>
								</div>
							</div>
						</div>
						<div class="col-sm-3 p-2">
							<div class="card p-2">
								<img src="panda_maltesers.png" class="card-img"	style="width: 100%;" alt="...">
								<div class="card-body">
									<h4 class="card-title">2018</h4>
									<p class="card-text">어쩌고 저쩌고 날입니다</p>
								</div>
							</div>
						</div>
						<div class="col-sm-3 p-2">
							<div class="card p-2">
								<img src="panda_maltesers.png" class="card-img" style="width: 100%;" alt="...">
								<div class="card-body">
									<h4 class="card-title">2019</h4>
									<p class="card-text">어찌저찌 한 날입니다.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<ul class="pagination justify-content-center">
					<li class="page-item"><a class="page-link" href="#">◀</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">4</a></li>
					<li class="page-item"><a class="page-link" href="#">5</a></li>
					<li class="page-item"><a class="page-link" href="#">▶</a></li>
				</ul>
				<c:if test="${sessionID.verify == 9 || sessionID.verify == 1}">
					<a href="${pageContext.request.contextPath }/write"><i class="fas fa-pen fa-2x"></i></a>
				</c:if>
			</div>
		</div>
	</div>
	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  </body>
</html>
