<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head><title>공지사항 목록</title></head>
<body>
	<h2>공지사항</h2>
	<table>
		<tr>
			<th>제목</th>
			<th>내용</th>
			<th>작성일</th>
		</tr>
		<tr>
			<td>${ notice.description }</td>
			<td>${ notice.title }</td>
			<td>${ notice.regDate }</td>
		</tr>
	</table>
</body>
</html>