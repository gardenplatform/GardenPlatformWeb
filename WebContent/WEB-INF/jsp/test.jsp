<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

</head>
<body>
<h1> DB Test </h1>
	<form class="form-horizontal" id="boardForm" role="form" action="postBoard.do" method="post">
	  <div class="form-group">
	    <label class="col-sm-2 control-label">Title : </label>
	    <div class="col-sm-9">
	      <input type="text" id="boardTitle" class="form-control" name="title" placeholder="title">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="inputPassword" class="col-sm-2 control-label">Content : </label>
	    <div class="col-sm-9">
			<textarea id="boardContent" class="form-control" rows="10" name="content" placeholder="content"></textarea>
	    </div>
	  </div>
	  <div class="form-group">
	    <div class="col-sm-offset-2 col-sm-9">
	      <button type="button" id="boardSubmitBtn" class="btn btn-default">Submit</button>
	    </div>
	  </div>
	</form>
	
	
	<table class="table table-hover">
		<tr>
		    <th>Num</th>
		    <th>Title</th> 
	    	<th>User</th> 
	    	<th>Time</th>
		</tr>
		<c:forEach var="boardInfo" items="${boardList}" varStatus="status">
		<tr>
			<td>${boardInfo.b_id}</td>
			<td>${boardInfo.b_title}</td>
			<td>${boardInfo.b_user}</td>
			<td>${boardInfo.b_time}</td>
		</tr>
		</c:forEach>
	</table>
	
	
	<script>
	(function($) {
		$('#boardSubmitBtn' ).click(function() {
			
			var title = $('#boardTitle').val();
			var content = $('#boardContent').val();

			if(title  == "" || content  == "") {	
				console.log("All fileds are required.");
				alert("All fileds are required.");
			}
			else {
				$("#boardForm").submit();
			}
			console.log();
		});
	
	})(jQuery);
	
	
	function postBoard(title, content) {
		
	
		$.ajax({
			type : "POST",
			url : "postBoard.do",
			data : boardInfo,
			success : function(data) {
				var obj = jQuery.parseJSON(data);
				console.log(obj);
				if(obj.status=="success") {
					location.href="home.do";
				}
				else {
					location.href="error.do?status="+obj.status+"&msg="+obj.msg;
				}
			},
			error : function(xhr, status, error) {
				location.href="error.do?status="+status+"&msg="+error;
			}
		});	
	}
	</script>
</body>
</html>