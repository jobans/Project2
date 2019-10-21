<%@page import="dao.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// idCheck.jsp
	
	// encoding 처리
	request.setCharacterEncoding("UTF-8");
	
	// 이전 페이지에서 ajax를 통해 넘긴 파라미터 받기 
	String id = request.getParameter("id");

	// DB 연결해서 해당 id가 존재하면 true, 없으면 false return
	UsersDAO dao = new UsersDAO();
	boolean flag = dao.duplicateIdCheck(id);
	
	out.println(flag);
%>