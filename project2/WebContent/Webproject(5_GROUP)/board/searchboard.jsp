<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="vo.WebBoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.WebBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 게시판</title>
<link rel="stylesheet" type="text/css" href="../css/style_board_standard.css?ver2" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	function search(){
		if(document.getElementById("search_text").value ==""){
			alert("검색하려는 사용자의 이름을 입력해주세요");
			return false;
		}else{
			document.search_form.submit();
		}
	}
</script>
<%
	WebBoardDAO dao = new WebBoardDAO();
	request.setCharacterEncoding("UTF-8");
	
	String userno = request.getParameter("find_title");

%>

</head>
<body>
	<div id="board_body">
		<div id="half_gnb">
			<a href="../Main.jsp">HALFSTONE</a>
		</div>
		
		<a href="freeboard.jsp">
			<div id="img_wrapper">
				<img src="../image/free.jpg" alt="" />
			</div>
		</a>
		
		<div id="search_title">
			<form name="search_form" action="searchboard.jsp" method=post>
				<input type="text" name="find_title" id="search_text" placeholder=" 작성자 이름 검색만 가능" />
				<input type="button" value="검색" onclick="search()"/>
			</form>
		</div>
		<div id="content_area">
			<ul id="board_line">
				<li>
					<ul id="first_line" class="b-line">
						<li class="b-no">번호</li>
						<li class="b-name">제목</li>
						<li class="userno">글쓴이</li>
						<li class="b-date">날짜</li>
						<li class="b-hits">조회</li>
					</ul>
				</li>
			<%
				ArrayList<WebBoardVO> list = dao.searchData(userno);
				for(WebBoardVO vo : list){
					
					SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					SimpleDateFormat md_format = new SimpleDateFormat("MM.dd");
					SimpleDateFormat time_format = new SimpleDateFormat("HH:mm");
					
					Date dregdate = dt.parse(vo.getRegdate());
					String regdate = md_format.format(dregdate);
					String today = md_format.format(new Date());
					String regtime = time_format.format(dregdate);
					
					// 오늘 날짜와 등록날짜 비교후 등록날짜>=오늘날짜이면 시간을 표시
					// 반대의 경우 월과 일수만 표시
			%>
				<li class="content_row">
					<ul class="rb-line">
						<li class="b-no"><%=vo.getBno() %></li>
						<li class="b-name"><a href="./content/detail.jsp?bno=<%=vo.getBno() %>"><%=vo.getBname() %></a></li>
						<li class="userno"><%=vo.getUserno() %></li>
						<%
							if(regdate.compareTo(today)>=0){
						%>
							<li class="b-date" id="time">
								<%=regtime %>
							</li>
						<%
							}else{
						%>
							<li class="b-date">
								<%=regdate %>
							</li>						
						<%
							}
						%>
						<li class="b-hits"><%=vo.getHits() %></li>
					</ul>
				</li>
			<%
				}
			%>
			</ul>
		</div> <!-- content_area -->
		<iframe id="if" src="//uchat.ch/soccer" frameborder=0></iframe>
	</div> <!-- REAL BODY SECTION -->
</body>
</html>