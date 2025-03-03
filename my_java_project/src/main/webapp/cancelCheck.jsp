<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>予約キャンセル</title>
    <link rel="stylesheet" href="./css/styles.css">
    <link rel="stylesheet" href="./css/cancelCheck.css">
</head>
<body>
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
                    <li><a href="Search">宿泊予約</a></li>
                    <li><a href="room.jsp">客室</a></li>
                    <li><a href="Meal.jsp">お食事</a></li>
                    <li><a href="spa.jsp">温泉</a></li>
                    <li><a href="access.jsp">アクセス</a></li>
                    <li><a href="QAndA.jsp">Q&A</a></li>
                    <li><a href="information.jsp">お知らせ</a></li>
                    <li><a href="Login.jsp">ご予約確認</a></li>
                </ul>
            </nav>
        </div>
    </header>
    <div class="center-body" style="margin-top: 70px;">
        <h2>予約をキャンセルしました。</h2>
        <p>詳細は登録メールアドレスからご確認ください。</p>
    </div>
    <br>
    <div class="button-container">
        <button class="button" onclick="location.href='topmain.jsp'">トップに戻る</button>
    </div>
    <script>
        function openModal() {
            document.getElementById("cancelModal").style.display = "block";
        }
        function closeModal() {
            document.getElementById("cancelModal").style.display = "none";
        }
        document.addEventListener('DOMContentLoaded', () => {
        const hamburger = document.getElementById('hamburger');
        const navMenu = document.getElementById('nav-menu');

        hamburger.addEventListener('click', () => {
            navMenu.classList.toggle('active');
        });
    });
    </script>
</body>
</html>