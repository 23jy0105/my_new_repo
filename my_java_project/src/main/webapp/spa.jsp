<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<html lang="ja">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>温泉のご紹介</title>
    <link rel="stylesheet" href="./css/styles.css">
    <link rel="stylesheet" href="./css/spa.css">
</head>
<body>
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
                    <li><a href="./topmain.jsp">ホーム</a></li>
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
    <div class="center-body" style="padding-bottom: 50px;">
        <br>
        <div class="container-block">
        <h1>温泉</h1>
        <img src="./img/onsen1.png" alt="大浴場">
        <div class="onsen1">
            <div class="info">
                <h2>大浴場</h2>
                <div class="detail1">
                    <p>入浴時間</p>
                    <p>朝 6:00~10:00</p>
                    <p>夜 18:00~22:00</p>
                </div>
            </div>                 
        </div>
        <div class="detail2">
            <strong>効能</strong>
            <p>アルカリ性単純温泉:
                肌を滑らかにし、神経痛や筋肉痛、関節痛、疲労回復、冷え性、五十肩、打撲、捻挫などの慢性期の症状に効果があります。また、胃腸機能の低下や軽症高血圧、糖尿病、軽い高コレステロール血症、喘息、痔の痛み、自律神経不安定症、ストレスによる睡眠障害やうつ状態、病後回復期
                に効果があります。
            </p>
            <p>塩化物泉:
                温効果が高く、冷え性や疲労回復に効果があります。また、皮膚病や切り傷、痔疾、婦人病、美肌
                などの効果があります。
            </p>
        </div>  
        <br>
    
        <img src="./img/onsen2.png" alt="露天風呂">
        <div class="onsen1">
            <div class="info">
                <h2>露天風呂</h2>
            </div>

        </div>
        <div class="detail2">
            <strong>効能</strong>
            <p>アルカリ性単純温泉:
                肌を滑らかにし、神経痛や筋肉痛、関節痛、疲労回復、冷え性、五十肩、打撲、捻挫などの慢性期の症状に効果があります。また、胃腸機能の低下や軽症高血圧、糖尿病、軽い高コレステロール血症、喘息、痔の痛み、自律神経不安定症、ストレスによる睡眠障害やうつ状態、病後回復期
                に効果があります。
            </p>
            <p>塩化物泉:
                温効果が高く、冷え性や疲労回復に効果があります。また、皮膚病や切り傷、痔疾、婦人病、美肌
                などの効果があります。
            </p>
        </div>                
    </div>
</div>
<%@ include file="topfooter.jsp" %>