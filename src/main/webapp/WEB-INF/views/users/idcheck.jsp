<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.red {color: red;}
	.green {color: green;}
</style>
</head>
<body>
	<h2>아이디 중복확인</h2>
	<form action="/Users/IdCheck" method="get">
		<input type="text" name="userid" value="${ param.userid }"/>
		<input type="submit" value="중복확인" /><br/>
		<div id="msg">${ msg }</div> 
		<input type="button" value="사용하기" id="btnClose" />
	</form>
	<script>
		//새 창(페이지)이 열릴 때	
 		document.addEventListener("DOMContentLoaded", function() {
 			// 페이지를 처음 호출했는가 체크
 			// ?first=true 활용방법
 			if( '${first}' == 'true') {
	 			const thisUidEl = window.document.querySelector('[name=userid]')
				//write2.jsp의 userEl
				const parentUidEl = window.opener.document.querySelector('[name="userid"]')
				thisUidEl.value = parentUidEl.value;  				
 			}
		}) 
		
		//사용하기 버튼 클릭
		const btnCloseEl = document.querySelector('#btnClose')	
		btnCloseEl.addEventListener('click', function() {
			
			const thisUidEl = window.document.querySelector('[name=userid]')
			// write2.jsp의 userEl
			const parentUidEl = window.opener.document.querySelector('[name="userid"]')
			parentUidEl.value = thisUidEl.value;
			window.close();
		})
	</script>
</body>
</html>