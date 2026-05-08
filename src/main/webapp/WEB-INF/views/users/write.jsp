<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write2</title>
<link href="/img/favicon.ico" rel="shortcut icon" type="image/x-icon">
<link href="/css/common.css" rel="stylesheet" /> 
<style>
	table {
		witdh : 100%
	}
	td {
		padding: 5px 10px;
		text-align: center;
		&:nth-of-type(1) {
			background-color: black;
			color:white;
			border:1px solid white;
		}
	}
	tr:last-child > td {
		background-color: white;
		border: 1px solid black;
	}
	input[type=text], input[type=number] {
		width: 100%;
	}
	input[type=submit], input[type=button] {
		width: 100px;
	}
	input[name=usreid] {
		width: 65%;
	}
</style>
</head>
<body>
	<main>
		<h2>사용자 등록 ${msg} </h2>
		<form action="/Users/Write" method="post">
		  <table>
		    <tr>
		      <td><span class="red">*</span>아이디</td>
		      <td>
		      	<input type="text" name="userid"  />
		      	<input type="button" id="dupCheck1" value="중복확인(새창)">
		      	<input type="button" id="dupCheck2" value="중복확인(Ajax)">
		      </td>
		    </tr>
		    <tr>
		      <td><span class="red">*</span>비밀번호</td>
		      <td><input type="password" name="pwd" id="pwd" /></td>
		    </tr>
   		    <tr>
		      <td><span class="red">*</span>비밀번호 확인</td>
		      <td><input type="password" id="pwd2" /></td>
		    </tr>
		    <tr>
		      <td><span class="red">*</span>이름</td>
		      <td><input type="text" name="username" /></td>
		    </tr>
		    <tr>
   		      <td>이메일</td>
		      <td><input type="text" name="email" /></td>
		    </tr>
		    <tr>
		      <td colspan="2">
		      	<input type="submit" value="추가" />
		      	<input type="button" value="목록" 
		      	onclick="window.location.href='/Users/List'"/>
		      </td>
		    </tr>
		  </table>
		</form>
	</main>
	<!-- JavaScript 코딩 : client validation -->
	<script>
		var idDupChecked = false;
		
		const formEl = document.querySelector('form');	
		const useridEl = document.querySelector('[name="userid"]');	
		const pwdEl = document.querySelector('#pwd');	
		const pwd2El = document.querySelector('#pwd2');	
		const usernameEl = document.querySelector('[name="username"]');	
		
			
		// 입력항목 체크
		formEl.addEventListener('submit', function(e){
			
			// 아이디값 체크
			if(useridEl.value.trim() == ''){
				alert('아이디를 입력하세요')
				useridEl.focus();
				e.preventDefault() // Event 취소
				e.stopPropagation() // Event 버블링 방지
				return;
			} 
			// 아이디 중복확인 여부 체크
			if(!idDupChecked) {
				alert('아이디 중복확인을 하세요')
				e.preventDefault()
				e.stopPropagation()
				return;
			}
			// 비밀번호 값 체크
			if(pwdEl.value.trim() == ''){
				alert('비밀번호를 입력하세요')
				pwdEl.focus();
				e.preventDefault() // Event 취소
				e.stopPropagation() // Event 버블링 방지
				return;
			}
			// 비밀번호 확인 값 체크
			if(pwd2El.value.trim() == ''){
				alert('비밀번호를 다시 입력하세요')
				pwd2El.focus();
				e.preventDefault() // Event 취소
				e.stopPropagation() // Event 버블링 방지
				return;
			}
			// 비밀번호와 비밀번호 확인 같은지 체크
			if(pwdEl.value != pwd2El.value){
				alert('비밀번호가 일치하지 않습니다')
				pwd2El.focus();
				e.preventDefault() // Event 취소
				e.stopPropagation() // Event 버블링 방지
				return;
			}
			// 이름 값 체크
			if(usernameEl.value.trim() == ''){
				alert('이름을 입력하세요')
				usernameEl.focus();
				e.preventDefault() // Event 취소
				e.stopPropagation() // Event 버블링 방지
				return;
			}
		});
	</script>
	<script>
		//아이디 중복확인1(새창 열기)
		const btnDup1El = document.querySelector('#dupCheck1')
		btnDup1El.addEventListener('click', function() {
			// 새창(브라우저) 열기
			//let url = '/Users/IdCheckWindow?first=true';
			let url = '/Users/IdCheckWindow';
			//let target = 'IdCheck'; //새 창 이름
			//let feature = 'left=800, top=200, width=400, height=200';
			window.open(url, target, feature)
		})	
	</script>
	
	
	<script>
		//아이디 중복확인2(Ajax)
		const btnDup2El = document.querySelector('#dupCheck2')
		
		btnDup2El.addEventListener('click', function() {
			if(useridEl.value.trim() == ''){
				alert('아이디를 입력하세요.')
				useridEl.focus()
				return;
			}
			
			
			let url = '/Users/IdDupCheck2?userid=' + useridEl.value;
			fetch(url)
			.then(response => response.json())
			.then(data =>  {
				console.log(data)
				if(data.userid != null)
					alert('사용 불가능')
					idDupChecked = false;
				else
					alert('사용 가능')
					idDupChecked = true;
			});	
		})
		
		//userid 의 value 가 바뀌면 idDupChecked = false;
		useridEl.addEventListener('change', function() {
			idDupChecked = false;	
		})
		
	</script>
</body>
</html>






















