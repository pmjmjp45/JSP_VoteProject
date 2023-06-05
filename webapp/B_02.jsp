<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--JSP 파일에서 한글 인코딩 위해 꼭 있어야 함--%>
<%@ page import="kopo14.vote.dao.*, kopo14.vote.domain.*" %>
<%--자바 클래스 임포트--%>
<%@ page import="java.util.*" %>
<%--필요한 자바의 기능을 임포트--%>
<% request.setCharacterEncoding("utf-8");%>
<%--값을 받는 파일의 인코딩--%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표</title>
    <style>
 
    	body button, input {
    		width: 100px;
    		height : 30px;
    		font-size: 1rem;
		  	font-weight: 400;
		  	text-align: center;
		  	margin: 3px;
    	}
    	#button{
    		text-align: center;
    	}
    	.msg {
    		text-align:center;
    	}

    </style>
</head>
<body>
	<div id="button">
		<button onclick="location.href='A_01.jsp'">후보등록</button>
	    <button onclick="location.href='B_01.jsp'" style="background-color: yellowgreen">투표</button>
	    <button onclick="location.href='C_01.jsp'">개표결과</button>
	</div>
	<div class="msg">
	<%
		int number = Integer.parseInt(request.getParameter("number"));
		int age = Integer.parseInt(request.getParameter("age"));
		
		VoteItemDao voteItemDao = new VoteItemDaoImpl();
		boolean voteResult = voteItemDao.vote(number, age);

		if (voteResult == true) {
			out.println("투표 완료");
		} else {
			out.println("투표 실패");
		}
	%>
	</div>


</body>
</html>