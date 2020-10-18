<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
  <title>회원가입</title>
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
				<img src="${pageContext.request.contextPath }/resources/images/panda_maltesers.png" class="border rounded-circle" width="60px" alt="logo" />
			</a>
		</nav>

		<section class="col-lg-6 m-auto p-4 border">
			<h1>회원가입</h1>
			<div class="m-auto col-lg-8 p-4">
				<form:form method="post" commandName="member" autocomplete="off">
					<label>아이디</label>
					<form:input path="id" type="text" class="form-control" id ="id" name="id" value="" autocomplete="off" placeholder="아이디를 입력하세요"/><br />
					<form:errors path="id" element="small"/><br><small id="idNotice"></small><br>
					<label>비밀번호</label>
					<form:input path="password" type="password" class="form-control" id="password" name="password" value="" placeholder="비밀번호를 입력하세요"/><br /> 
					<form:errors path="password" element="small"/><br><small id="pwNotice"></small><br>
					<label>비밀번호 확인</label>
					<form:input path="pwCheck" type="password" class="form-control" id="pwCheck" name="pwCheck" value="" placeholder="비밀번호를 입력하세요"/><br /> 
					<form:errors path="pwCheck" element="small"/><br><small id="pwChkNotice"></small><br>
					<label>이름</label>
					<form:input path="name" type="text" class="form-control" id="name" name="name" value="" autocomplete="off" placeholder="이름을 입력하세요"/><br /> 
					<form:errors path="name" element="small"/><br><small id="nameNotice"></small><br>
					<label>기수</label>
					<input type="number" class="form-control" name="enter" value="0" autocomplete="off" placeholder="기수를 입력하세요(ex.20)"/><br /> 
					<small id="enterNotice"></small><br>
					<label>이메일</label>
					<input type="email" class="form-control" name="email" value="" autocomplete="off" placeholder="선택항목 : 이메일을 입력하세요(ex.abcd@aaa.com)"><br />
					<button class="btn btn-dark" type="submit" name="button">가입하기</button>
				</form:form>
			</div>
		</section>
	</div>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script>
//id, pw ajax
	$('#id').keyup(function(){
   	   	var idNotice = $('#idNotice');
   	   	$.ajax({
   	   	   	url:'${pageContext.request.contextPath}/idCheck',
   	   	   	type:'post',
   	   	   	data:{"id":$("#id").val()},
   	   	   	success:function(data){
   	   	   	   	if(data == -1){ // 존재하는 아이디
   	   	   	   		idNotice.text('이미 존재하는 아이디입니다.');
	   	   	   		idNotice.css('color','red');
   	   	   	   	}else if($.trim($("#id").val())==null || data == 0){
   	   	   	   	   	idNotice.text('아이디는 4~20글자로 숫자, 영문자를 조합해주세요.');
   	   	   	   	   	idNotice.css('color','red');
   	   	   	   	}else{
   	   	   	   	   	idNotice.text('사용가능한 아이디입니다.');
   	   	   	   	   	idNotice.css('color','blue');
   	   	   	   	}
   	   	   	}
   	   	 });
   	});
	$("#password").keyup(function(){
		var pwNotice = $('#pwNotice');
		$.ajax({
			url:'${pageContext.request.contextPath}/pwCheck',
			type:'post',
			data:{"pw":$("#password").val()},
			success:function(data){
					if($.trim($("#password").val())==null||data == 0){
						pwNotice.text('비밀번호는 8~30글자로 숫자, 영문자를 조합해주세요.');
	   	   	   	   	   	pwNotice.css('color','red');
					}else{
						pwNotice.text('사용가능한 비밀번호입니다');
	   	   	   	   	   	pwNotice.css('color','blue');
					}
						
				}
		});
	});
	
	$(function(){
		$('#pwCheck').keyup(function(){
			$('#pwChkNotice').text('');
		});

		$('#pwCheck').keyup(function(){
			if($('#password').val() != $('#pwCheck').val()){
				$('#pwChkNotice').text('비밀번호 일치하지 않음');
				$('#pwChkNotice').css("color", "red");
				return false;
			} else{
				$('#pwChkNotice').text('비밀번호 일치함');
			    $('#pwChkNotice').css("color", "blue");
			}
		});

		$('#name').blur(function(){
			$('#nameNotice').text('');
		});
		$('#name').blur(function(){
			var name = $("#name").val().replace(/ /g, "");
			$("#name").val(name);
			if (name.length > 10 || name.length < 1) {
					$('#nameNotice').text('이름은 10글자이내로');
					$('#nameNotice').css('color','red');
					return false;
			}
			
		});
	});
</script>
</body>
</html>