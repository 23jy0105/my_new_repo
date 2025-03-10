<<<<<<< HEAD
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.Announcement" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.ArrayList" %>

<%
	Announcement a =(Announcement) session.getAttribute("announcements");
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");

    if (a == null) {
%>
    <p>指定された情報は存在しません。</p>
<%
    } else {
%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= a.getTitle() %></title>
    <link rel="stylesheet" href="./css/styles.css">
</head>
<body class="background">
    <div class="center-body">
        <h1><%= a.getTitle() %></h1>
        <p>更新日: <%= dateFormat.format(a.getDate()) %></p>
        
        <% if (a.getAnnouncementImage() != null && !a.getAnnouncementImage().isEmpty()) { %>
            <img src="<%= a.getAnnouncementImage() %>" width="500px">
        <% } else { %>
            <img src="./img/no-image.png" width="500px">
        <% } %>

        <a href="Information">← お知らせ一覧に戻る</a>
    </div>
</body>
</html>
<%
    }
%>
=======
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>旅館周辺の絶景スポット紹介</title>
    <link rel="stylesheet" href="./css/styles.css">
    <style>

        
    </style>
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

    <div class="center-body" style="background-color: #fff4ecf3;">
    <div class="announceImg"><img src="./img/fall.png"height="500px"width="500px" style="margin-top: 50px;"></div>
    <h1>旅館周辺の絶景スポット紹介</h1>
    <main>
        <h3>神奈川の紅葉と旅館で過ごす秋の贅沢時間</h3>

        秋の訪れとともに、神奈川県では美しい紅葉が楽しめる季節になります。山々が赤や黄色に染まり、静かで落ち着いた雰囲気の中で贅沢な時間を過ごすことができます。そんな秋にぴったりな、旅館周辺の絶景とともに楽しめるスポットをご紹介します。<br>
        
        <h3>箱根の温泉旅館と絶景</h3>
        
        神奈川県内でも屈指の観光地である箱根は、紅葉の名所としても知られています。特に芦ノ湖や大涌谷周辺は、秋になると鮮やかな景色が広がります。箱根の旅館では、露天風呂に浸かりながら紅葉を楽しむことができ、心身ともにリラックスできます。<br>
        
        <h3>周辺の絶景スポット:</h3>
        - 芦ノ湖 - 湖面に映る紅葉と富士山の景色が圧巻。<br>
        - 大涌谷 - 白い噴煙と紅葉のコントラストが美しい。<br>
        
        <h3>鎌倉の歴史ある旅館と紅葉の名所</h3>
        
        鎌倉は紅葉と歴史が融合した美しい街です。鶴岡八幡宮や長谷寺では、秋の風情を感じながら観光を楽しめます。静かな旅館に泊まり、風情ある町並みをゆっくり散策するのもおすすめです。<br>
        
        <h3>周辺の絶景スポット：</h3>
        - 鶴岡八幡宮 - 鳩が舞う境内と紅葉が調和する神聖な空間。<br>
        - 長谷寺 - 鎌倉の海を望む高台からの紅葉景色が魅力。<br>
        
        <h3>湯河原の旅館と静寂の秋風景</h3>
        
        神奈川県の湯河原温泉は、落ち着いた雰囲気の中で紅葉を楽しめるスポットです。森に囲まれた露天風呂で、秋の自然を感じながら温泉に浸かる贅沢な時間を過ごせます。<br>
        
        <h3>周辺の絶景スポット：</h3>
        - 万葉公園 - 紅葉に包まれた散策路で静けさを堪能。<br>
        - 不動滝 - 水しぶきと紅葉が織りなす幻想的な景観。<br>
        
        <h3>まとめ</h3>
        
        神奈川には、紅葉とともに特別な時間を過ごせる旅館が多数あります。箱根、鎌倉、湯河原と、それぞれ異なる魅力を持つエリアで、旅館と周辺の絶景を楽しみながら秋の贅沢なひとときをお過ごしください。<br>
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
>>>>>>> branch 'main' of http://git@github.com/23jy0105/my_new_repo.git
