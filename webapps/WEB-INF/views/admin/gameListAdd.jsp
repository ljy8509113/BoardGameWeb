<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<link rel="stylesheet" href="/BoardGameWeb/css/bootstrap.min.css">
<title>게임 정보 작성</title>
</head>
<body>

	<div>
		<jsp:include page="menu/menu-top.jsp" flush="false"/>
	</div>	
	
	<div class="container">
	<h2>게임 정보 작성</h2>
	<form action="<c:url value='/admin/gameListAdd.do'/>" method="post" enctype="multipart/form-data">
		
		<div class="form-group">
			<label>작성자 : </label>
			<label>${ admin.nickname } (${ admin.id })</label>
		</div>
		<div class="form-group">
			<label for="title">제목</label>
			<input class="form-control" type="text" name="title">
		</div>
		<div class="form-group">
			<label for="description">설명</label>
			<textarea class="form-control" name="description" rows="10"></textarea>
		</div>
		<div class="form-group">
			<label for="state">상태</label>
			<input class="form-control" type="text" name="state">
		</div>
		<div class="form-group">
			<label for="version">버전</label>
			<input class="form-control" type="text" name="version">
		</div>
		<div class="form-group">
			<label for="fileName">프리팹경로</label>
			<input class="form-control" type="text" name="fileName">
		</div>
		<div class="form-group">
			<label>이미지</label>
			<input class="form-control" type="file" name="coverImage">
		</div>
		
		<div align="right">
		<input class="btn btn-secondary" type="submit" value="글 작성">
		<input class="btn btn-secondary" type="reset" value="글 전체 삭제"><br>
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