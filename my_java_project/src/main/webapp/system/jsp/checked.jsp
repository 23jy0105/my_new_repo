<%@page import="model.Reservation"%>
<%@page import="model.Plan"%>
<%@page import="model.Meal"%>
<%@page import="model.LodgmentInformation"%>
<%@page import="java.util.Objects"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
Reservation result = (Reservation) session.getAttribute("reserve");
Plan plan = (Plan) session.getAttribute("plan");
Meal meal = (Meal) session.getAttribute("meal");
String mealstr = "err";
String mealno = meal.getMealNo();
int flag = 1;
if (Objects.nonNull(result.getReservationNo())) {
	if (Integer.parseInt(mealno) == 000) {
		mealstr = "エラー";
	} else if (Integer.parseInt(mealno) == 100) {
		flag = 0;
		mealstr = "朝食のみ";
	} else if (Integer.parseInt(mealno) > 100) {
		mealstr = "朝・夕 食事あり";
	} else {
		mealstr = "夕食のみ";
		flag = 2;
	}
}
%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>checked</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<img class="logo" src="../image/Untitled design.png" width="100"
		height="100">


	<%
	if (Objects.isNull(result.getReservationNo())) {
	%>
	<div id="company_name">
		<p>ご予約を確認できませんでした。</p>
		<p>フロントにご確認ください。</p>


	</div>
	<script>
		setTimeout(function() {
			window.location.href = "checkin.jsp"; // 5秒後に遷移
		}, 5000);
	</script>
	<%
	} else {
	%>
	<div class="div1">
		<h1 class="info"><%=result.getLodgmentStartDate()%>予約
		</h1>
		<h1 class="info"><%=result.getCustomerName()%>様
		</h1>
		<h1 class="info"><%=plan.getPlanName()%></h1>
		<h1 class="info"><%=result.getLodgmentDays()%>泊<%=result.getLodgmentDays() + 1%>日
		</h1>
		<h1 class="info"><%=mealstr%></h1>

	</div>

	<div class="div1">
		<div id="toggleDiv"">
			<h1>食事時間を選択してください</h1>
			<form action="../../CheckIn" method="get">
				<%
				if (flag > 0) {
				%>
				<a class="dish">夕食</a> <select name="dinner" id="dinner-select"  onchange="updateText()">
					<option value="1">17:30</option>
					<option value="2">18:00</option>
					<option value="3">18:30</option>
				</select> <br>
				<%
				}
				%>
				<%
				if (flag < 2) {
				%><a class="dish">朝食</a><select name="breakfast"
					id="breakfast-select" style="margin-bottom: 20px;"  onchange="updateText2()">
					<option value="10">7:00</option>
					<option value="20">7:30</option>
					<option value="30">8:00</option>
				</select>
				<%}%><br>
				<button class="button" type="button" onclick="toggleDiv()">決定</button>
		</div>
		<span id="toggleDiv2" style="display: none;">
			
				<h1>食事時間は</h1>
				<a><label id="resultText"></label></a><a><label id="resultText2"></label></a>
				<h1>となります。よろしいですか？</h1>
				<button class="button" type="button" onclick="toggleDiv()"
					style="float: left; padding: 10px 100px; background-color: gray; margin-right: 10px;">戻る</button>
				<button class="button" type="submit"
					style="float: left; padding: 10px 100px;">確定</button>
			
		</span>
		</form>

	</div>

	<%}%>

	<script>
		function toggleDiv() {
			var div = document.getElementById("toggleDiv");
			var div2 = document.getElementById("toggleDiv2");
			if (div.style.display === "none") {
				div.style.display = "block"; // 表示
				div2.style.display = "none"; // 表示
			} else {
				div.style.display = "none"; // 非表示
				div2.style.display = "block"; // 非表示
			}
		}
		 function updateText() {
	            var select = document.getElementById("dinner-select");
	            
	            var resultText = document.getElementById("resultText");
	            
	            var selectedValue = select.value;
	            

	            // 選択肢に応じてテキストを変更
	            if (selectedValue === "1") {
	                resultText.innerHTML = "夕食   17:30";
	            } else if (selectedValue === "2") {
	                resultText.innerHTML = "夕食   18:00";
	            } else if (selectedValue === "3") {
	                resultText.innerHTML = "夕食   18:30";
	            }

				
	        }
		 function updateText2() {
			 var select2 = document.getElementById("breakfast-select");
			 var resultText2 = document.getElementById("resultText2");
			 var selectedValue2 = select2.value;
			 
			 if (selectedValue2 === "10") {
	                resultText2.innerHTML = "朝食   7:00";
	            } else if (selectedValue2 === "20") {
	                resultText2.innerHTML = "朝食   7:30";
	            } else if (selectedValue2 === "30") {
	                resultText2.innerHTML = "朝食   8:00";
	            }
		 }
		 document.addEventListener("DOMContentLoaded", function() {
	            updateText();
	            // 初期化関数を呼び出
	        });
		 document.addEventListener("DOMContentLoaded", function() {
	            updateText2();
	            // 初期化関数を呼び出
	        });
	</script>

</body>
</html>