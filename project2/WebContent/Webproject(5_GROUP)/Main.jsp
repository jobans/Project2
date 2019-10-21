<%@page import="java.util.ArrayList"%>
<%@page import="vo.WebBoardVO"%>
<%@page import="dao.WebBoardDAO"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WebProject by 5-Group</title>

<link rel="stylesheet" type="text/css" href="css/style_main.css?ver2" />
<link rel="stylesheet" type="text/css" href="css/style_content.css?ver1" />
<link rel="stylesheet" type="text/css" href="css/style_navi.css?ver3" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="../js/httpRequest.js"></script>
<script src="js/script_navi.js"></script>
<script src="js/script_login.js?ver2"></script>
</head>

<body>
	<!-- 전체를 감싸는 태그 -->
	<div id="page-wrapper">
		
		<!-- Header -->
		<header id="main-header">
			<div id="sup"><a href="Main.jsp"><sup>HALFSTONE</sup></a></div>
			<div id="sub"><sub>By 5-Group</sub></div>
		</header>
		
		<!-- Navigation -->
		<nav id="main-navigation">
			<ul id="navi">
				<li class="navi_main"><a href="Main.jsp">HOMEPAGE</a></li>
				<li class="navi_main"><a href="#">게시판</a>
					<ul>
						<li><a href="board/freeboard.jsp">자유 게시판</a></li>
						
						<li><a href="https://www.fmkorea.com/lol">게임 게시판</a></li>
						<li><a href="https://manamoa8.net/bbs/board.php?bo_table=manga">만화 게시판</a></li>												
					</ul>
				</li>
				<li class="navi_main"><a href="#">서비스센터</a>
					<ul>
						<li><a href="#">공지사항</a></li>
						<li><a href="#">1:1문의</a></li>
						<li><a href="#">약관 및 정책</a></li>
					</ul>
				</li>
				<li class="navi_main"><a href="#">출석체크</a></li>
			</ul>
		</nav>
		
		<!-- main content -->
		<div id="content">
			
			<!-- Content -->
			<section id="main-section">
				<ul class="main-section-article">
				
				</ul>
			</section>
			
			
			<!-- Login -->
			<aside id="main-aside">
			<%
				Cookie[] clist = request.getCookies();
				String id = null;
				
				if(clist!=null){
					for(Cookie c : clist){
						if(c.getName().equals("idCookie")){
							id = URLDecoder.decode(c.getValue(), "UTF-8");
						}
					}
					
				}
				
				if(id==null){
			%>
				<form name="login_form">
					<div id="login">
						<table>
							<tr>
								<th>ID:</th>
								<td><input type="text" name="id" id="id" placeholder="ID"/></td>
							</tr>
							<tr>
								<th>PW:</th>
								<td><input type="password" name="pw" id="pw" placeholder="PW"/></td>
							</tr>
						</table>
						<input type="button" value="회원가입" onclick="adduser()"/>
						<input type="button" value="정보찾기" onclick="finduser()" />
						<input type="button" value="로그인" onclick="login()" />
					</div>
				</form>
			<%
				}else{
			%>
				<div id="login">
					<h4><%=id %> 님 환영합니다</h4>
					<input type="button" value="로그아웃" onclick="logout()"/>
				</div>
			<%			
				}
			%>
				<p class="aside-title">공지사항</p>
				<hr>
				<div class="Notice">
					<ul id="Realnotice">
						<li><a href="#">[공지]사람을 미치게 하는 첫번째 방법은</a></li>
						<li><a href="#">[공지]말을 하다가 끊는것이고</a></li>
						<li><a href="#">[공지]두번째는</a></li>
					</ul>
				</div>
				
				<p class="aside-title">월간 조회수 순위</p>
				<hr>
				<div class="Notice">
					<ul id="Dailymonth">
					<%
						WebBoardDAO dao = new WebBoardDAO();
						ArrayList<WebBoardVO> list= new ArrayList<>();
						
						list=dao.getHitData();
						
					%>
						<li><a href="./board/content/detail.jsp?bno=<%=list.get(0).getBno() %>"><%=list.get(0).getBname() %></a></li>
						<li><a href="./board/content/detail.jsp?bno=<%=list.get(1).getBno() %>"><%=list.get(1).getBname() %></a></li>
						<li><a href="./board/content/detail.jsp?bno=<%=list.get(2).getBno() %>"><%=list.get(2).getBname() %></a></li>
					</ul>
				</div>
				
				<p class="aside-title">주간 조회수 순위</p>
				<hr>
				<div class="Notice">
					<ul id="Dailyweek">
						<li><a href="./board/content/detail.jsp?bno=<%=list.get(0).getBno() %>"><%=list.get(0).getBname() %></a></li>
						<li><a href="./board/content/detail.jsp?bno=<%=list.get(1).getBno() %>"><%=list.get(1).getBname() %></a></li>
						<li><a href="./board/content/detail.jsp?bno=<%=list.get(2).getBno() %>"><%=list.get(2).getBname() %></a></li>
					</ul>
				</div>
			</aside>
		</div>
		
		<!-- Footer -->
		<footer id="main-footer">
			Telegram : @kimnotboggu    Facebook : ksj754    Twitter: @shipbigjun
			<p>JoHalfStone.net <a href="Site_Usage_Guidance.html">[이용약관]</a></p>
			<a href="#">제작진</a>
		</footer>
		
	</div>
</body>
</html>