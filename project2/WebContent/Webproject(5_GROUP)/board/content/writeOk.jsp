<%@page import="vo.WebBoardVO"%>
<%@page import="dao.WebBoardDAO"%>
<%@page import="dao.BoardV2_DAO"%>
<%@page import="vo.BoardVO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  
	사용자에게 보여줄 페이지가 아니므로 굳이 HTML tag가 필요없음
	[writeOk.jsp]
-->
 
<%
	String userno =  request.getParameter("wr");
	String bname = request.getParameter("ti");
	String bcontent = request.getParameter("ct");
	
	//DBMS에 바로 접근하지 말고 확인하느 습관
	
	/* out.println("writer : " + writer);
	out.println("title : "+ title);
	out.println("cintents : "+ contents); */
	
	// DB 연결 후 write.jsp 에서 넘겨받은 값을 전달
	WebBoardDAO dao = new WebBoardDAO();
	WebBoardVO vo = new WebBoardVO();
	
	vo.setUserno(userno);
	vo.setBname(bname);
	vo.setBcontent(bcontent);
	
	// 사용자 IP를 얻어오기
	String ip =  request.getRemoteAddr();
	vo.setIp(ip);
	
	dao.addData(vo);
	
	dao.close();
	//DB에 저장이 완료되면 게시판 메인으로 이동
	response.sendRedirect("../freeboard.jsp");
	//response.sendRedirect("write.jsp");

%>