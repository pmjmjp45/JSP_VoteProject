<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--JSP 파일에서 한글 인코딩 위해 꼭 있어야 함--%>
<%@ page import="kopo14.vote.dao.*, kopo14.vote.domain.*" %>
<%--자바 클래스 임포트--%>
<%@ page import="java.util.*" %>
<%--필요한 자바의 기능을 임포트--%>
    
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
    	
    	table {
    		width : auto;
    		text-align: center;
    		border-collapse: collapse;
    		margin-left: auto;
 			margin-right: auto;
    	}
    	
    	
    </style>
</head>
<body>
	<div id="button">
		<button onclick="location.href='A_01.jsp'">후보등록</button>
	    <button onclick="location.href='B_01.jsp'" style="background-color: yellowgreen">투표</button>
	    <button onclick="location.href='C_01.jsp'">개표결과</button>
	</div>
	<table>
   

		<tr>
			<form method="get" action="B_02.jsp">
				<td>
		 			<label for="vote">투표할 후보</label>
		 			<select id="vote" name="number" size="1" required>
		 				<option value="" selected>=====</option>
	<%
		VoteItemDao voteItemDao = new VoteItemDaoImpl();
		List<VoteItem> showAll= voteItemDao.showCandidates();

		for (int i = 0; i < showAll.size(); i++) {
			
			out.println("<option value='" + showAll.get(i).getNumber() + "'>" + showAll.get(i).getNumber() + "번 " + showAll.get(i).getName() + "</option>");
		}
	%>
		 			</select>
		 		</td>

	 			<td>
	 				<label for="vote">투표자 연령대</label>
		 			<select id="vote" name="age" size="1" required>
		 				<option value="" selected>=====</option>
		 				<option value="10">10대</option>
		 				<option value="20">20대</option>
		 				<option value="30">30대</option>
		 				<option value="40">40대</option>
		 				<option value="50">50대</option>
		 				<option value="60">60대</option>
		 				<option value="70">70대</option>
		 				<option value="80">80대</option>
		 				<option value="90">90대</option>
		 			</select>
		 			<input type="submit" value="투표">
		 	</form>
	</table>

</body>
</html>