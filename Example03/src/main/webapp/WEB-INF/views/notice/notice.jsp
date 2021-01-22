<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
			<div class="p-4 text-light" 
				style="height:25vh;background-image:url('${pageContext.request.contextPath }/resources/images/notion_img.jpg');">
				<h1>공지사항</h1>
				<h5>인스 소식과 정보를 안내해드립니다.</h5>
			</div>
			<div class="text-center">
				<div class=" navbar-expand-sm w-100 justify-content-center ">
					<ul class="navbar-nav m-3 text-center">
						<li class="nav-item"><a href="${pageContext.request.contextPath}/notice/list" class="nav-link">전체</a></li>
						<li class="nav-item"><a href="${pageContext.request.contextPath}/notice/list?category=EDU" class="nav-link">교육</a></li>
						<li class="nav-item"><a href="${pageContext.request.contextPath}/notice/list?category=EVENT" class="nav-link">행사</a></li>
						<li class="nav-item"><a href="${pageContext.request.contextPath}/notice/list?category=ETC" class="nav-link">기타</a></li>
					</ul>
				</div>
				<div id="notice-list">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>글번호</th>
								<th style="width:50%;">제목</th>
								<th>작성자</th>
								<th>날짜</th>
								<th>조회수</th>
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
							<c:forEach var="list" items="${noticeList}">
								<tr onClick="location.href='${pageContext.request.contextPath}/notice/${list.ID}'" style="cursor: pointer;">
									<td>${list.ID }</td>
									<td>${list.TITLE }</td>
									<td>${list.NAME }</td>
									<td><fmt:formatDate value="${list.REGDATE}" pattern="yyyy.MM.dd" /></td>
									<td>${list.HIT}</td>
								</tr>
							</c:forEach>
							</c:otherwise>
						</c:choose>
						</tbody>
					</table>
				</div>
				<ul class="pagination justify-content-center">
				<c:if test="${paging.prev }">
					<li class="page-item">
					<a class="page-link" 
						href="${pageContext.request.contextPath }/notice/list?page=${paging.start_page-1 }&category=${category}">◀</a>
					</li>
				</c:if>
				<c:forEach var="i" begin ="${paging.start_page }" end="${paging.end_page }">
    				<li class="page-item">
    				<a class="page-link" 
    				href="${pageContext.request.contextPath }/notice/list?page=${i}&category=${category}">${i}</a>
    				</li>
				</c:forEach>
				<c:if test="${paging.next }">
					<li class="page-item">
					<a class="page-link" 
					href="${pageContext.request.contextPath }/notice/list?page=${paging.end_page+1 }&category=${category}">▶</a>
					</li>
				</c:if>
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