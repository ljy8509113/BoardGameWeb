<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head><title>공지 목록</title></head>
<body>
	<h2>공지사항</h2>
	<table>
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
								${ notice.regDate }</a></td>
		</tr>
		</c:forEach>
		</tbody>
	</table>
</body>
</html>