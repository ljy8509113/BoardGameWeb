<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<link rel="stylesheet" href="/BoardGameWeb/css/bootstrap.min.css">
<title>공지사항</title>
</head>
<body>
	<div>
		<jsp:include page="menu/menu-top.jsp" flush="false"/>
	</div>

	<h1>공지사항</h1>
	
	<ul>
		<li>${ notice.title }</li>
		<li><fmt:formatDate value="${ notice.regDate }" pattern="yyyy-MM-dd HH:mm:ss" /></li>
		<li>${ admin.nickname }</li>
	</ul>
	<div>
		${ notice.description }
	</div>
	<div>
		<c:if test="${ !empty notice.link }">
		<a href="${ notice.link }">바로가기</a>
		</c:if>
	</div>
	<div>
		<a href="<c:url value='/admin/noticeRemove.do?no=${ notice.no }' />">삭제</a>
		<a href="<c:url value='/admin/noticeModify.do?no=${ notice.no }' />">수정</a>
	</div>
	
	<div>
		<jsp:include page="menu/menu-bottom.jsp" flush="false"/>
	</div>
	
	<script src="/BoardGameWeb/js/jquery-3.3.1.min.js"></script>
	<script src="/BoardGameWeb/js/popper.min.js"></script>
	<script src="/BoardGameWeb/js/bootstrap.min.js"></script>
	
</body>
</html>