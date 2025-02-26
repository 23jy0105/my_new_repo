<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TOP</title>
    <link rel="stylesheet" href="./css/styles.css">
    <link rel="stylesheet" href="./css/top.css">
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
                <li><a href="topmain.jsp">ホーム</a></li>
                <li><a href="un01_1.jsp">宿泊予約</a></li>
                <li><a href="room.jsp">客室</a></li>
                <li><a href="meal.jsp">お食事</a></li>
                <li><a href="spa.jsp">温泉</a></li>
                <li><a href="access.jsp">アクセス</a></li>
                <li><a href="Q&A.jsp">Q&A</a></li>
                <li><a href="infomation.jsp">お知らせ</a></li>
                <li><a href="ur02_1.jsp">ご予約確認</a></li>
            </ul>
        </nav>
    </div>
</header>
    <main>
        <div class="center-body">
        <section id="home">
            <img src="./img/2025_ReserveTOP.jpg"width="70%" height="400px"alt="トップ画像">
            <h1>千景</h1>
            <p>いらっしゃいませ。<br>
                千景は特別な一時を提供する旅館です
            </p> 
        </section>
        <section id="room">
            <br>
            <h1>客室</h1>
            <div class="container1">
                <div class="item">
                    <h2>スタンダードルーム(和室)</h2>
                    <p><img src="./img/room1.jpg"width="70%"height="70%"alt="部屋"></p>
                    <p>広さ：10畳</p>
                    <p>定員：4名</p>
                    <p>和室＊一階・二階指定不可</p>
                </div>
        
                <div class="item">
                    <h2>スタンダードルーム(洋室)</h2>
                    <p><img src="./img/room2.jpg"width="70%"height="70%"alt="部屋"></p>
                    <p>広さ：10畳</p>
                    <p>定員：4名</p>
                    <p>説明：洋室＊一階・二階指定不可</p>
                </div>
                
                <div class="item">
                    <h2>露天付デラックスルーム</h2>
                    <p><img src="./img/onsenroom.png"width="70%"height="70%"alt="部屋"></p>
                    <p>広さ：14畳</p>
                    <p>定員：5名</p>
                    <p>説明：和室＊一階</p>
                </div>
        
                <div class="item">
                    <h2>スイートルーム</h2>
                    <p><img src="./img/DXroom.png"width="70%"height="70%"alt="部屋"></p>
                    <p>広さ：16畳</p>
                    <p>定員：5名</p>
                    <p>説明：一階二階指定不可</p>
                </div>
            </div>
        </section>
        <section id="spa">
            <div class="container-block">
            <h1>温泉</h1>
            <div class="container2">
                <div class="onsen1">
                    <h3 style="margin-bottom: 0;">大浴場</h3>
                    <p><img src="./img/onsen1.png"width="600px"height="500px"alt="温泉"></p>
                    <p>当館自慢の大浴場です。</p>
                </div>
                <div class="onsen2">
                    <h3 style="margin-bottom: 0;">露天風呂</h3>
                    <p><img src="./img/onsen2.png"width="600px"height="500px"alt="露天風呂"></p>
                    <p>ゆったりとした雰囲気を楽しめる露天風呂です。</p>
                </div>
            </div></div>
        </section>
        <section id="meal">
            <div class="container-block">
            <h1>お食事</h1>
            <div class="container3">
                <div class="meal1">
                    <h3 style="margin-bottom: 0;">夕食</h3>
                    <p><img src="./img/meal_dinner01.png"width="600px"height="500px"alt="夕食の画像"></p>
                    <p>地元の魚や野菜を使ったおいしいお食事をご用意しております。<br>
                    また、季節の食材を使った期間限定のお食事もごさいます。</p>
                </div>
                <div class="meal2">
                    <h3 style="margin-bottom: 0;">朝食</h3>
                    <p><img src="./img/meal_morning.png"width="600px"height="500px"alt="朝食の画像"></p>
                    <p>丁寧に焼き上げた鮭と副菜と味噌汁、ご飯の定番の朝食です。</p>
                </div>
            </div></div>
        </section>
        
        <section id="info">
            <div class="container-block">
            <h1>インフォメーション</h1>
            <div class="container4">
                <p><a href="infomationDetail.html">2024/10/10　旅館周辺の絶景スポット紹介</a></p>
                <p><a href="infomationDetail.html">2024/10/8　11月~　期間限定プラン</a></p>
                <p><a href="infomationDetail.html">2024/10/5　＜10月号＞　☆おすすめ☆旅館周辺のスイーツマップ</a></p>
            </div></div>
        </section>
        <!--<section id="access">
            <h1>アクセス</h1>
            <div class="container5">
                <div id="map"></div>
                <p>JR小田原駅から箱根登山線乗り換え<br>小涌谷駅から徒歩10分</p>
            </div>
        </section>-->
    </div>
    </main>
<%@ include file="topfooter.jsp" %>