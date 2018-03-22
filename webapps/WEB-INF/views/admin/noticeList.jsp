<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<link rel="stylesheet" href="/BoardGameWeb/css/bootstrap.min.css">
	<title>Notice List</title>
	
	<style>
		table {
			margin: 7%;
			width: 100%;
			height: 600px;
		}
		caption { 
		    caption-side: top;
		    font-size: 2.5rem;
		    margin-bottom: 10px;
		}
		.container {
			min-height: 70%;
		}
		.footer {
		  	height: 50px;
		  	margin-top: -50px;
		}
		
		
	</style>
</head>
<body>
	<div class="menu">
		<jsp:include page="menu/menu-top.jsp" flush="false"/>
	</div>

	<div class="container">
	
		<table class="table table-hover">
		<caption>공지사항</caption>
			<thead>
				<tr>
					<th>No.</th>
					<th>제목</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${ list }" var="notice">
				<tr>
					<td>${ notice.no }</td>
					<td><a href="<c:url value='/admin/noticedetail.do?no=${ notice.no }' />">${ notice.title }</a></td>
					<td>
					<fmt:formatDate value="${ notice.regDate }" type="both" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		
		<div align="right">
		<a href="<c:url value='/admin/noticeAdd.do' />">
			<button type="button" class="btn btn-secondary btn-sm px-4 py-3 mx-2">글쓰기</button>
		</a>
		</div>
		
	</div>
	
	<div class="footer">
		<jsp:include page="menu/menu-bottom.jsp" flush="false"/>
	</div>
	
	<script src="/BoardGameWeb/js/jquery-3.3.1.min.js"></script>
	<script src="/BoardGameWeb/js/popper.min.js"></script>
	<script src="/BoardGameWeb/js/bootstrap.min.js"></script>
</body>
</html>