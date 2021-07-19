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
	BoardItemService boardItemService = new BoardItemServiceImpl();

	request.setCharacterEncoding("UTF-8");
	String gongjiTitle = request.getParameter("gongjiTitle");
	String date = request.getParameter("date");
	String content = request.getParameter("content");
	int boardId = Integer.parseInt(request.getParameter("boardId"));
	int gongjiId = Integer.parseInt(request.getParameter("gongjiId"));
	
	if (gongjiId == 0) {
		BoardItem boardItem = new BoardItem();
		boardItem.setTitle(gongjiTitle);
		boardItem.setDate(date);
		boardItem.setContent(content);
		boardItem.setBoardId(boardId);
		boardItemService.create(boardItem);
	} else {
		BoardItem boardItem = boardItemService.selectOne(gongjiId);
		boardItem.setId(gongjiId);
		boardItem.setTitle(gongjiTitle);
		boardItem.setDate(date);
		boardItem.setContent(content);
		boardItem.setBoardId(boardId);
		boardItemService.update(boardItem);
	}
	
	
%>

<div id="container">
	<div id="successImg">
		<i class="far fa-check-circle"></i>
	</div>
		<div id="successMsg">
			<p>게시글 생성 및 수정 완료.</p>
		</div>
	<div id="btnArea">
		<button id="goToListBtn" onclick="location.href='gongji_list.jsp?boardId=<%=boardId%>'">리스트보기</button>
	</div>
</div>
</body>
