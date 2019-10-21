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
	
	table, tr, th, td{
		border: 1px solid black;
		border-collapse: collapse;
	}
	
	th {
		padding: 2px;
		background: -webkit-gradient(linear,78% 20%, 10% 20%, from(#66ffff), to(#ffff80));
	}
	#ct{
		background-color: #e085c2;
	}
	
	#reply_content{
          width:100%;
    }
         
    .reply_reply {
            border: 2px solid #FF50CF;
    }
    .reply_modify {
            border: 2px solid #FFBB00;
    }
    
    #context{
		width: auto;
		height: auto;
    }
</style>
<script type="text/javascript" src="../../../se3/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="../../../se3/photho_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
<script src="../../js/script_comment.js"></script>
<%
	String no =  request.getParameter("bno");

	WebBoardDAO dao = new WebBoardDAO();
	WebBoardVO vo = new WebBoardVO();
	
	
	if(no != null){
		int bno =  Integer.parseInt(no);
		//조회수 증가
		dao.raiseHits(bno);
		vo = dao.getData(bno);
	}else{
 		response.sendRedirect("../freeboard.jsp");
	}

%>
<script type="text/javascript">
	var oEditors = [];

	$(document).ready(function(){
		$("#boardcomment").load("BoardComment3.jsp?=bno<%=vo.getBno()%>");
	});
	
	//스마트 에디터 적용 - 1
	window.onload = function() {
		// JSON
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "ct",
			sSkinURI : "../../../se3/SmartEditor2Skin.html",
			fCreator : "createSEditor2",
				htParams : {
					bUseToolbar : false,
					bUseVerticalResizer : false,
					bUseModeChanger : false, 
				}
		});
	}//적용 1 end 

	//스마트 에디터 전송 - 2
	// ‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
	function submitContents(obj) {
		// 에디터의 내용이 textarea에 적용된다.
		oEditors.getById["ct"].exec("UPDATE_CONTENTS_FIELD", []);

		// 에디터의 내용에 대한 값 검증은 이곳에서
		// document.getElementById("ir1").value를 이용해서 처리한다.

		try {
			obj.form.submit();
		} catch (e) {
		}
	
	}
	</script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#btn").on('click',function(){
			var flag = confirm("정말 삭제하시겠습니까?");
			
			if(flag){
				//창이동
				location.href = "deleteOk.jsp?bno=<%=vo.getBno()%>";
			}
		});
	});
</script>


</head>
<body>
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
			<td colspan="5"><%= vo.getBname() %></td>
		</tr>
		<tr id="contents">
			<th>내용</th>
			<td colspan="5">
				<div id="context">
					<%=vo.getBcontent() %>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="6">
				<a href="../freeboard.jsp"><input type="button" value="목록" /></a>
				<a href="modify.jsp?bno=<%=vo.getBno()%>"><input type="button" value="수정" /></a>
				<input type="button" value="삭제" id="btn"/>
			</td>
		</tr>
	</table>
	<div id="boardcomment">
	
	</div>
</body>
</html>