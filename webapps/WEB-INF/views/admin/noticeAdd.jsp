<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<link rel="stylesheet" href="/BoardGameWeb/css/bootstrap.min.css">
	<link rel="stylesheet" href="/BoardGameWeb/css/admin.css">
<title>공지사항 작성</title>

</head>
<body>
	<div>
		<jsp:include page="menu/menu-top.jsp" flush="false"/>
	</div>
	
	<div class="container">
	
	<h3>공지사항 작성</h3>
	<form action="<c:url value="/admin/noticeAdd.do" />" method="post" enctype="multipart/form-data">
		<div class="form-group">
			<label>작성자 : </label>
			<label>${ admin.nickname }</label>	
			<input type="hidden" value="${ admin.id }" name="writer">
		</div>
		<div class="form-group">
			<label for="title">제목</label>
			<input class="form-control" type="text" name="title">
		</div>
		<div class="form-group">
			<label for="description">내용</label>
			<textarea class="form-control" name="description" rows="10"></textarea>
		</div>
		<div class="form-group">
			<label for="showTime">showTime</label>
			<input class="form-control" type="datetime-local" name="showTime">
		</div>
		<div class="form-group">
			<label for="endTime">endTime</label>
			<input class="form-control" type="datetime-local" name="endTime">
		</div>
		
		<fieldset class="form-group">
		  <div class="row">
		     <legend class="col-form-label col-sm-2 pt-0">타입</legend>
	      <div class="col-sm-10">
	        <div class="form-check">
	          <input class="form-check-input" type="radio" name="type" id="type1" value="B" checked>
	          <label class="form-check-label" for="type1">
	          	 	게시판용
	          </label>
	        </div>
	        <div class="form-check">
	          <input class="form-check-input" type="radio" name="type" id="type2" value="G">
	          <label class="form-check-label" for="type2">
	            	게임공지용
	          </label>
	        </div>
	      </div>
	     </div>
	   </fieldset>

		<div class="form-group">
			<label for="link">참고 주소 </label>
			<input class="form-control" type="url" name="link">
		</div>

		<fieldset class="form-group">
		  <div class="row">
		     <legend class="col-form-label col-sm-2 pt-0">게임번호</legend>
	      <div class="col-sm-10">
	        <div class="form-check">
	          <input class="form-check-input" type="radio" name="gameNo" id="gameNo0" value="0" checked>
	          <label class="form-check-label" for="gameNo0">
	          	 	전체공지
	          </label>
	        </div>
	        <div class="form-check">
	          <input class="form-check-input" type="radio" name="gameNo" id="gameNo1" value="1">
	          <label class="form-check-label" for="gameNo1">
	            	다빈치코드
	          </label>
	        </div>
	      </div>
	    </div>
	  </fieldset>
		
		<div id="gnbutton" align="right">
			<input class="btn btn-secondary btn-sm px-4 py-3 mx-2" type="submit" value="작성">
			<input class="btn btn-secondary btn-sm px-4 py-3 mx-2" type="reset" value="전체 삭제">
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