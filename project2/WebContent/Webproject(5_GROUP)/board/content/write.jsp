<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write.jsp</title>
<style type="text/css">
#container {
	margin: 0 auto;
	width: 1000px;
	border: 3px solid black;
}

#ct {
		width: 900px;
		height: 700px;
	}

#top {
	text-align: center;
	color: #ff5e00;
	border-bottom: 1px solid black;
}

#contents {
	margin-left: 10px;
}

#button {
	margin-left: 10px;
}

#writer, #title {
	margin-left: 8px;
}
</style>
<script type="text/javascript" src="../../../se3/js/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">
	var oEditors = [];

	//스마트 에디터 적용 - 1
	window.onload = function() {
		// JSON
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "ct",
			sSkinURI : "../../../se3/SmartEditor2Skin.html",
			fCreator : "createSEditor2"
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

	// textArea에 이미지 첨부
	function pasteHTML(filepath){
    var sHTML = '<img src="<%=request.getContextPath()%>/upload/'+filepath+'">';
    oEditors.getById["ct"].exec("PASTE_HTML", [sHTML]);

	}
</script>
</head>
<body>
	<form action="writeOk.jsp">
		<div id="container">
			<div id="top">
				<p>
				<h3>하고싶은 얘기가 있나요?</h3>
				</p>
			</div>
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
			%>
			<div id="writer">
				<p>
					WRITER : <%=id %>
					<input type="hidden" name="wr" id="wr" value="<%=id %>" />
				</p>
			</div>
			<div id="title">
				<p>
					TITLE : <input type="text" name="ti" id="ti" />
				</p>
			</div>
			<div id="contents">

				<textarea name="ct" id="ct" cols="35" rows="10"></textarea>

			</div>
			<div id="button">
				<a href="../freeboard.jsp"><input type="button" value="목록보기" /></a> <input
					type="button" value="작성하기" onclick="submitContents(this)" /> <input
					type="reset" value="다시쓰기" />
			</div>
		</div>
	</form>
</body>
</html>