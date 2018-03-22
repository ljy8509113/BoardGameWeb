<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head><title>공지사항 목록</title>
	<meta charset="utf-8"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
	<h2>공지사항</h2>
	<table class="table">
		<tr>
			<th>제목</th>
			<th>작성일</th>
			<th>내용</th>
		</tr>
		<tr>
			<td>${ notice.title }</td>
			<td>${ notice.regDate }</td>
			<td>${ notice.description }</td>
		</tr>
	</table>
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>