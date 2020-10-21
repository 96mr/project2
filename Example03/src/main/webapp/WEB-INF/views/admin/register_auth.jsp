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
<c:if test ="${not empty msg}">
	<script>
		alert("${msg}");
	</script>
</c:if>
	<div class="container justify-content-center">
		<%@ include file="/WEB-INF/views/nav.jsp"%>
		<div style="height: 100vh">
			<div class="bg-dark p-4 justify-content-center" style="height: 25vh;">
				<h1>관리자 페이지</h1>
				<h5>회원관리</h5>
			</div>
			<div class="mt-4">
				<div class="p-2">
					<h3>가입 신청</h3>
					<hr class="bg-dark" style="border-width:5px;">
					<div class="row m-4">
					<c:forEach var="list" items="${reqAuthList}">
						<div class="col-sm-2 p-2">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">${list.name }</h4>
									<p class="card-text">
									${list.enter}기
										<form action="${pageContext.request.contextPath }/authMember" method="POST">
											<input type="hidden" name="id" value="${list.id}" />
											<button class="btn btn-dark justify-content-center" type="submit">가입 허락</button>
										</form>
									</p>
								</div>
							</div>
						</div>
					</c:forEach>
					</div>
				</div>
				<div class="p-2">
					<h3>회원 목록</h3>
					<hr class="bg-dark" style="border-width:5px;">
					<div class="row m-4">
					<c:forEach var="list" items="${memberList}">
						<div class="col-sm-3 p-2">
							<div class="card p-2">
								<div class="card-body">
									<h4 class="card-title">${list.name }</h4>
									<p class="card-text">
									${list.enter}기
									</p>
								</div>
							</div>
						</div>
					</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  </body>
</html>
