<%@page import="model.Reservation"%>
<%@page import="model.Announcement"%>
<%@page import="java.util.Objects"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
ArrayList<Announcement> list = (ArrayList<Announcement>)session.getAttribute("announce");

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>お知らせ一覧</title>
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
        <button onclick="location.href='addannounce'">追加</button>
        <h2>お知らせ一覧</h2>
        <button onclick="location.href='toppage'">トップに戻る</button>
    </div>
    
    <%
	for(Announcement a:list){    
    %>
    
    <div class="plan-container">
        <img src="../image/sample.png" alt="プラン画像">
        <div class="plan-info">
            <h3><%=a.getTitle() %></h3>
        </div>
        <button class="detail-button" onclick="location.href='../../EditAnnounce?no=<%=a.getAnnouncementNo() %>'">詳細</button>
    </div>
	<%} %>
    
    
</body>
</html>