<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ご予約確認ページ</title>
    <link rel="stylesheet" href="../css/styles.css">
    <link rel="stylesheet" href="../css/re_pass.css">
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
    <main>
        <div class="center-body">
        <div class="container-block" style="margin-top: 20px;">
        <h1 style="margin-top: 20px;">ご予約メール再送信</h1>
        <h3>登録メールアドレスと宿泊予定日を入力してください。</h3>
        <div style="padding: 10px;">
            <label>登録メールアドレス:</label>
        <input type="text" id="input-box"name="reservation-number" value="" style="width: 250px;">
        </div>
        

        <label>宿泊予定日:</label>
        <input type="date" id="input-box" name="password" value="" style="width: 200px; height: 30px; font-size: large;">
        <br>
        <br>
        <button class="button" onclick="location.href='./ur02_E1_4.html'" style="width: 200px;">再送信</button>
        <br>
        <div style="padding-top: 80px; text-align: left;">
        
    </div>
    </div>
    </div>
    </main>
    <footer>
        <div class="foot">
            <div style="grid-column: 2/3; margin-top: 30px;">

                <h2><u>千景</u></h2>
                <br>
                <p>JR小田原駅から箱根登山線乗り換え<br>小涌谷駅から徒歩10分</p><br>
                <p>チェックイン時刻:15:00~</p>
                <p>チェックアウト時刻:~11:00</p>
                <br>
                <small>注意事項</small>
                <br>
                <strong>○温浴施設のみの利用は受け付けておりません。</strong><br><br>
                <strong>キャンセルポリシー</strong>
                <p>8日前 0%</p>
                <p>7~4日前 20%</p>
                <p>3日前 50%</p>
                <p>2~1日前 80%</p>
                <p>当日 100%</p>
                <p>不泊 100%</p>
            </div>
            <div style=" grid-column: 3/4 70px; margin: 80px 0px;">
                <p>日電旅館　株式会社</p>
                <p>神奈川県足柄下郡箱根町小涌谷503</p>
                <br>
                <p>TEL:03-3363-7761</p>
                <p>FAX:03-3363-7761</p>
                <br>
                <strong>※お問い合わせについて</strong>
                <p>お電話が大変混み合いますので</p>
                <p>メールでのお問い合わせをお願いしております。</p><br>
                <p>メールアドレス:info@tikage.jp</p>
            </div>
        </div>
    </footer>
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