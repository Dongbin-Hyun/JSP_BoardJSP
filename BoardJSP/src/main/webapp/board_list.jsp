<%@page import="kr.ac.kopo.kopo44.service.*"%>
<%@page import="kr.ac.kopo.kopo44.domain.*"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/board_list.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>BoardList</title>
<script>
	function goInsert() {
		window.location.replace("board_insert.jsp");
	}
</script>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String searchWord = request.getParameter("searchWord");
	String cPage_str = request.getParameter("cPage");
	int cPage;
	if (cPage_str == null || cPage_str == "") {
		cPage = 1;
	} else {
		cPage = Integer.parseInt(cPage_str);
	}

	BoardService boardService = new BoardServiceImpl();
	List<Board> boards;
	ArrayList<Integer> pages = null;
	if (searchWord == null || searchWord == "") {
		boards = boardService.selectAll(cPage);
		pages = boardService.pages(cPage);
	} else {
		boards = boardService.search(searchWord);
	}

	request.setAttribute("boards", boards);
	request.setAttribute("pages", pages);

	//	for(Board board: boards) {
	//		out.println("<p>" + board.getId() + board.getTitle() + "</p>");
	//	}
	%>
	<div id="container">
		<form action="board_list.jsp">
			<div id="list">
				<table>
					<c:forEach var="boards" items="${boards}">
						<tr class="boardList">
							<td><c:out value="${boards.title}" /></td>
							<td><a href="gongji_list.jsp?boardId=${boards.id}" class="boardOneView">입장</a></td>
							<td><a href="board_update.jsp?boardId=${boards.id}"><input type="button" value="수정/삭제" id="updateBoard" class="updateBtn"></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div id="paging">
				<a href="?cPage=${pages.get(1)}" id='start'> << </a> <a href="?cPage=${pages.get(5)}" id='pn'> < </a>
				<c:forEach var="i" begin="${pages.get(1)}" end="${pages.get(2)}">
					<c:if test="${i == pages.get(0)}">
						<a href="?cPage=${i}" id='b'>${i}</a>
					</c:if>
					<c:if test="${i != pages.get(0)}">
						<a href="?cPage=${i}">${i}</a>
					</c:if>
				</c:forEach>
				<a href="?cPage=${pages.get(4)}" id='pn'> > </a> <a href="?cPage=${pages.get(2)}" id='end'> >> </a>
			</div>
			<div id="Btn">
				<td width=600><input type="text" id="searchWord" name="searchWord" placeholder="제목 검색">
				<button>검색</button></td> <input type="button" value="게시판 만들기" id="newBoard" onclick="goInsert()">
		</form>
	</div>
	</div>
</body>
</html>