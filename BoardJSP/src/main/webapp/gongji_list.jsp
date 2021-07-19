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
<link rel="stylesheet" href="./css/gongji_list.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>gongji_list</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	int boardId = Integer.parseInt(request.getParameter("boardId"));
	BoardItemService boardItemService = new BoardItemServiceImpl();
	
	String cPage_str = request.getParameter("cPage");
	int cPage;
	if (cPage_str == null || cPage_str == "") {
		cPage = 1;
	} else {
		cPage = Integer.parseInt(cPage_str);
	}
	
	List<BoardItem> boardItems;
	ArrayList<Integer> pages = null;
	String keyWord = request.getParameter("keyWord");
	String searchWord = request.getParameter("searchWord");
	if(searchWord == null || searchWord == "" || keyWord == null || keyWord == "") {
		boardItems = boardItemService.selectAll(boardId, cPage);
		pages = boardItemService.pages(cPage, boardId);
	} else {
		boardItems = boardItemService.search(keyWord, searchWord, boardId);
	}

	request.setAttribute("boardItems", boardItems);
	request.setAttribute("pages", pages);
	
%>
<c:choose>
	<c:when test="${fn:length(boardItems) > 0}">
		<div class="table-outer">
			<table cellspacing=1 width=600 id="table_one">
				<tr id="tr_id">
					<th>제목</th>
					<th>등록일</th>
					<th>조회수</th>
				</tr>
				<c:forEach var="boarditem" items="${boardItems}">
					<tr align=center>
						<td width=500><a href="gongji_view.jsp?gongjiId=${boarditem.id}">${boarditem.title}</a></td>
						<td width=500>${boarditem.date}</td>
						<td width=100>${boarditem.viewCnt}</td>
					</tr>
				</c:forEach>
				<div id="paging">
					<a href="?boardId=<%=boardId%>&cPage=${pages.get(1)}" id='start'>   <<   </a>
					<a href="?boardId=<%=boardId%>&cPage=${pages.get(5)}" id='pn'>   <   </a>
					<c:forEach var="i" begin="${pages.get(1)}" end="${pages.get(2)}">
						<c:if test="${i == pages.get(0)}">
							<a href="?boardId=<%=boardId%>&cPage=${i}" id='b'>${i}</a>
						</c:if>
						<c:if test="${i != pages.get(0)}">
							<a href="?boardId=<%=boardId%>&cPage=${i}">${i}</a>
						</c:if>
					</c:forEach>
					<a href="?boardId=<%=boardId%>&cPage=${pages.get(4)}" id='pn'>   >   </a>
					<a href="?boardId=<%=boardId%>&cPage=${pages.get(2)}" id='end'>   >>   </a>
			</div>
			</table>
			<table cellspacing=1 width=600 border=0>
				<tr>
					<form action="gongji_list.jsp" id="search">
						<input type="hidden" name="boardId" id="boardId" value="<%=boardId%>">
					    <td><select name="keyWord" id="keyWord" form="search">
					        <option value="content">내용</option>
					        <option value="title">제목</option>
					    </select></td>
						<td width=500><input type="text" id="searchWord" name="searchWord" placeholder="검색할 내용을 입력해주세요"><button>검색</button></td>
					</form>
					<td><input type=button value="신규" id="new" OnClick="window.location='gongji_insert.jsp?boardId=<%=boardId%>'"></td>
					<td><input type=button value="게시판 목록" id="boardlist" OnClick="window.location='board_list.jsp'"></td>
				</tr>
			</table>
		</c:when>
	<c:otherwise>

	
<%
		if(searchWord == null || searchWord == "" || keyWord == null || keyWord == "") {
		out.println("<p class='table-outer'>게시글이 없습니다.<input type='button' value='신규' OnClick='window.location=\"gongji_insert.jsp?boardId=" + boardId + "\"'><p>");
		} else {
			out.println("<p class='table-outer'>검색된 내용이 없습니다.<input type='button' value='돌아가기' OnClick='window.location=\"gongji_list.jsp?boardId=" + boardId + "\"'><p>");
		}
%>
		
	</c:otherwise>
</c:choose>

</div>
</body>
</html>