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
<c:if test ="${not empty msg}">
	<script>
		alert("${msg}");
	</script>
</c:if>
    <div class="container justify-content-center">
    	<%@ include file="/WEB-INF/views/nav.jsp"%>
		<div class="justify-content-center" style="height: 100vh">
			<div class="bg-info p-4" style="height: 25vh;">
				<h1>공지사항</h1>
				<h5>인스 소식과 정보를 안내해드립니다.</h5>
			</div>
			<div class="text-center">
				<div id="notice-list">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>카테고리</th>
								<th style="width:60%;">제목</th>
								<th>작성자</th>
								<th>날짜</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
							<c:when test="${empty noticeList}">
								<tr>
								<td class="text-center" colspan="4" style="height:40vh">아직 등록된 게시글이 없습니다.</td>
							</tr>
							</c:when>
							<c:otherwise>
								<tr onClick="location.href='${pageContext.request.contextPath}/detail'" style="cursor: pointer;">
									<td>여행</td>
									<td>어쩌고 저쩌고 여행</td>
									<td>ooo</td>
									<td>2020.09.10</td>
								</tr>
							</c:otherwise>
						</c:choose>
						</tbody>
					</table>
				</div>
				<ul class="pagination justify-content-center">
					<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/notice/">◀</a></li>
					<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/notice?page=1">1</a></li>
					<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/notice?page=2">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">4</a></li>
					<li class="page-item"><a class="page-link" href="#">5</a></li>
					<li class="page-item"><a class="page-link" href="#">▶</a></li>
				</ul>
				<c:if test="${sessionID.verify == 9 }">
					<a href="${pageContext.request.contextPath }/notice/write" class="btn btn-dark">글쓰기</a>
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