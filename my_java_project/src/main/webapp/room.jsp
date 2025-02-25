<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>お部屋のご紹介</title>
    <link rel="stylesheet" href="./css/styles.css">
    <link rel="stylesheet" href="./css/room.css">
</head>
<body class="background">
    <header class="header">
        <div class="container">
            <h1 class="logo" style="text-align: left;">千景</h1>
            <nav class="nav">
                <button class="hamburger" id="hamburger">
                    <span class="bar"></span>
                    <span class="bar"></span>
                    <span class="bar"></span>
                </button>
                <ul class="nav-menu" id="nav-menu">
                    <li><a href="./topmain.html">ホーム</a></li>
                    <li><a href="./un01_1.html">宿泊予約</a></li>
                    <li><a href="./room.jsp">客室</a></li>
                    <li><a href="./meal.html">お食事</a></li>
                    <li><a href="./spa.jsp">温泉</a></li>
                    <li><a href="./access.html">アクセス</a></li>
                    <li><a href="./Q&A.html">Q&A</a></li>
                    <li><a href="./infomation.html">お知らせ</a></li>
                    <li><a href="./ur02_1.html">ご予約確認</a></li>
                </ul>
            </nav>
        </div>
    </header>
    <div class="center-body">
        <br>
    <h1>客室</h1>

    <div class="container1">
        <div class="item">
            <h2>スタンダードルーム(和室)</h2>
            <p><img src="./img/room1.jpg"width="50%"height="50%"></p>
            <p>広さ：10畳</p>
            <p>定員：4名</p>
            <p>説明：和室＊一階・二階指定不可<br>
                純和風のお部屋です。ふかふかの畳の上で、心地よい時間を過ごせます。疲れた身体を癒すため、大浴場もご用意しております。
            </p>
        </div>

        <div class="item">
            <h2>スタンダードルーム(和洋室)</h2>
            <p><img src="./img/room2.jpg"width="50%"height="50%"></p>
            <p>広さ：10畳</p>
            <p>定員：4名</p>
            <p>説明：和洋室＊一階・二階指定不可<br>
                ベットの付いた洋風のお部屋です。疲れた身体を癒すため、大浴場もご用意しております。
            </p>
        </div>

        <div class="item">
            <h2>露天付デラックスルーム</h2>
            <p><img src="./img/onsenroom.png"width="50%"height="50%"></p>
            <p>広さ：14畳</p>
            <p>定員：5名</p>
            <p>説明：和室＊一階<br>
                広々とした純和風のお部屋です。窓の外には庭園が広がり、四季折々の変化をお楽しみいただけます。湯につかりながら、贅沢なひとときを、心ゆくまでご堪能ください。
            </p>
        </div>

        <div class="item">
            <h2>スイートルーム</h2>
            <p><img src="./img/DXroom.png"width="50%"height="50%"></p>
            <p>広さ：16畳</p>
            <p>定員：5名</p>
            <p>説明：ベットの付いたお部屋です。細部にまでこだわった空間で、特別な思い出を提供いたします。
                
            </p>
        </div>
    </div></div>
<%@ include file="topfooter.jsp" %>