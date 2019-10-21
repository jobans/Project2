<%@page import="dao.UsersDAO"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- [hello.jsp]

	전 페이지에서 id라는 파라미터로 전달한 값을 출력
	
-->

<%
	request.setCharacterEncoding("UTF-8");
	UsersDAO dao = new UsersDAO();
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String control = request.getParameter("control");
	
	if(dao.login(id, pw)){
		
		String ctxt = URLEncoder.encode(id, "UTF-8");
		
		Cookie c = new Cookie("idCookie", ctxt);
		
		c.setMaxAge(300);
		
		response.addCookie(c);
		
		out.println("<h4>"+ id + " 님 환영합니다" + "</h4>");
		out.println("<input type='button' value='로그아웃' onclick='logout()' />");

	}else{
		
 		out.println("<h5 style='color:red;'>회원정보가 없습니다</h5>");
		out.println("<table>");
		out.println("<tr>");
		out.println("<th>ID:</th>");
		out.println("<td><input type='text' name='id' id='id' placeholder='ID'/></td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<th>PW:</th>");
		out.println("<td><input type='password' name='pw' id='pw' placeholder='PW'/></td>");
		out.println("</tr>");
		out.println("</table>");
		out.println("<input type='button' value='회원가입' onclick='adduser()'/>");
		out.println("<input type='button' value='정보찾기' onclick='finduser()' />");
		out.println("<input type='button' value='로그인' onclick='login()' />");
		
	}
%>
