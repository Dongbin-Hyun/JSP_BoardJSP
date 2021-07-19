<%@page import="kr.ac.kopo.kopo44.domain.*"%>
<%@page import="kr.ac.kopo.kopo44.service.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
    $(document).ready(function(){
        location.href="gongji_view.jsp?gongjiId=" +  $("#id").val();
    });
        
    </script>
<title>Insert title here</title>
</head>
<body>
<%
	CommentService commentService = new CommentServiceImpl();
	Comment comment = new Comment();
	request.setCharacterEncoding("utf-8");
	int gongjiId = Integer.parseInt(request.getParameter("gongjiId"));
	String commentId_str = request.getParameter("comment_id");
	
	int commentId;
	if (commentId_str == null || commentId_str == "") {
		String user = request.getParameter("comments_user");
		String commentsContent = request.getParameter("comments_content");

		comment.setUser(user);
		comment.setPostid(gongjiId);
		comment.setContent(commentsContent);
		commentService.create(comment);
	} else {
		commentId = Integer.parseInt(commentId_str);
		out.println(commentId);
		comment.setId(commentId);
		comment.setPostid(gongjiId);
		commentService.delete(comment);
	}
	
	
%>
<input type="hidden" name="id" id="id" value="<%=gongjiId%>">

</body>
</html>