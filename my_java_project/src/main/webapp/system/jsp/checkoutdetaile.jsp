<%@page import="model.Reservation"%>
<%@page import="java.util.Objects"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    Reservation r = (Reservation)request.getAttribute("reserve");
    %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>チェックアウト</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
        }
        .container {
            width: 80%;
            max-width: 600px;
            margin: auto;
            border: 1px solid #ccc;
            padding: 40px;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        h1 {
            font-size: 24px;
        }
        .info p {
            margin: 5px 0;
        }
        .summary {
            margin-top: 20px;
            font-weight: bold;
        }
        .total {
            margin-top: 10px;
            font-size: 18px;
            border-top: 1px solid #ccc;
            padding-top: 10px;
        }
        .pay-button {
            padding: 8px 15px;
            border: none;
            background-color: #bbb;
            cursor: pointer;
            border-radius: 3px;
            float: right;
        }
        .pay-button:hover {
            background-color: #999;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="info">
            <p>予約番号：<%=r.getReservationNo() %></p>
            <p>部屋番号：101</p>
            <p>顧客氏名：山田 太郎</p>
            <p>プラン名：基本プラン朝夕食事付</p>
            <p>宿泊人数：2名</p>
        </div>
        <div class="summary">
            <p>基本プラン朝夕食事付 （19,129円）</p>
            <p>✖</p>
            <p>宿泊人数 （2人）</p>
        </div>
        <div class="total">
            <p>合計金額：38,258円</p>
        </div>
        <button class="pay-button" onclick="location.href='./uf02_6.html'">支払い</button>
    </div>
</body>
</html>
