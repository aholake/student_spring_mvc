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

<!-- Font Awesome -->
<link rel="stylesheet"
	href="/studentmng/resources/css/font-awesome.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<!-- AngularJS -->
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>

<!-- Bootstrap UI -->
<script type="text/javascript"
	src="/studentmng/resources/js/ui-bootstrap-tpls-1.1.1.min.js"></script>

<!-- Floating Action Button -->
<link rel="stylesheet" href="/studentmng/resources/css/kc.fab.css">

<script type="text/javascript"
	src="/studentmng/resources/js/kc.fab.min.js"></script>

<!-- Custom Style -->
<link rel="stylesheet" href="/studentmng/resources/css/style.css">

<!-- Custom Script -->
<script type="text/javascript" src="/studentmng/resources/js/main.js"></script>
</head>
<body ng-controller="myCtrl">
	<div class="header">
		<span>Xin chào Administrator</span>
	</div>
	<div class="kc_fab_wrapper" data-toggle="modal" data-target="#modalAdd"></div>
	<div class="container">
		<div class="row">
			<form class="form-horizontal col-md-8 col-md-offset-2">
				<input type="text" class="form-control" ng-model="searchKey"
					ng-change="filterStudent()"
					placeholder="Nhập tên, địa chỉ, ngày sinh...">
			</form>
		</div>
		<hr>
		<div class="row">
			<table class="table">
				<thead>
					<tr>
						<th>Mã sinh viên</th>
						<th>Họ tên</th>
						<th>Điểm trung bình</th>
						<th>Ngày sinh</th>
						<th>Địa chỉ</th>
						<th>Chức năng</th>
					</tr>
				</thead>
				<tbody>
					<tr ng-repeat="student in studentCollection">
						<td>{{student.studentCode}}</td>
						<td>{{student.studentName}}</td>
						<td>{{student.studentInfo.averageScore}}</td>
						<td>{{student.studentInfo.dateOfBirth}}</td>
						<td>{{student.studentInfo.address}}</td>
						<td><a href="#"><i class="fa fa-trash margin-right-10"></i></a><a
							href="#" data-toggle="modal" data-target="#modalEdit"
							ng-click="edit(student.id)"><i class="fa fa-pencil"></i></a></td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="5" class="text-center"><uib-pagination
								total-items="totalItems" ng-model="currentPage"
								items-per-page="itemsPerPage" max-size="maxSize"
								class="pagination" boundary-links="true" rotate="false"></uib-pagination>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>

	<!-- Modal Modify-->
	<div class="modal fade" id="modalEdit" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Chỉnh sửa thông tin</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>Mã sinh viên:</label> <input type="text"
							class="form-control" value="{{editStudent.studentCode}}" ng-model="editStudent.studentCode">
					</div>
					<div class="form-group">
						<label>Tên sinh viên:</label> <input type="text"
							class="form-control" value="{{editStudent.studentName}}" ng-model="editStudent.studentName">
					</div>
					<div class="form-group">
						<label>Điểm trung bình:</label> <input type="text"
							class="form-control"
							value="{{editStudent.studentInfo.averageScore}}" ng-model="editStudent.studentInfo.averageScore">
					</div>
					<div class="form-group">
						<label>Ngày sinh:</label> <input type="text" class="form-control"
							value="{{editStudent.studentInfo.dateOfBirth}}" ng-model="editStudent.studentInfo.dateOfBirth">
					</div>
					<div class="form-group">
						<label>Địa chỉ:</label> <input type="text" class="form-control"
							value="{{editStudent.studentInfo.address}}" ng-model="editStudent.studentInfo.address">
					</div>
				</div>
				<div class="modal-footer">
					<button class="btn btn-primary" ng-click="update()">Cập
						nhật</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal Add-->
	<div class="modal fade" id="modalAdd" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Thêm sinh viên</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>Mã sinh viên:</label> <input type="text"
							class="form-control">
					</div>
					<div class="form-group">
						<label>Tên sinh viên:</label> <input type="text"
							class="form-control">
					</div>
					<div class="form-group">
						<label>Điểm trung bình:</label> <input type="text"
							class="form-control">
					</div>
					<div class="form-group">
						<label>Ngày sinh:</label> <input type="text" class="form-control">
					</div>
					<div class="form-group">
						<label>Địa chỉ:</label> <input type="text" class="form-control">
					</div>
				</div>
				<div class="modal-footer">
					<button class="btn btn-primary">Lưu</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var app = angular.module("myApp", [ "ui.bootstrap" ]);
		var studentsURL = "/studentmng/student/getList"

		app
				.controller(
						"myCtrl",
						function($http, $scope, $filter) {
							$http
									.get(studentsURL)
									.success(
											function(response) {
												console.log(response);
												$scope.students = response;

												$scope.totalItems = response.length;
												$scope.maxSize = 5;
												$scope.currentPage = 1;
												$scope.itemsPerPage = 5;

												$scope
														.$watch(
																"currentPage + itemsPerPage",
																function() {
																	var begin = (($scope.currentPage - 1) * $scope.itemsPerPage);
																	var end = begin
																			+ $scope.itemsPerPage;
																	$scope.studentCollection = $scope.students
																			.slice(
																					begin,
																					end);
																});

												$scope.filterStudent = function() {
													var temp = [];
													temp = $filter('filter')(
															$scope.students,
															$scope.searchKey);
													$scope.totalItems = temp.length;
													$scope
															.$watch(
																	"currentPage + itemsPerPate",
																	function() {
																		var begin = (($scope.currentPage - 1) * $scope.itemsPerPage);
																		var end = begin
																				+ $scope.itemsPerPage;
																		$scope.studentCollection = temp
																				.slice(
																						begin,
																						end);
																	});
												};
											});
							$scope.edit = function(studentId) {
								$scope.editStudent = $filter("filter")(
										$scope.students, {
											id : studentId
										})[0];
								console.log($scope.editStudent);
							}
							$scope.update = function() {
								var data = {
									"id" : $scope.editStudent.id,
									"studentName" : $scope.editStudent.studentName,
									"studentCode" : $scope.editStudent.studentCode,
									"studentInfo" : {
										"id" : $scope.editStudent.studentInfo.id,
										"address" : $scope.editStudent.studentInfo.address,
										"averageScore" : $scope.editStudent.studentInfo.averageScore,
										"dateOfBirth" : $scope.editStudent.studentInfo.dateOfBirth
									}
								}
								data = JSON.stringify(data);
								console.log(data);

								var config = {
									header : {
										"Content-Type" : "application/json; charset=utf-8;"
									}
								}

								$http.post("/studentmng/student/saveOrUpdate",
										data, config)
										.success(
												function(data, status, headers,
														config) {
													console.log(data);
												}).error(
												function(data, status, header,
														config) {
													console.log(data);
												});
							}
						});

		$(function() {
			var links = [ {
				"bgcolor" : "red",
				"icon" : "+"
			} ]
			$('.kc_fab_wrapper').kc_fab(links);
		});
	</script>
</body>
</html>