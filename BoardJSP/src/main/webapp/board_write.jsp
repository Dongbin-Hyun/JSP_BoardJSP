<%@page import="kr.ac.kopo.kopo44.domain.*"%>
<%@page import="kr.ac.kopo.kopo44.service.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./css/gongji_write.css">
<title>writeBoard</title>
</head>
<body>
<%	
	BoardService boardService = new BoardServiceImpl();

	request.setCharacterEncoding("UTF-8");
	String boardName = request.getParameter("boardName");
	int boardId = Integer.parseInt(request.getParameter("boardId"));
	
	if (boardId == 0) {
		Board board = new Board();
		board.setTitle(boardName);
		boardService.create(board);
	} else {
		Board board = boardService.selectOne(boardId);
		board.setId(boardId);
		board.setTitle(boardName);
		boardService.update(board);
	}
	
%>

<div id="container">
	<div id="successImg">
		<i class="far fa-check-circle"></i>
	</div>
		<div id="successMsg">
			<p>게시판 생성 및 수정 완료.</p>
		</div>
	<div id="btnArea">
		<button id="goToListBtn" onclick="location.href='board_list.jsp'">리스트보기</button>
	</div>
</div>
</body>
</html>