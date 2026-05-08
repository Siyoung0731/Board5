<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write</title>
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
		background: white;
		border: 1px solid black;
	}
	input[type=text] {
		width: 100%;
	}
	input[type=submit], input[type=button] {
		width: 100px;
	}
	input[name=usreid] {
		width: 65%;
	}
	textarea {
		width: 100%;
		height: 300px;
	}
	#table1 {
		margin-bottom: 150px;
	}
</style>
</head>
<body>
	<main>
		<%@include file="/WEB-INF/include/menus.jsp" %>
		<h2>${menu_name} 게시글 작성</h2>
		<form action="/Board/Write" method="post">
		 <input type="hidden" name="menu_id" value="${ menu_id }">
		  <table id="table1">
		    <tr>
		      <td><span class="red">*</span>제목</td>
		      <td>
		      	<input type="text" name="title"  />
		      </td>
		    </tr>
   		    <tr>
		      <td><span class="red">*</span>작성자</td>
		      <td><input type="text" name="writer"/></td>
		    </tr>
		    <tr>
		      <td>내용</td>
		      <td><textarea name="content"></textarea></td>
		    </tr>
		    <tr>
		      <td colspan="2">
		      	<input type="submit" value="추가" />
		      	<input type="button" value="목록" 
		      	onclick="window.location.href='/Board/List?menu_id=${menu_id}'"/>
		      </td>
		    </tr>
		  </table>
		</form>
	</main>
	<!-- JavaScript 코딩 : client validation -->
	<script>
		
	</script>
</body>
</html>






















