<%@page import="vo.WebBoardVO"%>
<%@page import="dao.WebBoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp</title>
<style type="text/css">
	table{
		width: 1000px;
		margin: 0 auto;
	}
 
	table, tr, th, td{
		border: 1px solid black;
		border-collapse: collapse;
	}
	
	th {
		padding: 2px;
		background: -webkit-gradient(linear,78% 20%, 10% 20%, from(#66ffff), to(#ffff80));
	}
	.col1, .col4{
		width: 10%;
		text-align: center;
	}
	
	.col2{
		width: 60%;
	}
	.col3{
		width: 20%;
	}
	
</style>

</head>
<body>
<form action="deleteOk.jsp" >

	<table>
		<tr>
			<th class="col1">게시물 번호</th>
			<th class="col2">제목</th>
			<th class="col3">작성자</th>
			<th class="col4">조회수</th>
		</tr>
		
		<%
			WebBoardDAO dao = new WebBoardDAO();
			ArrayList<WebBoardVO> list = dao.getFullData();
			
			for(WebBoardVO vo : list){
		
		%>
		<tr>
			<td class="col1"> <input type="checkbox" name="bno" id="" value="<%= vo.getBno() %>"/> <%= vo.getBno() %></td>
			<td class="col2">
				
				<a href="detail.jsp?bno=<%= vo.getBno() %> "><%=vo.getBname() %></a></td>
			<td class="col3"><%= vo.getUserno() %></td>
			<td class="col4"><%= vo.getHits() %></td>
		</tr>
		<%
			}
			/* dao.close(); */
		%>
		<tr>
			<td colspan="4">
				<a href="write.jsp"><input type="button" value="등록" /></a>
				
				<input type="submit" value="삭제" />
			</td>
		</tr>
	</table>
</form>
</body>
</html>