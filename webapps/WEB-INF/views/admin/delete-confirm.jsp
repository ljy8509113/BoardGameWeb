<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<link rel="stylesheet" href="/BoardGameWeb/css/bootstrap.min.css">
<title>Confirm</title>
<style>
	#group1 {
		text-align: center;
		margin: 50px;
		padding: 50px;
	}
	#group2 {
		width: 650px;
		padding: 30px;
	}
	#button{
		margin: 10px;
	}
</style>
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
				<div align="right">
						<input id="button" class="btn btn-secondary" type="submit" value="삭제">
					<a href="<c:url value='/admin/noticeList.do?gameNo=1'/>">
						<button id="button" type="button" class="btn btn-secondary">취소</button>
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