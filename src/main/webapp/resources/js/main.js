function setCookie(cname, cvalue, exdays) {
	var d = new Date();
	d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
	var expires = "expires=" + d.toUTCString();
	document.cookie = cname + "=" + cvalue + "; " + expires;
}

var app = angular.module("myApp", [ "ui.bootstrap" ]).constant("studentsURL",
		"/studentmng/student/getList").constant("saveOrUpdateURL",
		"/studentmng/student/saveOrUpdate").constant("deleteURL","/studentmng/student/delete/");

app.controller("myCtrl", function($http, $scope, $filter, studentsURL,
		saveOrUpdateURL,deleteURL) {
	loadTable($scope, $http);
	function loadTable() {
		$http.get(studentsURL).success(function(response) {
			console.log(response);
			$scope.students = response;

			$scope.totalItems = response.length;
			$scope.maxSize = 5;
			$scope.currentPage = 1;
			$scope.itemsPerPage = 5;

			$scope.$watch("currentPage + itemsPerPage", function() {
				var begin = (($scope.currentPage - 1) * $scope.itemsPerPage);
				var end = begin + $scope.itemsPerPage;
				$scope.studentCollection = $scope.students.slice(begin, end);
			});

		});
	}

	$scope.filterStudent = function() {
		var temp = [];
		temp = $filter('filter')($scope.students, $scope.searchKey);
		$scope.totalItems = temp.length;
		$scope.$watch("currentPage + itemsPerPate", function() {
			var begin = (($scope.currentPage - 1) * $scope.itemsPerPage);
			var end = begin + $scope.itemsPerPage;
			$scope.studentCollection = temp.slice(begin, end);
		});
	};
	
	$scope.edit = function(studentId) {
		$scope.editStudent = $filter("filter")($scope.students, {
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

		$http.post(saveOrUpdateURL, data, config).success(
				function(data, status, headers, config) {
					console.log(data);
					$("#modalEdit").modal("hide");
				}).error(function(data, status, header, config) {
			console.log(data);
		});
	}
	
	$scope.del = function(studentId) {
		$http({method: "DELETE", url: deleteURL+studentId}).success(function(response) {
			console.log(response);
			loadTable($scope, $http);
		}).error(function(response) {
			console.log(response);
		});
	}

	$scope.newStudent = {
		"id" : "",
		"studentName" : "",
		"studentCode" : "",
		"studentInfo" : {
			"id" : "",
			"address" : "",
			"averageScore" : "",
			"dateOfBirth" : ""
		}
	};

	$scope.add = function() {
		var data = {
			"studentName" : $scope.newStudent.studentName,
			"studentCode" : $scope.newStudent.studentCode,
			"studentInfo" : {
				"address" : $scope.newStudent.studentInfo.address,
				"averageScore" : $scope.newStudent.studentInfo.averageScore,
				"dateOfBirth" : $scope.newStudent.studentInfo.dateOfBirth
			}
		};
		data = JSON.stringify(data);

		var config = {
			header : {
				"Content-Type" : "application/json; charset=utf-8;"
			}
		}

		$http.post(saveOrUpdateURL, data, config).success(function(response) {
			console.log(response);
			loadTable($scope, $http);
			$("#modalAdd").modal("hide");
			$("form").trigger("reset");
		}).error(function(response) {
			console.log(response);
		});
	}
});

$(function() {
	var links = [ {
		"bgcolor" : "green",
		"icon" : "+"
	} ]
	$('.kc_fab_wrapper').kc_fab(links);
});
