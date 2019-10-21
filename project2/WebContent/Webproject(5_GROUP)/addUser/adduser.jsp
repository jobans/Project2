<%@page import="vo.UsersVO"%>
<%@page import="dao.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 화면</title>
<style type="text/css">
	input{
		
	}
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
function openDaumPost(){
	new daum.Postcode({
    	oncomplete: function(data) {
        	// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
				
           	var roadAddr = data.roadAddress; // 도로명 주소 변수
               
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('post').value = data.zonecode; //우편번호
            document.getElementById("addr1").value = roadAddr; //도로명주소
               
		}
	}).open();
}

</script>
  <!-- css 파일 분리 -->
    <!-- <link href='../../css/join_style.css' rel='stylesheet' style='text/css'/> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="../../js/httpRequest.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		$("#id").focus();
		$("input[value='중복확인']").on('click', checkUp);

		// 입력 중에 중복여부를 체크
		//$("#id").on('keyup', checkUp);

	});

	// 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
	function checkValue() {
		if (!document.userInfo.id.value) {
			alert("아이디를 입력하세요.");
			document.userInfo.id.focus();
			return false;
		}

		if (!document.userInfo.password.value) {
			alert("비밀번호를 입력하세요.");
			document.userInfo.password.focus();
			return false;
		}

		// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
		if (document.userInfo.password.value != document.userInfo.passwordcheck.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			document.userInfo.passwordcheck.focus();
			return false;
		}
	}

	// 취소 버튼 클릭시 브라우저 닫기
	function exitaddForm() {
		self.close();
	}

	//ID 중복확인
	function checkUp() {
		var txt = $("#id").val().trim();
		console.log(txt);
		var params = "id=" + encodeURIComponent(txt);

		sendRequest('idCheck.jsp', params, callback, 'GET');
	}

	function callback() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var msg = xhr.responseText.trim();

			console.log(msg);

			//응답이 true 라면 span에 아이디가 존재합니다 출력
			//응답이 false 라면 span에 사용가능한 아이디입니다 출력

			if (msg == 'true')
				$("#msg").html(" 아이디가 존재합니다");
			else
				$("#msg").html(" 사용 가능한 아이디입니다");

		}
	}
</script>

</head>
<body>
    <!-- div 왼쪽, 오른쪽 바깥여백을 auto로 주면 중앙정렬된다.  -->
    <div id="wrap">
        <br><br>
        <b><font size="6" color="green">회원가입</font></b>
        <br><br><br>
        
        <!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
        <!-- 값(파라미터) 전송은 POST 방식, 전송할 페이지는 JoinPro.jsp -->
        <form method="post" action="addUserOk.jsp" name="userInfo" 
                onsubmit="return checkValue()">
            <table>
                <tr>
                    <td id="title">아이디</td>
                    <td>
                        <input type="text" name="id" id="id" maxlength="50">
                        <input type="button" value="중복확인"><span id="msg" style="color: red; font-weight: 600"></span>
                    </td>
                </tr>
                        
                <tr>
                    <td id="title">비밀번호</td>
                    <td>
                        <input type="password" name="password" maxlength="50">
                    </td>
                </tr>
                
                <tr>
                    <td id="title">비밀번호 확인</td>
                    <td>
                        <input type="password" name="passwordcheck" maxlength="50">
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">이름</td>
                    <td>
                        <input type="text" name="name" maxlength="50">
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">성별</td>
                    <td>
                        <input type="radio" name="gender" value="남" checked>남
                        <input type="radio" name="gender" value="여" checked>여
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">생일</td>
                    <td>
                        <input type="text" name="birthyy" maxlength="4" placeholder="년(4자)" size="6" >
                        <select name="birthmm">
                            <option value="">월</option>
                            <option value="01" >1</option>
                            <option value="02" >2</option>
                            <option value="03" >3</option>
                            <option value="04" >4</option>
                            <option value="05" >5</option>
                            <option value="06" >6</option>
                            <option value="07" >7</option>
                            <option value="08" >8</option>
                            <option value="09" >9</option>
                            <option value="10" >10</option>
                            <option value="11" >11</option>
                            <option value="12" >12</option>
                        </select>
                        <input type="text" name="birthdd" maxlength="2" placeholder="일" size="4" >
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">이메일</td>
                    <td>
                        <input type="text" name="mail1" maxlength="50">@
                        <select name="mail2">
                            <option>naver.com</option>
                            <option>daum.net</option>
                            <option>gmail.com</option>
                            <option>nate.com</option>                        
                        </select>
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">휴대전화</td>
                    <td>
                        <input type="text" name="phone" placeholder="- 제외"/>
                    </td>
                </tr>
                <tr>
                    <td id="title">주소</td>
                    <td>
                       <input type="text" name="postcode" id="post" placeholder="우편번호"/>
                      <input type="button" value="우편번호 찾기"  onclick="openDaumPost()"/>
                      <input type="text" name="address" id="addr1" size="50" placeholder="도로명 주소" />

                    </td>
                </tr>
            </table>
            <br>
            <input type="submit" value="가입"/>  
<!--             <input type="button" value="취소" onclick="goLoginForm()"> -->
            <input type="button" value="취소" onclick="exitaddForm()">
        </form>
    </div>
</body>
</html>

