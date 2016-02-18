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

<!-- Bootstrap Datepicker -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.0/css/bootstrap-datepicker.min.css">

<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.0/js/bootstrap-datepicker.min.js"></script>

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
						<td>{{student.studentCode == null ? "Chưa cập nhật" :
							student.studentCode}}</td>
						<td>{{student.studentName == null ? "Chưa cập nhật" :
							student.studentName}}</td>
						<td>{{student.studentInfo.averageScore == null ? "Chưa cập
							nhật" : student.studentInfo.averageScore}}</td>
						<td>{{student.studentInfo.dateOfBirth == null ? "Chưa cập
							nhật" : student.studentInfo.dateOfBirth}}</td>
						<td>{{student.studentInfo.address == null ? "Chưa cập nhật" :
							student.studentInfo.address}}</td>
						<td><a href="#" ng-click="del(student.id)"><i
								class="fa fa-trash margin-right-10"></i></a><a href="#"
							data-toggle="modal" data-target="#modalEdit"
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
				<form id="modifyForm" ng-submit="update()">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Chỉnh sửa thông tin</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>Mã sinh viên:</label> <input type="text" minlength="8"
								maxlength="8" pattern="^[0-9]{8}$" class="form-control"
								value="{{editStudent.studentCode}}"
								ng-model="editStudent.studentCode" required>
						</div>
						<div class="form-group">
							<label>Tên sinh viên:</label> <input type="text"
								pattern="([^0-9`!@#$%^&*()=+|{}[\]\'\x22:;?/>.<,])+"
								minlength="5" maxlength="50" required class="form-control"
								value="{{editStudent.studentName}}"
								ng-model="editStudent.studentName">
						</div>
						<div class="form-group">
							<label>Điểm trung bình:</label> <input type="number" step="0.1"
								class="form-control"
								value="{{editStudent.studentInfo.averageScore}}"
								ng-model="editStudent.studentInfo.averageScore" min="0" max="10"
								required>
						</div>
						<div class="form-group">
							<label>Ngày sinh:</label>
							<div class="input-group date" data-provide="datepicker"
								data-date-format="yyyy-mm-dd">
								<input type="text" class="form-control"
									value="{{editStudent.studentInfo.dateOfBirth}}"
									ng-model="editStudent.studentInfo.dateOfBirth" required>
								<div class="input-group-addon">
									<span class="glyphicon glyphicon-th"></span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label>Địa chỉ:</label> <input type="text"
								pattern="([^0-9`!@#$%^&*()=+|{}[\]\'\x22:;?/>.<,])+"
								class="form-control" value="{{editStudent.studentInfo.address}}"
								ng-model="editStudent.studentInfo.address" minlength="5"
								maxlength="20" required>
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">Cập nhật</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Modal Add-->
	<div class="modal fade" id="modalAdd" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<form id="addingForm" ng-submit="add()">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Thêm sinh viên</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>Mã sinh viên:</label> <input type="text" minlength="8"
								placeholder="12345678" maxlength="8" pattern="^[0-9]{8}$"
								class="form-control" ng-model="newStudent.studentCode" required>
						</div>
						<div class="form-group">
							<label>Tên sinh viên:</label> <input type="text"
								placeholder="Nguyễn Văn A"
								pattern="([^0-9`!@#$%^&*()=+|{}[\]\'\x22:;?/>.<,])+"
								class="form-control" ng-model="newStudent.studentName"
								minlength="5" maxlength="50" required>
						</div>
						<div class="form-group">
							<label>Điểm trung bình:</label> <input type="number" step="0.1"
								placeholder="5.5" class="form-control"
								ng-model="newStudent.studentInfo.averageScore" min="0" max="10"
								required>
						</div>
						<div class="form-group">
							<label>Ngày sinh:</label>
							<div class="input-group date" data-provide="datepicker"
								data-date-format="yyyy-mm-dd">
								<input type="text" class="form-control" placeholder="1994-04-04"
									ng-model="newStudent.studentInfo.dateOfBirth" required>
								<div class="input-group-addon">
									<span class="glyphicon glyphicon-th"></span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label>Địa chỉ:</label> <input type="text" class="form-control"
								placeholder="TP. Hồ Chí Minh"
								pattern="([^0-9`!@#$%^&*()=+|{}[\]\'\x22:;?/><,])+"
								ng-model="newStudent.studentInfo.address" minlength="5"
								maxlength="20" required>
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">Lưu</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="/studentmng/resources/js/main.js"></script>
</body>
</html>