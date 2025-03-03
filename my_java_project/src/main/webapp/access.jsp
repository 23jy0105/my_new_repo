<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>アクセス</title>
    <link rel="stylesheet" href="./css/styles.css">
    <link rel="stylesheet" href="./css/access.css">
</head>
<body class="background">
    <header class="header">
        <div class="container">
            <h1 class="logo">千景</h1>
            <nav class="nav">
                <button class="hamburger" id="hamburger">
                    <span class="bar"></span>
                    <span class="bar"></span>
                    <span class="bar"></span>
                </button>
                <ul class="nav-menu" id="nav-menu">
                    <li><a href="Search">宿泊予約</a></li>
                    <li><a href="room.jsp">客室</a></li>
                    <li><a href="Meal.jsp">お食事</a></li>
                    <li><a href="spa.jsp">温泉</a></li>
                    <li><a href="access.jsp">アクセス</a></li>
                    <li><a href="QAndA.jsp">Q&A</a></li>
                    <li><a href="Information">お知らせ</a></li>
                    <li><a href="Login.jsp">ご予約確認</a></li>
                </ul>
            </nav>
        </div>
    </header>
    <div class="center-body" style="background-color: #ffffffee;">
        <br>
        <h1>アクセス</h1>
        <div class="img"><img src="./img/map.png"alt="周辺MAP"></div>
        <a href="https://www.google.co.jp/maps/@35.2409693,139.0473174,15z?hl=ja&entry=ttu&g_ep=EgoyMDI1MDIxMi4wIKXMDSoASAFQAw%3D%3D">googleMapで見る</a>

        <h1>到着時のご案内</h1>
        <div class="img"><img src="./img/map2.png"alt="駅からの画像"></div>
        <p>JR小田原駅から箱根登山線乗り換え小涌谷駅から出て右側に歩いて徒歩10分
        </p><br>
   
</div>
<%@ include file="topfooter.jsp"%>