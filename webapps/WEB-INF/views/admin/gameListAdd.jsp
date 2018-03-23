<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>게임 정보 작성</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<link rel="stylesheet" href="/BoardGameWeb/css/bootstrap.min.css">
</head>
<style>
	h3 {
		margin: 50px 0;
	}
	#gaddbutton {
		margin-bottom: 50px;
	}
	#gaddbutton > input {
		margin: 0px 10px;
	}
</style>
<body>
	<div>
		<jsp:include page="menu/menu-top.jsp" flush="false"/>
	</div>	
	<div class="container">
	<h3>게임 추가</h3>
	<form action="<c:url value='/admin/gameListAdd.do'/>" method="post" enctype="multipart/form-data">
		<div class="form-group">
			<label>작성자 : </label>
			<label>${ admin.nickname } (${ admin.id })</label>
		</div>
		<div class="form-group">
			<label for="title">제목</label>
			<input class="form-control" type="text" name="title">
		</div>
		<div class="form-group">
			<label for="description">설명</label>
			<textarea class="form-control" name="description" rows="10"></textarea>
		</div>
		<div class="form-group">
			<label for="state">상태</label>
			<input class="form-control" type="text" name="state">
		</div>
		<div class="form-group">
			<label for="version">버전</label>
			<input class="form-control" type="text" name="version">
		</div>
		<!-- 
		<div class="form-group">
			<label for="fileName">프리팹경로</label>
			<input class="form-control" type="text" name="fileName">
		</div>
		 -->
		<div class="form-group">
			<label>대표 이미지</label>
			<input class="form-control" type="file" name="coverImage">
		</div>
		<div class="form-group">
			<label>서브 이미지</label>
			<input type="button" value="추가" onclick="addImage();">
			<div class="sub_image form-control">
			</div>
		</div>
		
		<div id="gaddbutton" align="right">
			<input class="btn btn-secondary btn-sm px-4 py-3 mx-2" type="submit" value="글 작성">
			<input class="btn btn-secondary btn-sm px-4 py-3 mx-2" type="reset" value="글 전체 삭제"><br>
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

	<script type="text/javascript">
		var subImages = [];
		var index = 0;
		function addImage(){
			var child = $('.sub_image').children();
			console.log("child : " + child);
			
			if(child.length >=4){
				alert("최대 4개까지 입력가능");
			}else{
				var layout = document.createElement("div");
				$(layout).attr('id', 'layout_'+index);
				$(layout).css('margin-top',10);
				$(layout).css('margin-bottom',10);
				
				var button = document.createElement("input");
				$(button).attr('type',"button");
				$(button).attr("id",'button_'+index);
				$(button).attr('value','remove');
				$(button).click(function(){
					var index = $(this).attr("id").split("_")[1];
					console.log(index);
					$('#layout_'+index).remove();
					
				});
				
				var input = document.createElement("input");
				$(input).attr('type', "file");
				$(input).attr('class', index);
				$(input).attr('name', "sub"+index);
				
				$(layout).append(input);
				$(layout).append(button);
				$('.sub_image').append(layout);
				index++;
			}
		}		
	</script>
</body>
</html>