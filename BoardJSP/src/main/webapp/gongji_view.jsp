<%@page import="kr.ac.kopo.kopo44.domain.*"%>
<%@page import="java.util.*"%>
<%@page import="kr.ac.kopo.kopo44.service.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./css/gongji_view.css">
<title>gongjiView</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>

	 $(document).ready(function(){
		 console.log("dsdfs");
		 $('#co_update_Btn_f').hide();
	    });
	function submitCh() {
			co_form.action="gongji_comments.jsp";
			co_form.submit();
		}
	
	function update() {
		$('#co_update_Btn_f').show();
		$('#co_update_Btn').hide();
		$("#co_user").attr("readonly",false);
		$("#co_content").attr("readonly",false);	
	}
	
	function updateFinish() {
		$('#co_update_Btn').show();
		$('#co_update_Btn_f').hide();
		commentUpdate.action = "";
		
	}
</script>
</head>
<body>
<%
	int gongjiId = Integer.parseInt(request.getParameter("gongjiId"));

	BoardItemService boardItemService = new BoardItemServiceImpl();
	
	BoardItem boardItems = boardItemService.selectOne(gongjiId);
	boardItemService.viewCntUp(boardItems);
	request.setAttribute("boardItem", boardItems);
	String content = boardItems.getContent().replace("\r\n","<br>");
	
	CommentService commentService = new CommentServiceImpl();
	List<Comment> comments = commentService.selectAll(gongjiId);
	request.setAttribute("comments", comments);
%>
	<div>
		<table width=650 border=1 cellspacing=0 cellpadding=5>
			<tr>
				<td><b>제목</b></td>
				<td>${boardItem.title}</td>
			</tr>
			<tr>
				<td><b>일자</b></td>
				<td>${boardItem.date}</td>
			</tr>
			<tr>
				<td><b>조회수</b></td>
				<td>${boardItem.viewCnt}</td>
			</tr>
			<tr>
				<td><b>내용</b></td>
				<td><%=content%></td>
			</tr>
		</table>
		<table id="button">
			<tr>
				<td width=550></td>
				<td><input type=button value="목록" OnClick="location.href='gongji_list.jsp?boardId=${boardItem.boardId}'"></td>
				<td><input type=button value="수정/삭제" OnClick="location.href='gongji_update.jsp?gongjiId=${boardItem.id}'"></td>
			</tr>
		</table>
		<hr>
			<form name="commentUpdate">
				<table width="600">
					<c:choose>
						<c:when test="${fn:length(comments) == 0}">
							<p>댓글이 없습니다.</p>
						</c:when>
						<c:otherwise>
							<c:forEach var="comments" items="${comments}">
								<tr id='tr_comments'>
									<td><input type="text" id='co_user' value="${comments.user}" style="border:none" readonly><br><sapn id='co_date'>${comments.date}</sapn></td>
									<td><input type="text" id='co_content' value="${comments.content}" style="border:none" readonly></td>
									<td><input type="button" value="수정완료" id='co_update_Btn_f'></td>
									<td><input type="button" value="수정" id='co_update_Btn' onclick="update()"></td>
									<td id='co_delete_Btn'><a href='gongji_comments.jsp?comment_id=${comments.id}&gongjiId=${comments.postid}'>삭제</a></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
			</form>
		<hr>
		<form action="gongji_comments.jsp" method="post">
			<table id="comments">
				<tr>
					<td><input type="text" name="comments_user" id="comments_user" placeholder="작성자를 입력해주세요" required>
					<td><textarea name="comments_content" id="comments_content" cols="50" rows="5" placeholder="욕설,비방X." required></textarea></td>
					<td id="td_comment_button"><input type="submit" id="comment_button" value="입력"></td>
					<input type="hidden" name="gongjiId" id="gongjiId" value="${boardItem.id }">
				</tr>
			</table>
		</form>
	</div>
</body>
</html>