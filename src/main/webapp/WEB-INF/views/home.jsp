<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>Login Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Custom Style -->
<link rel="stylesheet" href="/studentmng/resources/css/style.css">
<!--Import Google Icon Font-->
<link href="http://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!--Import materialize.css-->
<link type="text/css" rel="stylesheet"
	href="/studentmng/resources/css/materialize.min.css"
	media="screen,projection" />

<!--Let browser know website is optimized for mobile-->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--Import jQuery before materialize.js-->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script type="text/javascript"
	src="/studentmng/resources/js/materialize.min.js"></script>

<!-- Custom Script -->
<script type="text/javascript" src="/studentmng/resources/js/main.js"></script>
</head>
<body>
	<div class="header">
		<span>STUDENT MANAGER</span>
	</div>
	<div class="row">
		<div class="col m6 offset-m3">
			<div class="card grey darken-3">
				<form:form modelAttribute="userForm"
					action="/studentmng/user/checkLogin" method="post">
					<div class="card-content white-text">
						<span class="card-title">Đăng nhập</span>
						<div class="input-field">
							<form:input path="userName" type="text" cssClass="validate"
								required="required" />
							<label>Tên đăng nhập:</label>
						</div>
						<div class="input-field">
							<form:input path="password" type="password" cssClass="validate"
								required="required" />
							<label>Mật khẩu</label>
						</div>
						<div class="input-field">
							<input type="checkbox" id="remember" /> <label for="remember">Ghi nhớ đăng nhập</label>
						</div>
					</div>
					<div class="card-action">
						<div class="row">
							<div class="col m4">
								<button type="submit" class="btn waves-effect waves-light">Đăng nhập</button>
							</div>
							<div class="col m4">
								<button type="reset"
									class="btn waves-effect waves-light grey darken-1">Làm sạch</button>
							</div>
							<c:if test="${(not empty status)&&(status.error)}">
								<div class="col m4 offset-s1">
									<span class="red-text">${status.message }</span>
								</div>
							</c:if>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$("#remember").change(function() {
			if ($("#remember").is(":checked")) {
				setCookie("remember", "true", 10);
			} else {
				setCookie("remember", "", 0);
			}
		});
	</script>
</body>
</html>
