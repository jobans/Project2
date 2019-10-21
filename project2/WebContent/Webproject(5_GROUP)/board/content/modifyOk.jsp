<%@page import="dao.WebBoardDAO"%>
<%@page import="vo.WebBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  
	[modifyOk.jsp]
	:수정된 내용을 DBMS에 저장
 -->
  
 
 <%
 	String b = request.getParameter("bno");
 	String title = request.getParameter("title");
 	String contents = request.getParameter("context");
 	
 	/* out.println("bno : "+b);
 	out.println("title : "+title);
 	out.println("contents : "+contents);
  */
 	if(b != null){
 		int bno = Integer.parseInt(b);
 		WebBoardDAO dao = new WebBoardDAO();
 		WebBoardVO vo = new WebBoardVO();
 		
 		vo.setBno(bno);
 		vo.setBname(title);
 		vo.setBcontent(contents);
 		
 		dao.modifyData(vo);
 		
 		response.sendRedirect("../freeboard.jsp");
 	}else{
 		response.sendRedirect("../freeboard.jsp");
 	}
 %>