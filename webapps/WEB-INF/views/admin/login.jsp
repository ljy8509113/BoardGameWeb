<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<link rel="stylesheet" href="/BoardGameWeb/css/bootstrap.min.css">
	<link rel="stylesheet" href="/BoardGameWeb/css/admin.min.css">
<title>Login</title>

</head>
<body>
	<div>
		<jsp:include page="menu/menu-top.jsp" flush="false"/>
	</div>
	
	<div id="logincontainer" class="container">
		<form id="loginform" action="<c:url value='/login-processing' />" method="post">
			<h2>LogIn</h2><br><br>
		
			<div id="login-form-group" class="form-group">
				<label for="id">ID</label>
				<input class="form-control" type="text" name="id" required>
			</div>
			<div id="login-form-group" class="form-group">
				<label for="password">Password</label>
				<input class="form-control" type="password" name="password" required>
			</div>
			<br>
			<div id="login-form-group" class="form-group" align="right">
				<input class="btn btn-secondary" type="submit" value="LogIn">
			</div>
			<input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }">
		</form>
		
		<c:if test="${ param.error == 'login' }">
			<p id="loginp" style="color:#FF0000">아이디 혹은 비밀번호를 잘못 입력했습니다.</p>
		</c:if>
		
		<c:if test="${ param.logout == 'true' }">
			<p id="loginp" style="color:#FF0000">로그아웃 하였습니다.</p>
		</c:if>
	
	</div>
	
	<div>
		<jsp:include page="menu/menu-bottom.jsp" flush="false"/>
	</div>
	
	<script src="/BoardGameWeb/js/jquery-3.3.1.min.js"></script>
	<script src="/BoardGameWeb/js/popper.min.js"></script>
	<script src="/BoardGameWeb/js/bootstrap.min.js"></script>
	
</body>
</html>