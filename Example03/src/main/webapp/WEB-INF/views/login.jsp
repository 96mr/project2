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
  <title>로그인</title>
</head>
<body>
<c:if test ="${not empty msg}">
	<script>
		alert("${msg}");
	</script>
</c:if>
  <div class="container justify-content-center text-center">
    <nav class="m-2">
      <a href="${pageContext.request.contextPath }/home">
      	<img src="${pageContext.request.contextPath }/resources/images/panda_maltesers.png" class="border rounded-circle" width="60px" alt="logo"/>
      </a>
    </nav>
    <section class="col-lg-6 m-auto p-4 border">
      <h1>로그인</h1>
      <div class="m-auto col-lg-8 p-4">
        <form method="post">
          <input type="text" class="form-control" name="id" value="" autocomplete="off" placeholder="아이디를 입력하세요"><br/>
          <input type="password" class="form-control" name="password" value="" placeholder="비밀번호를 입력하세요"><br/>
          <button class="btn btn-dark" type="submit" name="button">로그인</button>
        </form>
      </div>
      <div class="m-3">
        <a href="">아이디찾기</a>|<a href="">비밀번호찾기</a>
        <a href="${pageContext.request.contextPath }/register">회원가입</a>
      </div>
    </section>
  </div>
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  </body>
</html>