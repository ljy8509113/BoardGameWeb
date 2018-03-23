<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<link rel="stylesheet" href="/BoardGameWeb/css/bootstrap.min.css">
<title>게임 작성글 수정</title>
<style>
	h3 {
		margin: 50px 0;
	}
	#gmodibutton {
		margin-bottom: 50px;
	}
	#gmodibutton > input {
		margin: 10px 10px;
	}
</style>
</head>
<body>
	<div>
		<jsp:include page="menu/menu-top.jsp" flush="false"/>
	</div>
		
	<div class="container">
		
	<h3>게임 글 수정</h3>
	
	<form method="post" enctype="multipart/form-data" action="<c:url value='/admin/gameListModify.do' />">
		<div class="form-group">
			<label>번호 : </label>
			<label>${ game.gameNo }</label>
		</div>
		<div class="form-group">
			<label>작성자 : </label>
			<label>${ admin.nickname } (${ admin.id })</label>
		</div>
		<div class="form-group">
			<label for="title">제목</label>
			<input class="form-control" type="text" name="title" value="${ game.title }">
		</div>
		<div class="form-group">
			<label for="description">설명</label>
			<textarea class="form-control" name="description" rows="10">${ game.description }</textarea>
		</div>
		<div class="form-group">
			<label for="state">상태</label>
			<input class="form-control" type="text" name="state" value="${ game.state }">
		</div>
		<div class="form-group">
			<label for="version">버전</label>
			<input class="form-control" type="text" name="version" value="${ game.version }">
		</div>
		<div class="form-group">
			<label>대표 이미지</label>
			<input class="form-control" type="file" name="coverImage" value="${ game.coverImage }">
		</div>
		<div class="form-group">
			<label>서브 이미지</label>
			<input type="button" value="추가" onclick="addImage();">
			<div class="sub_image form-control">
				<c:set var="count" value="0"></c:set>
				<c:forEach items="${ subImages }" var="subImage">
					<c:set var="count" value="${count+1}"></c:set>
					<div id="layout_${count}" style="margin-top:10px; margin-bottom:10px;">
						<input type="file" name="sub${count}" value="${savePath}/${subImage.path}">
						<input type="button" id="button_${count}" value="remove" onclick="remove(this);">
					</div>
				</c:forEach>
			</div>
		</div>
		<div id="gmodibutton" align="right">
			<input class="btn btn-secondary" type="submit" value="글 수정">
			<input class="btn btn-secondary" type="reset" value="입력한 내용 삭제">
		</div>
		
		<input type="hidden" name="gameNo" value="${ game.gameNo }">
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
			console.log("child : " + child.length);
			
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
					remove(this);
				});
				
				var input = document.createElement("input");
				$(input).attr('type', "file");
				$(input).attr('name', "sub"+index);
				
				$(layout).append(input);
				$(layout).append(button);
				$('.sub_image').append(layout);
				index++;
			}
		}	
		
		function remove(button){
			var index = $(button).attr("id").split("_")[1];
			console.log(index);
			$('#layout_'+index).remove();
		}
	</script>
</body>
</html>