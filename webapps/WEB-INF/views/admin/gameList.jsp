<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<link rel="stylesheet" href="/BoardGameWeb/css/bootstrap.min.css">
	<link rel="stylesheet" href="/BoardGameWeb/css/admin.min.css">
<title>Game List</title>

</head>
<body>
	<div>
		<jsp:include page="menu/menu-top.jsp" flush="false"/>
	</div>
	
	<div class="container">
		<table id="gntable" class="table table-hover">
		<caption>게임 목록</caption>
			<thead>
				<tr id="gnListtr">
					<th>사진</th>
					<th>제목</th>
					<th>버전</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ list }" var="game">
					<tr id="gnListtr">
						<td>
							<a href="<c:url value='/admin/gameListDetail.do?gameNo=${ game.gameNo }' />">
								<img id="glistimg" alt="image" src="${ uploadpath }/${ game.coverImage }">
							</a>
						</td>
						<td><a href="<c:url value='/admin/gameListDetail.do?gameNo=${ game.gameNo }' />">${ game.title }</a></td>
						<td>${ game.version }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div id="gnbutton" align="right">
			<a href="<c:url value='/admin/gameListAdd.do' />">
				<button type="gbutton" class="btn btn-secondary btn-sm px-4 py-3 mx-2">등록</button>
			</a>
		</div>
	
	</div>
	
	<div>
		<jsp:include page="menu/menu-bottom.jsp" flush="false"/>
	</div>
	
	<script src="/BoardGameWeb/js/jquery-3.3.1.min.js"></script>
	<script src="/BoardGameWeb/js/popper.min.js"></script>
	<script src="/BoardGameWeb/js/bootstrap.min.js"></script>
</body>
</html>