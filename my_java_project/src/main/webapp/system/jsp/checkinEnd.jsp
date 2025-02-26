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
    <img class="logo" src="../image/Untitled design.png" width="100" height="100">
    <div class="div1">
    <h1 class="info">2024/12/20～21予約</h1>
    <h1 class="info">電子太郎様</h1>
    <h1 class="info">素泊まりプラン</h1>
    <h1 class="info">1泊2日</h1>
</div>
    <div class="div1">
    
    
    <h1>部屋番号は<u>101</u>です。</h1>
    <br>
    <h1>ごゆっくりお過ごしください。</h1>
    </div>
</body>
</html>