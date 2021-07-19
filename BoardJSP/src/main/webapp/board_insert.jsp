<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*, java.net.*" %>
<%@ page import="java.text.SimpleDateFormat,java.util.Date" %>

<html>
<head>
	<link rel="stylesheet" href="./css/board_insert.css">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<title>createBoard</title>
	<script>
		function back() {
			window.location="board_list.jsp";
		}
	</script>
</head>
<body>
	<div id="container">
		<form action="board_write.jsp">
			<input type="hidden" name="boardId" id="boardId" size="70" maxlength="70" value="0" readonly>
			<input type="text" name="boardName" id="boardName" placeholder="게시판 이름을 입력해주세요" required/>
			<input type="submit" name="sub" id="sub" value="만들기">
			<input type="button" value="취소" onclick="back()">
		</form>
	</div>
</body>
</html>                                                                                                              