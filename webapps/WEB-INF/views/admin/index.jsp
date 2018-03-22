<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<link rel="stylesheet" href="css/bootstrap.min.css">
<title>HOME PAGE</title>
<script type="text/javascript">
	$(document).ready(function(){
		$('#menu').load("html/menu.html");	
	});
	
</script>
</head>
<body>
	<div id="menu">
		
	</div>
	
	<h1>HOME PAGE</h1>

	<p>
		<sec:authorize access="!hasRole('ADMIN')">
			<a href="<c:url value='/login.do'/>">로그인</a>
		</sec:authorize>
		
		<sec:authorize access="hasRole('ADMIN')">
			<a href="<c:url value='/logout.do'/>">로그아웃</a>
	
			<a href="<c:url value='/admin/gameList.do'/>">게임리스트</a>
			<a href="<c:url value='/admin/noticeList.do?gameNo=1'/>">공지사항</a>
		</sec:authorize>
	</p>


	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>