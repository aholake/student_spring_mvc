<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>Login Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<!-- Custom Style -->
<link rel="stylesheet" href="/studentmng/resources/css/style.css">
<!-- Custom Script -->
<script type="text/javascript" src="/studentmng/resources/js/main.js"></script>
</head>
<body>
	<div class="header">
		<span>STUDENT MANAGER</span>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<form:form action="/studentmng/user/checkLogin" method="post"
					modelAttribute="userForm">
					<div class="panel panel-primary">
						<div class="panel-heading">ĐĂNG NHẬP</div>
						<div class="panel-body">
							<div class="form-group">
								<label>Tên đăng nhập:</label>
								<form:input cssClass="form-control" path="userName" type="text"
									required="required" />
							</div>
							<div class="form-group">
								<label>Mật khẩu</label>
								<form:input path="password" type="password"
									cssClass="form-control" required="required" />
							</div>
							<div class="form-group">
								<div class="checkbox">
									<label><input type="checkbox" value="">Ghi nhớ
										đăng nhập</label>
								</div>
							</div>
							<c:if test="${!empty status && status.error }">
								<div class="form-group">
									<div class="text-danger">${status.message }</div>
								</div>
							</c:if>
						</div>
						<div class="panel-footer">
							<div class="form-group-btn">
								<button type="submit" class="btn long-btn btn-primary">Đăng
									nhập</button>
							</div>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>
