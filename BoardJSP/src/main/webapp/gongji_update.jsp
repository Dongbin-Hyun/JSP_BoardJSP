<%@page import="kr.ac.kopo.kopo44.domain.*"%>
<%@page import="java.util.*"%>
<%@page import="kr.ac.kopo.kopo44.service.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gongjiUpdate</title>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./css/gongji_update.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
function submitForm(mode) {
	if (mode == 'write') {
		fm.action = "gongji_write.jsp";
	} else if (mode == 'delete') {
		fm.action = "gongji_delete.jsp";
	}
	fm.submit();
}

$(function() {
	var now = new Date();
	var year = now.getFullYear();
	
	var month = now.getMonth() + 1;
	if (month < 10) {
		month = "0" + month;
	}
	
	var date = now.getDate();
	if (date < 10) {
		date = "0" + date;
	}

	var hours = now.getHours();
	if (hours < 10) {
		hours = "0" + hours;
	}

	var minutes = now.getMinutes();
	if (minutes < 10) {
		minutes = "0" + minutes;
	}

	var seconds = now.getSeconds();
	if (seconds < 10) {
		seconds = "0" + seconds;
	}
	var today = year + "-" + month + "-" + date + " " + hours + ":" + minutes + ":" + seconds;
	
	$("#td_date").append("<input type='text' name='date' id='date' size=70 maxlength=70 value='" + today + "' readonly>");
	

});
</script>
</head>
<body>
<%
	int gongjiId = Integer.parseInt(request.getParameter("gongjiId"));

	BoardItemService boardItemService = new BoardItemServiceImpl();
	BoardItem boardItems = boardItemService.selectOne(gongjiId);
	request.setAttribute("boardItem", boardItems);
%>

<form method="post" name="fm">
	<table width="650" border="1" cellspacing="0" cellpadding="5">
		<tr>
			<td><b>제목</b></td>
			<td><input type="text" name="gongjiTitle" id="gongjiTitle" size=70 maxlength=20 minlength="3" value="${boardItem.title}" required></td>
		</tr>
		<tr>
			<td><b>일자</b></td>
			<td id="td_date">수정날짜 : </td>
		</tr>
		<tr>
			<td><b>내용</b></td>
			<td><textarea style='width:500px; height:250px;' name="content" id="content" cols=70 rows=600 minlength="1" maxlength="1000" required>${boardItem.content}</textarea></td>
		</tr>
	</table>
	<table>
	<tr>
		<td width=600></td>
		<td><input type="button" value="취소" OnClick="location.href='gongji_list.jsp?boardId=${boardItem.boardId}'"></td>
		<td><input type="button" value="수정" OnClick="submitForm('write')"></td>
		<td><input type="button" value="삭제" OnClick="submitForm('delete')"></td>
	</tr>
	</table>
	<input type='hidden' name='boardId' value='${boardItem.boardId}'>
	<input type='hidden' name='gongjiId' value='${boardItem.id}'>
</form>
</body>
</html>