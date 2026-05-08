<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>메뉴 삭제</h2>
	<form action="/Menus/Delete">
		<table>
			<tr>
				<td>삭제할 메뉴 아이디</td>
				<td><input type="text" name="menu_id"></td>
			</tr>
		    <tr>
		      <td colspan="2">
		      	<input type="submit" value="삭제" />
		      	<input type="button" value="목록" />
		      </td>
		    </tr>
		</table>	
	</form>
</body>
</html>