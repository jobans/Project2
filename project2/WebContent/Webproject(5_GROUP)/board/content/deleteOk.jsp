<%@page import="dao.WebBoardDAO"%>
<%@page import="javafx.scene.control.Alert"%>
<%@page import="javax.swing.JOptionPane"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  
	[deleteOk.jsp]
	:선택된 내용 삭제
 -->
  
 <%
 	String [] no = request.getParameterValues("bno");
	WebBoardDAO dao = new WebBoardDAO();	
 
    for(int i=0; i<no.length; i++){
	   //out.println("bno : "+bno);
	  
	   int bno = Integer.parseInt(no[i]);
	   dao.deleteData(bno);
    }
   	out.println("<script>alert('삭제되었습니다.');</script>");
   	response.sendRedirect("../freeboard.jsp");
 	
 %>