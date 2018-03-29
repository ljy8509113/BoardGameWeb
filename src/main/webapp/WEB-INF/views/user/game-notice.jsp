<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head><title>공지 목록</title>
<meta charset="utf-8"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	
	<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
	<h2>공지사항</h2>
	<table class="table table-striped">
		<thead>
		<tr>
			<th>제목</th>
			<th>작성일</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${noticelist}" var="notice">
		<tr>
			<td><a href="<c:url value='/game-notice-detail.do?no=${ notice.no }'/>">${notice.title} 
								</a></td>
			<td>${ notice.regDate }</td>
		</tr>
		</c:forEach>
		</tbody>
	</table>
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>