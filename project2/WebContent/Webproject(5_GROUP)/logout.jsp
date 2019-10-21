<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie c = new Cookie("idCookie", "-150");
	c.setMaxAge(0);
	
	response.addCookie(c);
	
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
%>