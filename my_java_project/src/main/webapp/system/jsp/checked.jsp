<%@page import="model.Reservation"%>
<%@page import="model.Plan"%>
<%@page import="model.Meal"%>
<%@page import="java.util.Objects"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 	Reservation result = (Reservation)session.getAttribute("reserve"); 
	Plan plan = (Plan)session.getAttribute("plan");
	Meal meal = (Meal)session.getAttribute("meal");
	String mealstr;
	String mealno = meal.getMealNo();
	
	if(Integer.parseInt(mealno)==000){
		mealstr="エラー";
	}else if(Integer.parseInt(mealno)==100){
		mealstr="朝食のみ";
	}else if(Integer.parseInt(mealno)>100){
		mealstr="朝・夕 食事あり";
	}else{
		mealstr="夕食のみ";
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
		if(Objects.isNull(result.getReservationNo())){
			%>
	<div id="company_name">
		<p>ご予約を確認できませんでした。</p>
		<p>フロントにご確認ください。</p>
		<p><%= result.getReservationNo() %></p>

	</div>
	<%
		}else{
			%>
	<div class="div1">
		<h1 class="info"><%= result.getLodgmentStartDate() %>予約</h1>
		<h1 class="info"><%= result.getCustomerName() %>様</h1>
		<h1 class="info"><%= plan.getPlanName() %></h1>
		<h1 class="info"><%= result.getLodgmentDays() %>泊<%= result.getLodgmentDays()+1 %>日</h1>
		<h1 class="info"><%= mealstr%></h1>

	</div>
	<div class="div1">
		<h1>食事時間を選択してください</h1>
		<a class="dish">2024/12/20 夕食</a><select name="dinner"
			id="dinner-select">
			<option value="17:30">17:30</option>
			<option value="18:00">18:00</option>
			<option value="18:30">18:30</option>
		</select> <br> <a class="dish">2024/12/21 朝食</a><select name="braekfast"
			id="braekfast-select" style="margin-bottom: 20px;">
			<option value="17:30">7:00</option>
			<option value="18:00">7:30</option>
			<option value="18:30">8:00</option>
		</select>
		<button class="button" onclick="location.href='./uc01_4.html'">決定</button>
	</div>


	<%}%>



</body>
</html>