<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head><title>게임 랭킹</title></head>
<body>
	<h1>랭킹</h1>
	<ol>
		<li><a href="<c:url value='#?no=${ user.email }'/>">${ user.nickname }</a></li>
		<li></li>
		<li></li>
	</ol>
</body>
</html>