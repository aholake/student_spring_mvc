<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Student Management</title>
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

<!-- AngularJS -->
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
</head>

<!-- Pagination -->
<script type="text/javascript"
	src="/studentmng/resources/js/ui-bootstrap-tpls-1.1.1.min.js"></script>
<body ng-controller="myCtrl">
	<div class="header">
		<span>Xin chào Administrator</span>
	</div>
	<div class="container">
		<div class="row">
			<form class="form-horizontal col-md-8 col-md-offset-2">
				<div class="form-group">
					<div class="col-md-8">
						<input type="text" class="form-control" required>
					</div>
					<div class="col-md-4">
						<button type="submit" class="btn btn-primary long-btn">Tìm
							kiếm</button>
					</div>
				</div>
			</form>
		</div>
		<div class="row">
			<table class="table">
				<thead>
					<tr>
						<th>Mã sinh viên</th>
						<th>Họ tên</th>
						<th>Điểm trung bình</th>
						<th>Ngày sinh</th>
						<th>Địa chỉ</th>
					</tr>
				</thead>
				<tbody>
					<tr ng-repeat="student in students">
						<td>{{student.studentCode}}</td>
						<td>{{student.studentName}}</td>
						<td>{{student.studentInfo.averageScore}}</td>
						<td>{{student.studentInfo.dateOfBirth}}</td>
						<td>{{student.studentInfo.address}}</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<script type="text/javascript">
		var app = angular.module("myApp", []);
		var studentsURL = "/studentmng/student/getStudentList"
		app.controller("myCtrl", function($http, $scope) {
			$http.get(studentsURL).success(function(response) {
				console.log(response);
				$scope.students = response;
			});
		});
	</script>
</body>
</html>