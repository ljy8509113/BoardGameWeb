<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
	
<title>menu-top</title>
<style>
	li {
		font-size: 1.3rem;
	}
	#topimg{
		width: 90px;
		height: 70px;
		margin-left: 100px;	
	}
</style>
</head>
<body>

	<nav id="top" class="navbar navbar-expand-md navbar-dark bg-dark">
	<a class="navbar-brand my-3" href="<c:url value='/index.html'/>">
		<img id="topimg" src="/BoardGameWeb/css/game.png" width="90" height="70" 
			class="d-inline-block align-top" alt="img">
			<span>BoardGame</span>
	</a>
	<button class="navbar-toggler" type="button" 
 			data-toggle="collapse" data-target="#navbar">
 		<span class="navbar-toggler-icon"></span>
 	</button>
 	<div id="navbar" class="collapse navbar-collapse">
 		<ul class="navbar-nav mr-auto ml-5 mx-5 my-3 justify-content-center">
 			<li class="nav-item mx-3">
 				<a class="nav-link" href="<c:url value='/admin/gameList.do'/>">GAME LIST</a>
 			</li>
 			<li class="nav-item mx-3">
 				<a class="nav-link" href="<c:url value='/admin/noticeList.do?gameNo=1'/>">NOTICE</a>
 			</li>
 			<li class="nav-item mx-3">
 				<a class="nav-link disabled" href="<c:url value='/index.do'/>">MANAGER</a>
 			</li>
 		</ul>
 		
 	<sec:authorize access="!hasRole('ADMIN')">
 		<a href="<c:url value='/login.do'/>">
			<button type="button" class="btn btn-dark my-3 mr-5 px-4 py-3">
				LogIn
			</button>
 		</a>
 	</sec:authorize>
 		
 	<sec:authorize access="hasRole('ADMIN')">
 		<a href="<c:url value='/logout.do'/>">
			<button type="button" class="btn btn-dark my-3 mr-5 px-4 py-3">
				LogOut
			</button>
 		</a>
 	</sec:authorize>

 	</div>
 </nav>

</body>
</html>