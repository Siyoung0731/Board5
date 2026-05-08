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
		background-color: white;
		border: 1px solid black;
	}
	input[type=text], input[type=number] {
		width: 100%;
	}
	input[type=submit], input[type=button] {
		width: 100px;
	}
</style>
</head>
<body>
	<main>
		<h2>메뉴 등록</h2>
		<form action="/Menus/Write" method="get">
		  <table>
		    <tr>
		      <td>메뉴 아이디</td>
		      <td><input type="text" name="menu_id"  /></td>
		    </tr>
		    <tr>
		      <td>메뉴 이름</td>
		      <td><input type="text" name="menu_name" /></td>
		    </tr>
		    <tr>
   		      <td>메뉴 순서</td>
		      <td><input type="text" name="menu_seq" /></td>
		    </tr>
		    <tr>
		      <td colspan="2">
		      	<input type="submit" value="추가" />
		      	<input type="button" value="목록" 
		      	onclick="window.location.href='/Menus/List'"/>
		      </td>
		    </tr>
		  </table>
		</form>
	</main>
</body>
</html>