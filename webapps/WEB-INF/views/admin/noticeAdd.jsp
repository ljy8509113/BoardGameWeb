<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<link rel="stylesheet" href="/BoardGameWeb/css/bootstrap.min.css">
<title>공지사항 작성</title>
</head>
<body>
	<div>
		<jsp:include page="menu/menu-top.jsp" flush="false"/>
	</div>
	
	<div class="container">
	
	<h1>공지사항 작성</h1>
	
	<form action="<c:url value="/admin/noticeAdd.do" />" method="post" enctype="multipart/form-data">
		<div class="form-group">
			<label>작성자 : </label>
			<label>${ admin.nickname }</label>	
			<input type="hidden" value="${ admin.id }" name="writer">
		</div>
		<div class="form-group">
			<label for="title">제목</label>
			<input class="form-control" type="text" name="title">
		</div>
		<div class="form-group">
			<label for="description">내용</label>
			<textarea class="form-control" name="description" rows="10"></textarea>
		</div>
		<div class="form-group">
			<label for="showTime">showTime</label>
			<input class="form-control" type="datetime-local" name="showTime">
		</div>
		<div class="form-group">
			<label for="endTime">endTime</label>
			<input class="form-control" type="datetime-local" name="endTime">
		</div>
		<div class="form-group">
			<label for="type">타입 </label>
				<input class="form-control" type="radio" name="type" value="B" checked> 게시판형
				<input class="form-control" type="radio" name="type" value="G"> 게임공지용
		</div>
		<div class="form-group">
			<label for="link">참고 주소 </label>
			<input class="form-control" type="url" name="link">
		</div>
		<div class="form-group">
			<label for="gameNo">게임번호</label>
				<input class="form-control" type="radio" id="notice1" name="gameNo" value=0 checked> 전체공지
				<input class="form-control" type="radio" id="notice2" name="gameNo" value=1> 1게임공지
		</div>
		
		<div align="right">
			<input class="btn btn-secondary" type="submit" value="작성">
			<input class="btn btn-secondary" type="reset" value="전체 삭제">
		</div>
		
		<input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }">
	
	</form>
	
	</div>
	
	<div>
		<jsp:include page="menu/menu-bottom.jsp" flush="false"/>
	</div>
	
	<script src="/BoardGameWeb/js/jquery-3.3.1.min.js"></script>
	<script src="/BoardGameWeb/js/popper.min.js"></script>
	<script src="/BoardGameWeb/js/bootstrap.min.js"></script>
</body>
</html>