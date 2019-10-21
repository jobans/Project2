<%@page import="dao.UsersDAO"%>
<%@page import="vo.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 한글 깨짐을 방지하기 위한 인코딩 처리
	request.setCharacterEncoding("UTF-8");

	//회원 정보 넘겨받기
	String id = request.getParameter("id");
	String pw = request.getParameter("password");
	String name = request.getParameter("name");
	String sex = request.getParameter("gender");
	String pno = request.getParameter("phone");
	String address = request.getParameter("address");
	String post = request.getParameter("postcode");
	
	//email 합치기
	String e1 = request.getParameter("mail1");
	String e2 = request.getParameter("mail2");
	String email = e1+"@"+e2;
	
	//생년월일 합치기
	String dob1 = request.getParameter("birthyy");
	String dob2 = request.getParameter("birthmm");
	String dob3 = request.getParameter("birthdd");
	String dob = dob1+dob2+dob3;
	
	//테스트 - 완료
	/* out.println(id);
	out.println(pw);
	out.println(name);
	out.println(sex);
	out.println(dob);
	out.println(email);
	out.println(pno);
	out.println(address);
	out.println(post); */
	
	//DB연결
	UsersVO vo = new UsersVO();
	UsersDAO dao = new UsersDAO();
	
	vo.setId(id);
	vo.setPw(pw);
	vo.setName(name);
	vo.setSex(sex);
	vo.setPno(pno);
	vo.setAddress(address);
	vo.setPost(post);
	vo.setDob(dob);
	vo.setEmail(email);

	dao.addUser(vo);
	
	dao.close();
	response.sendRedirect("adduser.jsp");
%>