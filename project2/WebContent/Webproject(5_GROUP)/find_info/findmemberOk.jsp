<%@page import="vo.UsersVO"%>
<%@page import="dao.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	findmemberOk.jsp
-->

<%
	// 멤버 찾고 확인해서

	request.setCharacterEncoding("UTF-8"); 
	
	String name = request.getParameter("name");
	String pno = request.getParameter("pno");
	String email = request.getParameter("email");
	
	if(name != "" && pno != "" && email != ""){
		UsersDAO dao = new UsersDAO();
		UsersVO vo = dao.findMember(name, pno, email);
		dao.close();
%>
	<h1>ID : <%=vo.getId() %></h1>
	<h1>PW : <%=vo.getPw() %></h1>
<%
	}else{
%>
	<h1 align="center">찾으시는 계정이 없습니다</h1>
<%
		
	}
%>







