<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
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
    <title>공지사항</title>
  </head>
  <body>
    <div class="container justify-content-center">
    	<%@ include file="/WEB-INF/views/nav.jsp"%>
		<div class="justify-content-center" style="height: 100vh">
			<div class="bg-info p-4" style="height: 25vh;">
				<h1>${sessionID.name }님</h1>
				<h5>개인정보</h5>
			</div>
			<div class="text-center">
				<div class="row mx-auto justify-content-center">
					<div class="col-sm-3 m-2 border">
						<div class="m-2">
							<ul class="navbar-nav mr-auto text-center">
								<li class="nav-item m-2 p-2 border-bottom"><a href="${pageContext.request.contextPath }/" class="nav-link">회원정보수정</a></li>
								<li class="nav-item m-2 p-2 border-bottom"><a href="${pageContext.request.contextPath }/" class="nav-link">비밀번호변경</a></li>
								<li class="nav-item m-2 p-2"><a href="${pageContext.request.contextPath }/" class="nav-link">친구목록</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-8 m-2 p-2 border">내용내용</div>
				</div>
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