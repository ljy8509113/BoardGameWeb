<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<link rel="stylesheet" href="/BoardGameWeb/css/bootstrap.min.css">
	<link rel="stylesheet" href="/BoardGameWeb/css/admin.css">
<title>HOME PAGE</title>

</head>
<body>
	<div>
		<jsp:include page="menu/menu-top.jsp" flush="false"/>
	</div>
	
	<section>
      <div id="carousel" class="carousel slide" data-ride="carousel" data-interval="2000">
        <ol class="carousel-indicators">
          <li data-target="#carousel" data-slide-to="0" class="active"></li>
          <li data-target="#carousel" data-slide-to="1"></li>
          <li data-target="#carousel" data-slide-to="2"></li>
        </ol>
        
        <!-- 슬라이드 사진 -->
        <div class="carousel-inner">
          <!-- Slide One -->
          <div class="carousel-item active">
          	<img class="d-block w-100 h-100" src="css/ggg.jpeg" alt="첫번째">
          </div>
          <!-- Slide Two -->
          <div class="carousel-item">
            <img class="d-block w-100 h-100" src="css/eee.jpg" alt="두번째">
          </div>
          <!-- Slide Three -->
          <div class="carousel-item">
            <img class="d-block w-100 h-100" src="css/fff.jpg" alt="세번째">
          </div>
        </div>
        
        <!-- 좌우 버튼 -->
        <a class="carousel-control-prev" href="#carousel" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon"></span>
        </a>
        <a class="carousel-control-next" href="#carousel" role="button" data-slide="next">
          <span class="carousel-control-next-icon"></span>
        </a>
      </div>
    </section>

	
	<div>
		<jsp:include page="menu/menu-bottom.jsp" flush="false"/>
	</div>

	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

</body>
</html>