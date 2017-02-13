<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="<%=request.getContextPath()%>" />
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<script type="text/javascript" src="${ctx }/resources/js/jquery-1.9.1.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/angular.js/1.4.6/angular.min.js"></script>
	<style type="text/css">
	#clock{
	font: bold 24pt sans;
	background: #ddf;
	padding: 10px;
	border: solid black 2px;
	border-radius: 10px;
	 }
	</style>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
	<span id="clock"></span>
	
	
	
	
	
	<div ng-app="myApp" >
	 	<p>名字 : <input type="text" ng-model="name"></p>
	 	<h1>Hello {{name}}</h1>
	 	<p>{{5+5}}</p>
	 	<div ng-controller="testOne">
	 	{{name1+" "+ name2}}
	 	</div>
	 	
	 	<div ng-init="mytext='123456'"></div>
	 	<p ng-bind="mytext"></p>
	</div>
	
	<script type="text/javascript">
		function displayTime(){
			var time = document.getElementById("clock");
			var date = new Date();
			time.innerHTML = date.toLocaleTimeString();
			setTimeout(displayTime,1000);
		}
		
		var app = angular.module("myApp",[]);
		app.controller("testOne",function($scope){
			$scope.name1="hhaha";
			$scope.name2="ooooo";
		});
		
		
		function urlArgs(){
			var args = {};
			var query = location.search.substring(1);//去掉前面的？
			var pairs = query.split("&");//
			for(var i=0;i<pairs.length;i++){
				var postion = pairs[i].indexOf("=");
				if(postion==-1) continue;
				var name = pairs[i].substring(0,postion);
				var value = pairs[i].substring(postion+1);
				args[name] = value;
			}
			console.log(args);
		}
		window.onload = function(){
			displayTime();
			urlArgs();
		}
	</script>
</body>
</html>
