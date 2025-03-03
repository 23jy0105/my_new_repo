<%@page import="model.Reservation"%>
<%@page import="model.Plan"%>
<%@page import="java.util.Objects"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
ArrayList<Plan> list = (ArrayList<Plan>)session.getAttribute("planlist");

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>宿泊プラン一覧</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .plan-container {
            display: flex;
            align-items: center;
            border: 1px solid #ccc;
            padding: 10px;
            margin-bottom: 10px;
        }
        .plan-container img {
            width: 100px;
            height: 100px;
            margin-right: 10px;
        }
        .plan-info {
            flex-grow: 1;
        }
        .plan-info p {
            margin: 5px 0;
        }
        .detail-button {
            padding: 8px 12px;
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="header">
        <button onclick="location.href='../../AddPlan'">追加</button>
        <h2>プラン一覧</h2>
        <button onclick="location.href='./toppage.jsp'">トップに戻る</button>
    </div>
    
    <%
	for(Plan plan:list){    
    %>
    
    <div class="plan-container">
        <img src="../image/sample.png" alt="プラン画像">
        <div class="plan-info">
            <h3><%=plan.getPlanName() %></h3>
            <p><%=plan.getPlanOverview() %></p>
        </div>
        <button class="detail-button" onclick="location.href='../../EditPlan?no=<%=plan.getPlanNo() %>'">詳細</button>
    </div>
	<%} %>
    
    
</body>
</html>