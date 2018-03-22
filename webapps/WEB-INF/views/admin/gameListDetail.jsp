<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<link rel="stylesheet" href="/BoardGameWeb/css/bootstrap.min.css">
<title>게임리스트 상세화면</title>
<style>
	caption { 
	    caption-side: top;
	    font-size: 2.5rem;
	    margin-bottom: 10px;
	}
</style>
</head>
<body>
	
	<div>
		<jsp:include page="menu/menu-top.jsp" flush="false"/>
	</div>
	
	<div class="container">
	
	<table class="table table-hover">
	<caption>게임</caption>
		<tr>
			<td colspan="2"><img alt="게임대표이미지" src="${ uploadpath }/${ game.coverImage }"></td>
		</tr>
		<tr>
			<td>번호</td>
			<td>${ game.gameNo }</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${ game.title }</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${ game.description }</td>
		</tr>
		<tr>
			<td>개발상태</td>
			<td>${ game.state }</td>
		</tr>
		<tr>
			<td>버전</td>
			<td>${ game.version }</td>
		</tr>
	</table>
	
	<div align="right">
		<a href="<c:url value='/admin/gameListModify.do?gameNo=${ game.gameNo }' />">
			<button type="button" class="btn btn-secondary btn-sm px-4 py-3 mx-2">글 수정</button>
		</a>
	</div>
	
	
	
	</div>
	
	<div>
		<jsp:include page="menu/menu-bottom.jsp" flush="false"/>
	</div>
	
	<script src="/BoardGameWeb/js/jquery-3.3.1.min.js"></script>
	<script src="/BoardGameWeb/js/popper.min.js"></script>
	<script src="/BoardGameWeb/js/bootstrap.min.js"></script>
</body>
</html>