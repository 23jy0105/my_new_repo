<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ご予約確認ページ</title>
    <link rel="stylesheet" href="./css/styles.css" >
    <link rel="stylesheet" href="./css/modal.css">
    <link rel="stylesheet" href="./css/res_check.css">
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
    <main>
        <div class="center-body">
        <div class="container-block" style="width: 85%; max-width: 1100px; vertical-align: top;">
        <h2 style="margin-top: 20px;  text-align: left;">ご予約プラン</h2>
        
        <figure id="blur"  style="margin-left: 0; float: left;">
        <img src="./img/DXroom.png" alt="plan-img" height="200px" id="blur">
        </figure>
        <div>
        <h3 style=" text-align: left;">＜2食付き＞秋の味覚堪能コース</h3>
        </div>
        <div style="padding: 10px; float: left;  text-align: left;">
            <label>予約人数:</label>
            <strong>2</strong>
            <br>
            <label>宿泊予定日:</label>
            <strong>2024/12/20~2024/12/21</strong>
            
        </div>
        <button class="button"  id="cancel-button" style="width: 200px; vertical-align: -200%; margin-left: 100px;">詳細</button>
        <br>
        
    </div>

    <br>

    <div class="container-block" style="vertical-align: top; margin-top: 0;">
        <p>チェックイン用QRコード</p>
        <br>
        <img src="./img/qrcode.png" alt="qrcode" height="250px">
    </div>
    <div class="container-block" style="margin-top: 0; padding: 30px 50px;">
        <h2 style="margin-bottom: 20px; text-align: left;">お客様情報</h2>
        <div style="text-align: left;">
            <div style="float: left;">
            <label>姓:</label>
            <strong style="margin-right: 100px;">田中</strong>
            <br>
            <label>せい:</label>
            <strong style="margin-right: 100px;">たなか</strong>
            </div>
            <div>
            <label>名:</label>
            <strong>太郎</strong>
            <br>
            <label>めい:</label>
            <strong>たろう</strong>
        </div>
        <br>
        <label>登録メールアドレス:</label>
        <strong>tanaka123@gmail.com</strong>
        </div>
        <button class="button" onclick="location.href='./ur01_1.html'"  style="width: 300px; margin-top: 50px;">予約をキャンセルする</button>
</div>
    </div>
    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2>プラン詳細</h2>
            <p>料金 ￥19,800～</p>
            <p>このプランでは、心を込めて丁寧にお作りした朝食と夕食をご用意しております。
                地元の新鮮な食材を使用したお料理は、一品一品が季節を感じさせ、五感を楽しませる内容となっております。朝食は和定食、夕食は、季節の食材をふんだんに使用した会席料理をご提供いたします。落ち着いた雰囲気の中で、ごゆっくりとお楽しみください。
                
                また、お部屋は和室と洋室の2タイプからお選びいただけます。
                
                和室：畳の香りが心地よい、落ち着いた空間。ゆったりとした時間を過ごしたい方におすすめです。
                洋室：モダンで快適なベッドを完備したお部屋。くつろぎと快適さを求める方に最適です。
                どちらのお部屋タイプも、清潔感あふれる広々とした空間をご用意しており、旅の疲れを癒やすのにぴったりです。
                四季折々の風景を楽しみながら、ゆったりとしたひとときをお過ごしください。
                
                特別なひとときを、心を込めたお料理と快適なお部屋でおもてなしいたします。</p>
            
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
    const modal = document.getElementById("myModal");
        const closeButton = document.getElementsByClassName("close")[0];
        const detailsButtons = document.querySelectorAll("#cancel-button");

        detailsButtons.forEach(button => {
            button.addEventListener("click", () => {
                modal.style.display = "block";
            });
        });

        // 閉じるボタンをクリックしたときにモーダルを閉じる
        closeButton.addEventListener("click", () => {
            modal.style.display = "none";
        });

        // モーダル外の部分をクリックするとモーダルを閉じる
        window.addEventListener("click", (event) => {
            if (event.target === modal) {
                modal.style.display = "none";
            }
        });
    document.addEventListener('DOMContentLoaded', () => {
        const hamburger = document.getElementById('hamburger');
        const navMenu = document.getElementById('nav-menu');

        hamburger.addEventListener('click', () => {
            navMenu.classList.toggle('active');
        });
    });
</script>
</html>