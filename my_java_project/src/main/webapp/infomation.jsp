<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>インフォメーション</title>
    <link rel="stylesheet" href="./css/styles.css">
    <link rel="stylesheet" href="./css/infomation.css">

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
                    <li><a href="./index.html">ホーム</a></li>
                    <li><a href="./un01_1.html">宿泊予約</a></li>
                    <li><a href="./room.html">客室</a></li>
                    <li><a href="./meal.html">お食事</a></li>
                    <li><a href="./spa.html">温泉</a></li>
                    <li><a href="./access.html">アクセス</a></li>
                    <li><a href="./Q&A.html">Q&A</a></li>
                    <li><a href="./infomation.html">お知らせ</a></li>
                    <li><a href="./ur02_1.html">ご予約確認</a></li>
                </ul>
            </nav>
        </div>
    </header>
    <div class="center-body" style="display: inline-block; margin: 0 3%;">
    <br>
    <h1>お知らせ</h1>

    <div class="container1">
        <div class="item">
            <p><img src="./img/onsen2.png"width="150px"height="150px"></p>
            <h2>11月~　期間限定プラン</h2>
            <p>更新日2024/10/8</p>
            <p><a href="./infomationDetail.html">詳細</a></p>
        </div>

        <div class="item">
            <p><img src="./img/map.png"width="200px"height="200px"></p>
            <h2>旅館周辺の絶景スポット紹介</h2>
            <p>更新日2024/9/5</p>
            <p><a href="./infomationDetail.html">詳細</a></p>
        </div>

        <div class="item">
            <p><img src="./img/cake.jpg"width="200px"height="200px"></p>
            <h2>＜8月号＞☆おすすめ☆旅館周辺のスイーツマップ</h2>
            <p>更新日2024/8/3</p>
            <p><a href="./infomationDetail.html">詳細</a></p>
        </div>

        <div class="item">
            <p><img src="./img/map.png"width="200px"height="200px"></p>
            <h2>旅館周辺の絶景スポット紹介</h2>
            <p>更新日2024/7/10</p>
            <p><a href="./infomationDetail.html">詳細</a></p>
        </div>
        <div class="item">
            <p><img src="./img/map.png"width="200px"height="200px"></p>
            <h2>旅館周辺の絶景スポット紹介</h2>
            <p>更新日2024/6/10</p>
            <p><a href="./infomationDetail.html">詳細</a></p>
        </div>
        <div class="item">
            <p><img src="./img/map.png"width="200px"height="200px"></p>
            <h2>旅館周辺の絶景スポット紹介</h2>
            <p>更新日2024/5/11</p>
            <p><a href="./infomationDetail.html">詳細</a></p>
        </div>
        <div class="item">
            <p><img src="./img/map.png"width="200px"height="200px"></p>
            <h2>旅館周辺の絶景スポット紹介</h2>
            <p>更新日2024/4/11</p>
            <p><a href="./infomationDetail.html">詳細</a></p>
        </div>
        <div class="item">
            <p><img src="./img/map.png"width="200px"height="200px"></p>
            <h2>旅館周辺の絶景スポット紹介</h2>
            <p>更新日2024/3/5</p>
            <p><a href="./infomationDetail.html">詳細</a></p>
        </div>
    </div>
</div>
<%@ include file="topfooter.jsp" %>
</body>
<script>
    document.addEventListener('DOMContentLoaded', () => {
        const hamburger = document.getElementById('hamburger');
        const navMenu = document.getElementById('nav-menu');

        hamburger.addEventListener('click', () => {
            navMenu.classList.toggle('active');
        });
    });
</script>
</html>
