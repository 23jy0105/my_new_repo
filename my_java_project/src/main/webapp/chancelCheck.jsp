<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>予約キャンセル</title>
    <link rel="stylesheet" href="./css/styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
        }
        h2 {
            font-size: 50px;
        }
        .button-container {
            text-align: center;
            margin-top: 20px;
            
        }
        .top-button {
            background-color: #ccc;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            cursor: not-allowed;
        }
        .modal-body {
            margin-top: 10px;
        }
        .container1 {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 0;
            align-items: center;
            height: 100vh;
            display: flex;
            justify-content: space-between;
            text-align: center;
        }
        .hamburger .bar {
            width: 25px;
            height: 3px;
            background: white;
            border-radius: 2px;
        }
    </style>
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
                    <li><a href="#home">ホーム</a></li>
                    <li><a href="./uwReserve_05.html">宿泊予約</a></li>
                    <li><a href="./uwReserve_24.html">客室</a></li>
                    <li><a href="#meal">お食事</a></li>
                    <li><a href="#spa">温泉</a></li>
                    <li><a href="#access">アクセス</a></li>
                    <li><a href="#Q&A">Q&A</a></li>
                    <li><a href="#info">お知らせ</a></li>
                    <li><a href="#reservation_check">ご予約確認</a></li>
                </ul>
            </nav>
        </div>
    </header>
    <div class="container">
        <h2>予約をキャンセルしました</h2>
    </div>
    <div class="button-container">
        <button class="top-button">トップに戻る</button>
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