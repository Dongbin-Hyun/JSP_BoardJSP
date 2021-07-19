<%@page import="kr.ac.kopo.kopo44.service.*"%>
<%@page import="kr.ac.kopo.kopo44.domain.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteBoard</title>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./css/gongji_delete.css">
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	int gongjiId = Integer.parseInt(request.getParameter("gongjiId"));
	BoardItemService boardItemService = new BoardItemServiceImpl();
	BoardItem boardItem = boardItemService.selectOne(gongjiId);
	boardItemService.delete(boardItem);
	request.setAttribute("boardItem", boardItem);
	%>

	<div id="container">
		<div id="successImg">
			<i class="far fa-check-circle"></i>
		</div>
			<div id="successMsg">
				<p>게시글 삭제 완료.</p>
			</div>
		<div id="btnArea">
			<button id="goToListBtn" onclick="location.href='gongji_list.jsp?boardId=${boardItem.boardId}'">리스트보기</button>
		</div>
	</div>
</body>
</html>