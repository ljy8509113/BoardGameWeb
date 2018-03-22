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
<body>
	<h1>게임 정보 작성</h1>
	<form id="fileForm" action="<c:url value='/admin/gameListAdd.do'/>" method="post" enctype="multipart/form-data">
		<div>
			<span>작성자: </span>
			<span>${ admin.nickname } (${ admin.id })</span>
		</div>
		<div>
			<label>제목<input type="text" name="title"></label>
		</div>
		<div>
			<label>설명</label>
			<textarea name="description"></textarea>
		</div>
		<div>
			<label>상태<input type="text" name="state"></label>
		</div>
		<div>
			<label>버전<input type="text" name="version"></label>
		</div>
		<div>
			<label>프리팹경로<input type="text" name="fileName"></label>
		</div>
		<div>
			<label>대표 이미지<input type="file" name="coverImage"></label>
		</div>
		<input type="button" value="추가" onclick="addImage();">
		<div class="sub_image">
		</div>
		
		
		<input type="submit" value="글 작성">
		<input type="reset" value="글 전체 삭제"><br>
		
		<a href="<c:url value='/admin/gameList.do' />">게임 목록으로 이동</a>
		
		<input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }">
		
		
	</form>
	
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
		/*
		function send(){
			var fileData = $('form').serializeArray();
			var formData = new FormData($("form")[0]);

			$.ajax({
					type : "POST",
					url : "/BoardGameWeb/admin/gameListAdd.do",
					enctype: 'multipart/form-data',
					cache : false,
					data : fileData,
					success : function(html){
						alert("성공");
					},
					error : function(error){
						alert("업로드 실패");
						console.log(error);
					}
			});
		}*/
		
		function send() {
			$('#fileForm').ajaxForm({
				success: function(result){
					alert(result);
				},
				error: function(error){
					alert("업로드 실패");
					console.log(error);
				}
			});
			// 여기까지는 ajax와 같다. 하지만 아래의 submit명령을 추가하지 않으면 백날 실행해봤자 액션이 실행되지 않는다.
			$("#fileForm").submit();
		}
		
	</script>
	
</body>
</html>