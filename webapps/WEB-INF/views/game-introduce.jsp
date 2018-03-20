<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head><title>게임 목록</title></head>
<body>
	<a href="<c:url value='/index.html'/>">홈화면 이동</a><br><!-- 데이터를 가져올 필요가 없으므로 .html을 씀 -->
	<table>
		<c:forEach items="${gamelist}" var="game">
	       <tr>
	        <th>소개<h3>${ game.gameNo }</h3></th>
	       </tr>
	       <tr>
	       	<td><h2>${ game.title }</h2></td>
	        <td><h4>${ game.description }</h4></td>
	        <td><h5>${ game.state }</h5></td>
		   </tr>	    
	    </c:forEach>
    </table>
</body>
</html>