<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link href="/img/favicon.ico" rel="shortcut icon" type="image/x-icon">
<link href="/css/common.css" rel="stylesheet" /> 
<style>
</style>
</head>
<body>
  <main>
    <h2>Home</h2>
    <div><a href="/Users/List">사용자 목록</a></div>  
    <div><a href="/Users/WriteForm">사용자 등록</a></div>
    <div>&nbsp;</div>
    <div><a href="/Users/IdDupCheck2?userid=aaa" target="_blank">아이디 중복 테스트</a></div>
    <div>&nbsp;</div>
    <div><a href="/Board/List?menu_id=MENU01">게시글 목록</a></div>
    <div><a href="/Board/WriteForm?menu_id=MENU01">게시글 추가</a></div>
    <div>&nbsp;</div>
    
    <div>
      [ ${sessionScope.login.username} ] 님 환영합니다.<br>
      당신의 가입일은 [ ${sessionScope.login.regdate} ] 입니다.<br>   
      <a href="/Users/LoginForm">로그인</a><br>	
      <a href="/Users/Logout">로그아웃</a>	
    </div>   
  </main>
</body>
</html>