
<%@page import="vo.WebBoardVO"%>
<%@page import="dao.WebBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{
		width: 900px;
		margin: 0 auto;
	}
	
	#ct {
		width: 800px;
		height: 600px;
	}
	
	table, tr, th, td{
		border: 1px solid black;
		border-collapse: collapse;
	}
	
	th {
		padding: 2px;
		background: -webkit-gradient(linear,78% 20%, 10% 20%, from(#66ffff), to(#ffff80));
	}
	#context{
		background-color: #e085c2;
	}
</style>
<%
	String no =  request.getParameter("bno");

	WebBoardDAO dao = new WebBoardDAO();
	WebBoardVO vo = new WebBoardVO();
	
	
	if(no != null){
		int bno =  Integer.parseInt(no);
		vo = dao.getData(bno);
	}else{
		response.sendRedirect("../freeboard.jsp");
	}
	

%>
<script type="text/javascript" src="../../../se3/js/HuskyEZCreator.js" charset="utf-8"></script>
<!-- <script type="text/javascript" src="../../../se3/photho_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script> -->
<script type="text/javascript">
	var oEditors = [];

	//스마트 에디터 적용 - 1
	window.onload = function() {
		// JSON
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "context",
			sSkinURI : "../../../se3/SmartEditor2Skin.html",
			fCreator : "createSEditor2",
				htParams : {
					bUseToolbar : true,
					bUseVerticalResizer : true,
					bUseModeChanger : true, 
				}
		});
	}//적용 1 end 

	//스마트 에디터 전송 - 2
	// ‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
	function submitContents(obj) {
		// 에디터의 내용이 textarea에 적용된다.
		oEditors.getById["context"].exec("UPDATE_CONTENTS_FIELD", []);

		// 에디터의 내용에 대한 값 검증은 이곳에서
		// document.getElementById("ir1").value를 이용해서 처리한다.

		try {
			obj.form.submit();
			} catch (e) {
		}
	}
	
	function pasteHTML(filepath){
	    var sHTML = '<img src="<%=request.getContextPath()%>/upload/'+filepath+'">';
	    oEditors.getById["context"].exec("PASTE_HTML", [sHTML]);

		}
	</script>
</head>
<body>
<form action="modifyOk.jsp">
	<input type="hidden" name="bno" value="<%=vo.getBno() %>"/>
	<table>
		<tr id="top">
			<th id="t1">작성자</th>
			<td><%= vo.getUserno() %></td>
			<th id="t2">조회수</th>
			<td><%= vo.getHits() %></td>
			<th id="t3">작성일시</th>
			<td><%= vo.getRegdate() %></td>
		</tr>
		<tr id="title">
			<th>제목</th>
			<td colspan="5">
				<input type="text" name="title" id=""  value="<%= vo.getBname() %>"/>
			</td>
		</tr>
		<tr id="contents">
			<th>내용</th>
			<td colspan="5">
				<textarea  name="context" id="context" cols="100" rows="10"><%= vo.getBcontent() %>
				</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="6">
				<a href="../freeboard.jsp"><input type="button" value="목록" /></a>
				<input type="button" value="수정완료" onclick="submitContents(this)"/>
			</td>
		</tr>
	</table>
</form>
</body>
</html>