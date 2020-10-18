<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

      <nav class="navbar navbar-expand-sm navbar-light" style="padding:0 1%">
        <div class="navbar-collapse collapse w-100 dual-collapse2 order-1 order-md-0">
            <ul class="navbar-nav ml-auto text-center">
                <li class="nav-item active">
                    <a class="nav-link" href="${pageContext.request.contextPath }/notice">공지사항</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="${pageContext.request.contextPath }/gallery">갤러리</a>
                </li>
            </ul>
        </div>
        <div class="mx-auto my-2 order-0 order-md-1 position-relative">
         <button class="navbar-toggler m-2" type="button" data-toggle="collapse" data-target=".dual-collapse2">
                <span class="navbar-toggler-icon"></span>
            </button>
            <a class="m-2" href="${pageContext.request.contextPath }/home">
                <img src="${pageContext.request.contextPath }/resources/images/panda_maltesers.png" style="width:70px" class="rounded-circle border">
            </a>
        </div>
        <div class="navbar-collapse collapse w-100 dual-collapse2 order-2 order-md-2">
            <ul class="navbar-nav mr-auto text-center">
	             <c:choose>
	                <c:when test="${empty sessionID}">
		                <li class="nav-item">
		                    <a class="nav-link" href="${pageContext.request.contextPath }/login">로그인</a>
		                </li>
		                <li class="nav-item">
		                    <a class="nav-link" href="${pageContext.request.contextPath }/register">회원가입</a>
		                </li>
	                </c:when>
	                <c:otherwise>
	                	<li class="nav-item">
		                    <a class="nav-link" href="${pageContext.request.contextPath }/profile">${sessionID.name }님</a>
		                </li>
		                <c:if test="${sessionID.verify == 9}">
		                <li class="nav-item">
		                    <a class="nav-link" href="${pageContext.request.contextPath }/admin/register">
		                    	가입요청 
		                    	<span class="badge badge-dark">1</span>
		                    </a>
		                </li>
		                </c:if>
		                <li class="nav-item">
		                    <a class="nav-link" href="${pageContext.request.contextPath }/logout">로그아웃</a>
		                </li>
	                </c:otherwise>
	            </c:choose>
            </ul>
        </div>
      </nav>
