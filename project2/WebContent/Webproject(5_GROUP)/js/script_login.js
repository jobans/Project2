/**
 * 
 */

function adduser(){
	window.open('addUser/adduser.jsp','window_name','width=800,height=500,location=no,status=no,scrollbars=yes');
}

function finduser(){
	window.open('find_info/find_member.jsp','window_name','width=430,height=250,location=no,status=no,scrollbars=yes');
}

function login(){
	var id = document.getElementById("id").value;
	var pw = document.getElementById("pw").value;
	
	var params = "id="+encodeURIComponent(id)+"&pw="+encodeURIComponent(pw);

	sendRequest('login_complete.jsp', params, callback, 'GET');
	
}

function logout(){
	$('#control').show();
	sendRequest('logout.jsp', 0, callback, 'GET');
	
}

function callback(){
	if(xhr.readyState==4){
		if(xhr.status==200){
			//console.log(xhr);
			//alert(xhr.responseText);
			
			var login = document.getElementById("login");
			login.innerHTML = xhr.responseText;
			
		}
	}
}
