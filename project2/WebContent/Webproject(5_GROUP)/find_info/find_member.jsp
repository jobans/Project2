<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>find_member.jsp</title>
<style type="text/css">

	#wrapper, h2, table {
		border: 1px solid black;
		margin: 0;
	}
	
	table {
		margin-top: 10px;
		margin-bottom: 10px;
	}
	
	#wrapper {
		width: 90%;
		margin-left: auto;
		margin-right: auto;
	}
	
	table {
		margin-left: auto;
		margin-right: auto;	
	}
	
	h2{
		text-align: center;
	}
	
</style>
</head>
<body>
	<div id="wrapper">
		<h2>ID 및 PW 찾기</h2>
		<form action="findmemberOk.jsp" method="post">
			<table>
				<tr>
					<th>이름 </th>
					<td><input type="text" name="name" id="" /></td>
				</tr>
				<tr>
					<th>전화번호  </th>
					<td><input type="text" name="pno" id="" placeholder="-제외"/></td>
				</tr>
				<tr>
					<th>이메일 </th>
					<td><input type="text" name="email" id="" placeholder="cf) halfstone@naver.com"/></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<input type="submit" value="사용자 정보 찾기" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>