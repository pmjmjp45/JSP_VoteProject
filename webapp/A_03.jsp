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
<title>후보등록</title>
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
    		width : 500px;
    		text-align: center;
    		border-collapse: collapse;
    		margin-left: auto;
 			margin-right: auto;
    	}
    	th, td {
    		border: solid 1px;
    	}
    	table td:nth-child(3) {
    		width: 110px;
    		border: none;
    		text-align: left;
    	}
    </style>
    <script type="text/javascript">
 
    function characterCheck(obj){
 		var regExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi; 

 			if( regExp.test(obj.value) ){
	
 				obj.value = null;
  			}
    }
  </script>
</head>
<body>
	<div id="button">
		<button onclick="location.href='A_01.jsp'" style="background-color: yellowgreen">후보등록</button>
	    <button onclick="location.href='B_01.jsp'">투표</button>
	    <button onclick="location.href='C_01.jsp'">개표결과</button>
	</div>
	<table>
        <tr> <!--한 줄 추가-->
            <th>기호</th> <!--테이블 헤더(굵은 글씨, 중앙 정렬)-->
            <th>이름</th>
            <th style="border: none"></th>
       	</tr>
   
	<%
		String input = request.getParameter("input");
		int inputNum = Integer.parseInt(request.getParameter("inputNum"));
	
		VoteItemDao voteItemDao = new VoteItemDaoImpl();
		
		List<VoteItem> showInsert= voteItemDao.insertCandidates(inputNum, input);
		
		for (int i = 0; i < showInsert.size(); i++) {
	%>
		<tr>
			<td><%=showInsert.get(i).getNumber() %></td>
			<td><%=showInsert.get(i).getName() %></td>
			<td>
				<form method="get" action="A_02.jsp">
					<button type="submit" name="delete" value= <%=showInsert.get(i).getNumber() %>>삭제</button>
				</form>
			</td>
		</tr>
	
	<%} 
		int num = 1;
		for (int i = 0; i <showInsert.size(); i++) {
			if ((i + 1) != showInsert.get(i).getNumber()) {
				num = i + 1; 
				break;
			}
			num++;
		}
	%>
		<tr>
			<td>
				<form method="get" action="A_03.jsp">
				<input type="text" name="inputNum" value="<%=num %>" readonly/></td>
			<td>
				<input type="text" name="input" onkeyup='characterCheck(this)' maxlength="10" required/>
			</td>
			<td><input type="submit" value="추가"/> </td>
		</form></tr>
		
	</table>

</body>
</html>