<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script language="javascript">
	
</script>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html">
<!-- 차트 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<!-- 모달창 -->
<title>수조 관리 시스템</title>

<style>
/* mystyle.css */
/* The Modal (background) */

/* The Close Button */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

table {
	width: 100%;
	border: 1px solid #444444;
	border-collapse: collapse;
	height: 100%;
	overflow: auto;
}

th, td {
	border: 1px solid #444444;
	padding: 10px;
}

.modal { /* 모달창 */
	display: none;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 100%;
	height: 100%;
	z-index: 1;
	overflow-y: initial !important;
	background: rgba(80, 80, 80, 0.4);
}

.modal h2 {
	margin: 0;
}

.modal button {
	display: inline-block;
	width: 100px;
	margin-left: calc(100% - 100px - 10px);
}

.modal .modal_content {
	width: 700px;
	margin: 100px auto;
	padding: 20px 10px;
	background: #fff;
	border: 2px solid #666;
}

#btn button {
	transition: 0.6s;
	position: relative;
	background-color: #DAAFAF;
	width: 170px;
	height: 170px;
	font-size: 20px;
	border-radius: 5%;
	border-width: 0px;
	box-shadow: 12px 12px 2px 1px rgba(0, 0, 0, .2);
}

#btn button:hover {
	background-color: #9692af;
	box-shadow: inset 0 0 0 36px var(- -btn-bg);
}
/* #modal_opne_btn_ph {
  background: #b621fe;
  border: none;
  z-index: 1;
}
#modal_opne_btn_ph:after {
  position: absolute;
  content: "";
  width: 0;
  height: 100%;
  top: 0;
  right: 0;
  z-index: -1;
  background-color: #663dff;
  border-radius: 5px;
   box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
   7px 7px 20px 0px rgba(0,0,0,.1),
   4px 4px 5px 0px rgba(0,0,0,.1);
  transition: all 0.3s ease;
}
#modal_opne_btn_ph:hover {
  color: #fff;
}
#modal_opne_btn_ph:hover:after {
  left: 0;
  width: 100%;
}
#modal_opne_btn_ph:active {
  top: 2px;
} */
</style>


<script type="text/javascript" src="/js/lib/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/js/main/main.js"></script>
<!-- js파일 연결 url -->


