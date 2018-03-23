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
	<link rel="stylesheet" href="/BoardGameWeb/css/admin.min.css">
	<title>Notice List</title>

</head>
<body>
	<div class="menutop">
		<jsp:include page="menu/menu-top.jsp" flush="false"/>
	</div>

	<div class="container">
	
		<table id="gntable" class="table table-hover">
		<caption>공지사항</caption>
			<thead>
				<tr id="gnListtr">
					<th id="thno">No.</th>
					<th id="thtitle">제목</th>
					<th id="thdate">등록일</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${ list }" var="notice">
				<tr id="gnListtr">
					<td>${ notice.no }</td>
					<td><a href="<c:url value='/admin/noticedetail.do?no=${ notice.no }' />">${ notice.title }</a></td>
					<td>
					<fmt:formatDate value="${ notice.regDate }" type="both" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		
		<div id="gnbutton" align="right">
		<a href="<c:url value='/admin/noticeAdd.do' />">
			<button type="button" class="btn btn-secondary btn-sm px-4 py-3 mx-2">글쓰기</button>
		</a>
		</div>
		
	</div>
	
	<div class="menubottom">
		<jsp:include page="menu/menu-bottom.jsp" flush="false"/>
	</div>
	
	<script src="/BoardGameWeb/js/jquery-3.3.1.min.js"></script>
	<script src="/BoardGameWeb/js/popper.min.js"></script>
	<script src="/BoardGameWeb/js/bootstrap.min.js"></script>
</body>
</html>