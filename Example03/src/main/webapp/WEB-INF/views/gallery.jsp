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
    	label{cursor:pointer}
  		input[type="file"]{display:none;}
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
				<c:if test="${sessionID.verify == 9 || sessionID.verify == 1}">
				<div class="text-right">
					<a href="${pageContext.request.contextPath}/gallery/upload">사진업로드</a>	
				</div>
				</c:if>
				<div id="gallery-list">
					<div class="row justify-content-center m-4">
						<c:forEach var="list" items="${list}">
							<div class="col-sm-3 p-2">
								<div class="card p-2">
									<img src="${pageContext.request.contextPath}/resources/images/${list.SAVE_NAME}" class="card-img" style="width: 100%;" alt="...">
									<div class="card-body">
										<h4 class="card-title">${list.TITLE}</h4>
									</div>
								</div>
							</div>
						</c:forEach>		
					</div>
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
