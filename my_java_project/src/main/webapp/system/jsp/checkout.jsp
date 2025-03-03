<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            padding: 20px;
            border-radius: 5px;
        }
        h1 {
            font-size: 24px;
        }
        label {
            display: inline-block;
            width: 80px;
        }
        input {
            width: 70%;
            padding: 5px;
        }
        .buttons {
            margin-top: 10px;
        }
        button {
            padding: 8px 15px;
            margin-right: 5px;
            border: none;
            background-color: #bbb;
            cursor: pointer;
            border-radius: 3px;
        }
        button:hover {
            background-color: #999;
        }
        .top-button {
            float: right;
        }
    </style>
</head>
<body>
    <div class="container">
        <button class="top-button" onclick="location.href='./toppage.jsp'">トップに戻る</button>
        <h1>チェックアウト</h1>
        <form action="../../CheckOut" method="get">
        <label for="reserve">予約番号</label>
        <input type="text" id="reserve" placeholder="" name="reserve">
        <div class="buttons">
            <button type="submit">検索</button></form>
            <button onclick="location.href=''" type="button">カメラ入力</button>
        </div>
    </div>
</body>
</html>