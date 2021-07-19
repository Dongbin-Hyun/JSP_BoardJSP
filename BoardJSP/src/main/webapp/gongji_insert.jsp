<%@page import="kr.ac.kopo.kopo44.domain.*"%>
<%@page import="java.util.*"%>
<%@page import="kr.ac.kopo.kopo44.service.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/gongji_list.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>gongji_insert</title>
<script>

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
	
	$("#td_date").prepend(today + "<input type=hidden name='date' value='" + today + "'>");
	

});
</script>
<style>
#content {
	resize: none;
 	font-family: Jua, sans-serif;
}
</style>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		int boardId = Integer.parseInt(request.getParameter("boardId"));
	%>
	<form method=post action="gongji_write.jsp">
		<table width=650 border=1 cellspacing=0 cellpadding=5>
			<tr>
				<td><b>번호</b></td>
				<td>신규<input type='hidden' name='gongjiId' value='0'></td>
				<input type='hidden' name='boardId' value='<%=boardId%>'>
			</tr>
			<tr>
				<td><b>제목</b></td>
				<td><input type=text name=gongjiTitle id=gongjiTitle size=70 maxlength=20 placeholder="제목을 입력해주세요" required></td>
			</tr>
			<tr>
				<td>일자</td>
				<td id="td_date"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea style='width:500px; height:250px;' name=content id="content" cols=70 rows=600 minlength="1" maxlength="1000" placeholder="내용을 입력해주세요" required></textarea></td>
			</tr>
		</table>
		<table>
			<tr>
				<td width=600></td>
				<td><input type=button value="취소" OnClick="location.href='gongji_list.jsp?boardId=<%=boardId%>'"></td>
				<td><input type=submit value="쓰기"></td>
			</tr>
		</table>
	</form>
</body>
</html>