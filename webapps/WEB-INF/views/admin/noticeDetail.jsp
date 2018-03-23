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
<style>
	#ndetailtable {
			margin-top: 50px;
		}
	caption { 
		    caption-side: top;
		    font-size: 2.5rem;
		    margin-bottom: 10px;
		}
	#trdes {
		height: 400px;
	}
	th {
		text-align: center;
	}
	#thtitle {
		width: 300px;
	}
	#thdate {
		width: 250px;
	}
	#tdname {
		text-align: right;
		padding-right: 50px;
	}
	#ndetailbutton {
		margin: 50px 0;
	}
</style>
</head>
<body>
	<div>
		<jsp:include page="menu/menu-top.jsp" flush="false"/>
	</div>
	
	<div class="container">	
		<table id="ndetailtable" class="table table-bordered">
			<caption>공지사항</caption>
			<thead>
				<tr>
					<th>No.${ notice.no }</th>
					<th id="thtitle" colspan="2">${ notice.title }</th>
					<th id="thdate"><fmt:formatDate value="${ notice.regDate }" pattern="yyyy-MM-dd HH:mm:ss" /></th>
				</tr>
				<tr>
					<td id="tdname" colspan="4">${ admin.nickname }</td>
				</tr>
				<tr id="trdes">
					<td colspan="4">${ notice.description }</td>
					
				</tr>
				<tr>
					<td colspan="4">
						<c:if test="${ !empty notice.link }">
							<a href="${ notice.link }">바로가기</a>
						</c:if>
					</td>
				</tr>
			</thead>
		</table>
		
		<div id="ndetailbutton" align="right">
			<a href="<c:url value='/admin/noticeRemove.do?no=${ notice.no }' />">
				<button type="button" class="btn btn-secondary btn-sm px-4 py-3 mx-2">삭제</button>
			</a>
			<a href="<c:url value='/admin/noticeModify.do?no=${ notice.no }' />">
				<button type="button" class="btn btn-secondary btn-sm px-4 py-3 mx-2">수정</button>
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