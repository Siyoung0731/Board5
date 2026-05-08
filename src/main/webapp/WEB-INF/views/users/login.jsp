<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>board</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<link href="/css/common.css" rel="stylesheet" /> 
</head>
<body>
<form action="/Users/Login" method="post">
  <h2>로그인</h2>
  <div class="mb-3">
    <label for="userid" class="form-label">아이디</label>
    <input type="text" class="form-control" name="userid" id="userid">
  </div>
  <div class="mb-3">
    <label for="pwd">암호</label>
    <input type="password" class="form-control" name="pwd" id="pwd">
  </div>
  <button type="submit" class="btn btn-primary">로그인</button>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</form>
</body>
</html>