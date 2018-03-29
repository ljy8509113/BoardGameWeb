<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head><title>게임 소개</title>
	<meta charset="utf-8"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/introcustom.css">
</head>
<body>
	<div class="container-fluid">
		<div class="navbar btn btn-primary btn-lg btn-block">
			<h3 class="text-center">게임 목록</h3>
		</div>
		<div class="container" id="wrap">
			<c:forEach items="${gamelist}" var="game">
				<div class="row">
					<div class="col">
						<img alt="게임대표이미지" src="${ uploadpath }/${ game.coverImage }">
					</div>
					<div class="col">
						<ul>
								<li>${ game.title }</li>
								<li>${ game.description }</li>
								<li>상태 - ${ game.state }</li>
						</ul>
					</div>
				</div>
				<hr>
			</c:forEach>
		</div>
		<a href="<c:url value='/index.html'/>">홈화면 이동</a><br><!-- 데이터를 가져올 필요가 없으므로 .html을 씀 -->
	 <footer class="bg-danger mt-4 p-5 text-center" style="color: #fff">
	 	<span>Copyright &copy; 2018 BoardGame Group All Rights Reserved</span>
	 </footer>

	</div>
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>