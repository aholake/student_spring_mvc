<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Student Management</title>
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
<!-- Angular JS -->
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.3/angular.min.js"></script>

<!-- Custom Script -->
<script type="text/javascript" src="/studentmng/resources/js/main.js"></script>
</head>
<body class="grey darken-4">
	<div class="header">
		<span>Hello ${sessionScope.user.userName }</span>
	</div>
	<div class="container white-text" ng-controller="myCtrl">
		<div class="row">
			<form class="col m12">
				<div class="row">
					<div class="input-field col m8 offset-m2">
						<input type="text" class="validate"> <label>Tìm
							kiếm</label>
					</div>
				</div>
				<div class="row">
					<div class="col m8 offset-m2">
						<div class="row">
							<div class="col s3">
								<span>Tìm theo:</span>
							</div>
							<div class="col s3">
								<input name="searchType" type="radio" checked="checked"
									value="byName" /> <label for="test1">Tên</label>
							</div>
							<div class="col s3">
								<input name="searchType" type="radio" value="byCode" /> <label
									for="test1">Mã số sinh viên</label>
							</div>
							<div class="col s3">
								<input name="searchType" type="radio" value="byBirth" /> <label
									for="test1">Ngày sinh</label>
							</div>
						</div>
					</div>
				</div>
				<div class="row center">
					<button type="button" class="btn waves-effect waves-light">Tìm
						kiếm</button>
				</div>
			</form>
		</div>
		<div class="row">
			<table>
				<thead>
					<tr>
						<th>Mã</th>
						<th>Họ và tên</th>
						<th>Địa chỉ</th>
						<th>Điểm trung bình</th>
						<th>Năm sinh</th>
					</tr>
				</thead>
				<tbody>
					<tr ng-repeat="student in students">
						<td>{{student.studentCode}}</td>
						<td>{{student.studentName}}</td>
						<td>{{student.studentInfo.address}}</td>
						<td>{{student.studentInfo.averageScore}}</td>
						<td>{{student.studentInfo.dateOfBirth}}</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="row">
			<ul class="pagination">
				<c:forEach var="page" begin="1" end="${pageNum }">
					<li class="waves-effect"><a href="/studentmng/manage?page=${page }" onClick="return false;">${page }</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
	
	<script type="text/javascript">
		var app = angular.module("myApp", []);
		var url = "/studentmng/student/getStudentList?page=1";
		app.controller("myCtrl", function($http, $scope) {
			$http.get(url).success(function(response) {
				console.log(response);
				$scope.students = response;
			});
		});
	</script>
</body>
</html>