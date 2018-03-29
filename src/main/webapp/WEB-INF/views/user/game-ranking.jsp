<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head><title>게임 랭킹</title>
	<meta charset="utf-8"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/custom.css">
</head>
<body>
	<div class="container">
        <h1>랭킹</h1>
        <div>
        <c:forEach items="${ gamelist }" var="game">
			<label><input type="radio" name="radio" value="${ game.gameNo }">${game.title}</label>
		</c:forEach>
		</div>
        <table class="table table-hover">
            <thead>
		<tr>
			<th scope="col">순위</th>
			<th scope="col">닉네임</th>
			<th scope="col">총 점수</th>
			<th scope="col">게임 횟수</th>
			<th scope="col">승리 횟수</th>
			<th scope="col">패배 횟수</th>
			<th scope="col">점수를 획득하지 못한 경기</th>
		</tr>
	</thead>
	<tbody>
		<c:set var="count" value="0"></c:set>
		<c:forEach items="${ scorelist }" var="score">
		<tr>
			<c:set var="count" value="${count+1}"></c:set>
			<td scope="row"><c:out value="${count}"></c:out></td>
			<td scope="row">${ score.nickName }</td>
			<td scope="row">${ score.point }</td>
			<td scope="row">${ score.total }</td>
			<td scope="row">${ score.win }</td>
			<td scope="row">${ score.lose }</td>
			<td scope="row">${ score.disconnect }</td>
		</tr>
		</c:forEach>
	</tbody>
	</table>
    </div>
    
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>