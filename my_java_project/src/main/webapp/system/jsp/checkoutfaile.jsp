<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>エラー</title>
    <style>
        html, body {
            margin: 0;
            padding: 0;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f9f9f9;
            font-family: Arial, sans-serif;
        }

        .container {
            text-align: center;
            width: 100%;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        h1 {
            font-size: 24px;
            margin-bottom: 20px;
        }

        .button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #b0b0b0;
            color: white;
            text-decoration: none;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
        }

        .button:hover {
            background-color: #909090;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>入力内容に誤りがあります。</h1>
        <h1>再度入力してください。</h1>
        <button class="button" onclick="location.href='./system/jsp/checkout.jsp'">戻る</button>
    </div>
</body>
</html>
