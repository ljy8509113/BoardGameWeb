<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<link rel="stylesheet" href="/BoardGameWeb/css/bootstrap.min.css">
	<link rel="stylesheet" href="/BoardGameWeb/css/admin.min.css">
<title>Confirm</title>

</head>
<body>
	
	<div>
		<jsp:include page="menu/menu-top.jsp" flush="false"/>
	</div>

	<div class="container">

		<form action="<c:url value='/admin/noticeRemove.do'/>" method="post">
			<div id="group1">
				<h2>${ no } 번 글을 삭제하시겠습니까?</h2>
				<input type="hidden" name="no" value="${ no }">
			</div>
			<div id="group2">
				<div align="center">
						<input id="button" class="btn btn-secondary btn-sm px-4 py-3 mx-2" type="submit" value="삭제">
					<a href="<c:url value='/admin/noticeList.do?gameNo=1'/>">
						<button id="deletebutton" type="button" class="btn btn-secondary btn-sm px-4 py-3 mx-2">취소</button>
					</a>
				</div>
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