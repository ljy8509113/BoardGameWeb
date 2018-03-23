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
	#glisttable {
			margin-top: 50px;
		}
	caption { 
	    caption-side: top;
	    font-size: 2.5rem;
	    margin-bottom: 10px;
	}
	#imgtd {
		width: 400px;
		height: 600px;
	}
	th {
		text-align: center;
	}
	#glistbutton {
		margin: 50px 0;
	}
</style>
</head>
<body>
	<div>
		<jsp:include page="menu/menu-top.jsp" flush="false"/>
	</div>
	
	<div class="container">
	
	<table id="glisttable" class="table">
	<caption>게임</caption>
		<tr>
			<td id="imgtd" colspan="2"><img alt="게임대표이미지" src="${ uploadpath }/${ filename }"></td>
		</tr>
		<tr>
			<th>번호</th>
			<td>${ game.gameNo }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${ game.title }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${ game.description }</td>
		</tr>
		<tr>
			<th>개발상태</th>
			<td>${ game.state }</td>
		</tr>
		<tr>
			<th>버전</th>
			<td>${ game.version }</td>
		</tr>
		<c:forEach items="${subImages}" var="sub">
		<tr>
			<th>서브 이미지</th>
			<td><img src="${ uploadpath }/${sub.path}"></td>
		</tr>
		</c:forEach>
	</table>
	
	<div id="glistbutton" align="right">
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