<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>
<body style="background: #324e7b;">
	<!-- background: linear-gradient(#7cbac9, #507496); -->
	<div style="color: #f8f8f8; display: flex; justify-content: center; font-size: 40px; font-weight: bold; font-style: inherit; padding-bottom: 30px; padding-top: 40px">수조 관리 시스템 WEB</div>
	<div>
		<!-- *************FILTER************* -->
		<div style="display: flex; justify-content: flex-end; padding-right: 12%;">
			<select id="time" style="margin: 15px; width: 100px; height: 35px; font-size: 20px; font-weight: normal; font-style: inherit;">
				<option value="hour" selected>hour</option>
				<option value="day">day</option>
			</select>
		</div>

		<!-- *************Chart************* -->
		<div style="display: flex; justify-content: center; width: 100%; height: 50vh; padding-bottom: 0%">
			<div id="chart_div" style="width: 90%; height: 80%;"></div>
		</div>
		<div style="display: flex; justify-content: flex-end; position: relative; right: 90px; bottom: 50px;">
			<div style="display: flex; justify-content: space-around; align-items: center; width: 10%; border-radius: 2px; border-color: white; margin-bottom: 40px;">
				<div style="display: flex; justify-content: center; width: 30px; height: 30px; border-radius: 50%; border-width: 0px; background-color: #b4cd93;"></div>
				<div style="color: white;">정상</div>
				<div style="display: flex; justify-content: center; width: 30px; height: 30px; border-radius: 50%; border-width: 0px; background-color: #c94e4e;"></div>
				<div style="color: white;">이상</div>
			</div>
		</div>
	</div>


	<div id="btn" style="width: 93%; height: 21%; margin-left: 3%; display: flex; justify-content: space-around;">
		<div id="root">
			<!-- 모달창 -->
			<button type="button" id="modal_opne_btn_temper" value="temper">
				<!-- style="position: relative; background-color: #DAAFAF; width: 170px; height: 170px; font-size: 20px; border-radius: 5%; border-width: 0px; box-shadow: 12px 12px 2px 1px rgba(0, 0, 0, .2);" -->
				Temperature
				<div id="light_temper" style="position: absolute; right: -30px; top: -30px; display: flex; justify-content: center; width: 60px; height: 60px; border-radius: 50%; border-width: 0px;"></div>
			</button>
		</div>
		<div id="root">
			<!-- 모달창 -->
			<button type="button" id="modal_opne_btn_ph" value="ph">
				Ph
				<div id="light_ph" style="position: absolute; right: -30px; top: -30px; display: flex; justify-content: center; width: 60px; height: 60px; border-radius: 50%; border-width: 0px;"></div>
			</button>
		</div>
		<div id="root" style="">
			<!-- 모달창 -->
			<button type="button" id="modal_opne_btn_light" value="light">
				Light
				<div id="light_light" style="position: absolute; right: -30px; top: -30px; display: flex; justify-content: center; width: 60px; height: 60px; border-radius: 50%; border-width: 0px;"></div>
			</button>
		</div>
		<div id="root" style="">
			<!-- 모달창 -->
			<button type="button" id="modal_opne_btn_level" value="level">
				WaterLevel
				<div id="light_waterLevel" style="position: absolute; right: -30px; top: -30px; display: flex; justify-content: center; width: 60px; height: 60px; border-radius: 50%; border-width: 0px;"></div>
			</button>
		</div>
	</div>
	<div id="modal1" class="modal">
		<div class="modal_content">
			<button type="button" id="modal_close_btn_temper">X</button>
			<div style="display: flex; justify-content: center; font-size: x-large;">
				<h2>Temperature</h2>
			</div>
			<button type="button" id="reload1" style="margin-bottom: 40px;">새로고침</button>
			<div id="listDiv1" style="max-height: 700px; overflow: auto;">
				<table id="table1">
					<thead style="background-color: #fad3cf !important; position: sticky; top: 0">
						<tr>
							<th>ID</th>
							<th>Value</th>
						</tr>
					</thead>
					<tbody id="listbody1" style="max-height: 700px; overflow: auto; width: 350px; height: 200px;">
					</tbody>
				</table>
			</div>
		</div>
		<div class="modal_layer"></div>
	</div>
	<div id="modal2" class="modal">
		<div class="modal_content">
			<button type="button" id="modal_close_btn_ph">X</button>
			<div style="display: flex; justify-content: center; font-size: x-large;">
				<h2>Ph</h2>
			</div>
			<button type="button" id="reload2" style="margin-bottom: 40px;">새로고침</button>
			<div id="listDiv2" style="max-height: 700px; overflow: auto;">
				<table id="table2">
					<thead style="background-color: #fad3cf !important; position: sticky; top: 0">
						<tr>
							<th>ID</th>
							<th>Value</th>
						</tr>
					</thead>
					<tbody id="listbody2" style="max-height: 700px; overflow: auto; width: 350px; height: 200px;">
					</tbody>
				</table>
			</div>
		</div>
		<div class="modal_layer"></div>
	</div>
	<div id="modal3" class="modal">
		<div class="modal_content">
			<button type="button" id="modal_close_btn_light">X</button>
			<div style="display: flex; justify-content: center; font-size: x-large;">
				<h2>Light</h2>
			</div>
			<button type="button" id="reload3" style="margin-bottom: 40px;">새로고침</button>
			<div id="listDiv3" style="max-height: 700px; overflow: auto;">
				<table id="table3">
					<thead style="background-color: #fad3cf !important; position: sticky; top: 0">
						<tr>
							<th>ID</th>
							<th>Value</th>
						</tr>
					</thead>
					<tbody id="listbody3" style="max-height: 700px; overflow: auto; width: 350px; height: 200px;">
					</tbody>
				</table>
			</div>
		</div>
		<div class="modal_layer"></div>
	</div>
	<div id="modal4" class="modal">
		<div class="modal_content">
			<button type="button" id="modal_close_btn_level">X</button>
			<div style="display: flex; justify-content: center; font-size: x-large;">
				<h2>WaterLevel</h2>
			</div>
			<button type="button" id="reload4" style="margin-bottom: 40px;">새로고침</button>
			<div id="listDiv4" style="max-height: 700px; overflow: auto;">
				<table id="table4">
					<thead style="background-color: #fad3cf !important; position: sticky; top: 0">
						<tr>
							<th>ID</th>
							<th>Value</th>
						</tr>
					</thead>
					<tbody id="listbody4" style="max-height: 700px; overflow: auto; width: 350px; height: 200px;">
					</tbody>
				</table>
			</div>
		</div>
		<div class="modal_layer"></div>
	</div>

</body>
<script>
	/* 	function reloadDivArea() {
	 $('reload1').load(location.href + ' reload1');
	 } */
	document.getElementById("modal_opne_btn_temper").onclick = function() {
		document.getElementById("modal1").style.display = "block";
	}
	document.getElementById("modal_close_btn_temper").onclick = function() {
		document.getElementById("modal1").style.display = "none";
	}
	document.getElementById("modal_opne_btn_ph").onclick = function() {
		document.getElementById("modal2").style.display = "block";
	}
	document.getElementById("modal_close_btn_ph").onclick = function() {
		document.getElementById("modal2").style.display = "none";
	}
	document.getElementById("modal_opne_btn_light").onclick = function() {
		document.getElementById("modal3").style.display = "block";
	}
	document.getElementById("modal_close_btn_light").onclick = function() {
		document.getElementById("modal3").style.display = "none";
	}
	document.getElementById("modal_opne_btn_level").onclick = function() {
		document.getElementById("modal4").style.display = "block";
	}
	document.getElementById("modal_close_btn_level").onclick = function() {
		document.getElementById("modal4").style.display = "none";
	}
</script>


</html>

