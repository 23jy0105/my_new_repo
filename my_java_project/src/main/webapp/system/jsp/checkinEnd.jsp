<%@page import="model.Room"%>
<%@page import="dao.RoomDao" %>
<%@page import="model.Reservation"%>
<%@page import="model.Plan"%>
<%@page import="java.util.Objects"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 	Reservation result = (Reservation)session.getAttribute("reserve"); 
Plan plan = (Plan)session.getAttribute("plan");
ArrayList<String> list = (ArrayList<String>)session.getAttribute("inroom"); 
String str;
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
   <h1 class="info"><%= result.getLodgmentStartDate() %>予約</h1>
	<h1 class="info"><%= result.getCustomerName() %>様</h1>
	<h1 class="info"><%= plan.getPlanName() %></h1>
	<h1 class="info"><%= result.getLodgmentDays() %>泊<%= result.getLodgmentDays()+1 %>日</h1>
	<%if("0".equals(result.getMealTime())){}else{
		if(100<Integer.parseInt(result.getMealTime()){
			str
		}else if(100>Integer.parseInt(result.getMealTime()){
			
		}else{
			
		}
	%>
		<h1 class="info">食事時間<%= result.getLodgmentDays() %><%= result.getLodgmentDays()+1 %></h1>
		
	<%} %>
	
</div>
    <div class="div1">
    
    
    <h1>部屋番号は<u><%for(String r:list){
    	int i =1;
    	%><%=r%><%if(list.size()>i){
    		out.print("、");
    	}
    } %>
    </u>です。</h1>
    <br>
    <h1>ごゆっくりお過ごしください。</h1>
    </div>
</body>
</html>