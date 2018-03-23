<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<link rel="stylesheet" href="/BoardGameWeb/css/bootstrap.min.css">
	<link rel="stylesheet" href="/BoardGameWeb/css/admin.css">
<title>게임 작성글 수정</title>

</head>
<body>
	<div>
		<jsp:include page="menu/menu-top.jsp" flush="false"/>
	</div>
		
	<div class="container">
		
	<h3>게임 글 수정</h3>
	
	<form method="post" enctype="multipart/form-data" action="<c:url value='/admin/gameListModify.do' />">
		<div class="form-group">
			<label>번호 : </label>
			<label>${ game.gameNo }</label>
		</div>
		<div class="form-group">
			<label>작성자 : </label>
			<label>${ admin.nickname } (${ admin.id })</label>
		</div>
		<div class="form-group">
			<label for="title">제목</label>
			<input class="form-control" type="text" name="title" value="${ game.title }">
		</div>
		<div class="form-group">
			<label for="description">설명</label>
			<textarea class="form-control" name="description" rows="10">${ game.description }</textarea>
		</div>
		<div class="form-group">
			<label for="state">상태</label>
			<input class="form-control" type="text" name="state" value="${ game.state }">
		</div>
		<div class="form-group">
			<label for="version">버전</label>
			<input class="form-control" type="text" name="version" value="${ game.version }">
		</div>
		<div class="form-group">
			<label for="fileName">프리팹경로</label>
			<input class="form-control" type="text" name="fileName" value="${ game.fileName }">
		</div>
		<div class="form-group">
			<label>이미지</label>
			<input class="form-control" type="file" name="coverImage" value="${ game.coverImage }">
		</div>
		<div id="gnbutton" align="right">
			<input class="btn btn-secondary btn-sm px-4 py-3 mx-2" type="submit" value="글 수정">
			<input class="btn btn-secondary btn-sm px-4 py-3 mx-2" type="reset" value="입력한 내용 삭제">
		</div>
		
		<input type="hidden" name="gameNo" value="${ game.gameNo }">
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