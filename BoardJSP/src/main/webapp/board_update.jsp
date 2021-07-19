<%@page import="kr.ac.kopo.kopo44.service.*"%>
<%@page import="kr.ac.kopo.kopo44.domain.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="./css/gongji_update.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>updateBoard</title>
<script>
	function submitForm(mode) {
		if (mode == 'write') {
			if ($("#boardName").val().replace(/\s/g,"").length == 0) {
				alert("변경할 이름을 입력해주세요");
				return false;
			} else {
				fm.action = "board_write.jsp";
			}
		} else if (mode == 'delete') {
			fm.action = "board_delete.jsp";
		}
		fm.submit();
	}
</script>
</head>
<body>

	<%
	request.setCharacterEncoding("UTF-8");
	int boardId = Integer.parseInt(request.getParameter("boardId"));
	BoardService boardService = new BoardServiceImpl();
	Board board = boardService.selectOne(boardId);
	request.setAttribute("boards", board);
	%>

	<form method="post" name="fm">
	<table width="650" border="1" cellspacing="0" cellpadding="5">
		<tr>
			<input type="hidden" name="boardId" id="boardId" size="70" maxlength="70" value=${boards.id} readonly>
			<td><b>게시판 이름</b></td>
			<td><input type="text" name="boardName" id="boardName" size=70 maxlength=20 minlength="3" value="${boards.title}" required></td>
		</tr>
	</table>
	<table>
	<tr>
		<td width=600></td>
		<td><input type="button" value="취소" OnClick="location.href='board_list.jsp'"></td>
		<td><input type="button" value="수정" OnClick="submitForm('write')"></td>
		<td><input type="button" value="삭제" OnClick="submitForm('delete')"></td>
	</tr>
	</table>
</form>
</body>
</html> 