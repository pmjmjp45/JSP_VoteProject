<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--JSP 파일에서 한글 인코딩 위해 꼭 있어야 함--%>
<%@ page import="kopo14.vote.dao.*, kopo14.vote.domain.*"%>
<%--자바 클래스 임포트--%>
<%@ page import="java.util.*"%>
<%--필요한 자바의 기능을 임포트--%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개표결과</title>
<style>
body button, input {
	width: 100px;
	height: 30px;
	font-size: 1rem;
	font-weight: 400;
	text-align: center;
	margin: 3px;
}
#button{
    text-align: center;
}

table{
	width: auto;
	text-align: center;
	border-collapse: collapse;
	margin-left: auto;
 	margin-right: auto;
}

table td, th {
	border: solid 1px;
	width: 380px;
	height: 30px;
	padding: 0;
}

.graph {
	width: 380px;
	display: flex;
    justify-content: flex-start;
    align-items: center
}

.graph-bar {
	
	height: 20px;
	background-color: green;
}

</style>
</head>
<body>
	<div id="button">
		<button onclick="location.href='A_01.jsp'">후보등록</button>
		<button onclick="location.href='B_01.jsp'">투표</button>
		<button onclick="location.href='C_01.jsp'"
			style="background-color: yellowgreen">개표결과</button>
	</div>
	<h3 style="display: flex; justify-content: center;">후보 별 득표율</h3>
	<table>
		<tr>
			<%
				VoteItemDao voteItemDao = new VoteItemDaoImpl();
				List<VoteItem> showAll = voteItemDao.showResultAll();
				
				for (int i = 0; i < showAll.size(); i++) {
					
			%>
			<td style="width: auto; padding: 3px;"><a href='C_02.jsp?number=<%=showAll.get(i).getNumber()%>&name=<%=showAll.get(i).getName()%>'>
				<%=showAll.get(i).getNumber()%>번 <%=showAll.get(i).getName()%></a></td>
			<td>
				<div class="graph">
					<div class="graph-bar" style="width: <%= showAll.get(i).getResultRate()%>%;"></div>
					<div class="bar-label"><%=showAll.get(i).getResultVote() %>(<%=showAll.get(i).getResultRate()%>%)</div>
				 </div>
			</td>
		</tr>
		<%} %>

	</table>

</body>
</html>