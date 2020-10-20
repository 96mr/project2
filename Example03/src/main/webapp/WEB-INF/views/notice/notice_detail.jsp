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
				<h1>공지사항</h1>
				<h5>인스 소식과 정보를 안내해드립니다.</h5>
			</div>
			<div class="mt-4">
            <table class="table table-bordered">
                <tr>
                  <td class="text-center">제목</td>
                  <td>어쩌고 저쩌고 여행 입니다</td>
                  <td class="text-center">작성자</td>
                  <td>김아무개</td>
                </tr>
                <tr>
                  <td class="text-center">첨부파일</td>
                  <td>첨부파일이 존재하지 않습니다.</td>
                  <td class="text-center">날짜</td>
                  <td>2020.00.00</td>
                </tr>
                <tr>
                  <td class="text-center" colspan="4">내용</td>
                </tr>
                <tr>
                  <td colspan="4" style="height:500px;">
                    0000년 00월 00일 ㅇㅇㅇ 일정을 알려드립니다.
                  </td>
                </tr>
            </table>
          </div>
          <button class="btn btn-dark" type="button" name="button">목록</button>
		</div>
	</div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  </body>
</html>