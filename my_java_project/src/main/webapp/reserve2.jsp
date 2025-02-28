<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/reserve2.css">
    <title>入力確認</title>
</head>
<body>
    <div class="progress-container">
        <div class="progress-bar">
            <div class="progress-bar-fill"></div>
        </div>
        <div class="progress-step">
            <div class="circle">1</div>
            <span>お客様情報</span>
        </div>
        <div class="progress-step active">
            <div class="circle">2</div>
            <span>入力確認</span>
        </div>
        <div class="progress-step">
            <div class="circle">3</div>
            <span>予約確定</span>
        </div>
    </div>
    <div class="form-container">
        <h2>入力確認</h2>
        <form action="./Reserve3" method="post">
            <div class="form-group">
                <label>姓</label>
                <p id="confirm-last-name"></p>
            </div>
            <div class="form-group">
                <label>名</label>
                <p id="confirm-first-name"></p>
            </div>
            <div class="form-group">
                <label>せい</label>
                <p id="confirm-last-kana"></p>
            </div>
            <div class="form-group">
                <label>めい</label>
                <p id="confirm-first-kana"></p>
            </div>
            <div class="form-group">
                <label>メールアドレス</label>
                <p id="confirm-email"></p>
            </div>
            <div class="form-group">
                <label>郵便番号</label>
                <p id="confirm-postal-code"></p>
            </div>
            <div class="form-group">
                <label>都道府県</label>
                <p id="confirm-prefecture"></p>
            </div>
            <div class="form-group">
                <label>電話番号</label>
                <p id="confirm-phone"></p>
            </div>
            <div class="form-group">
                <label>住所</label>
                <p id="confirm-address"></p>
            </div>
            <div class="form-group">
                <label>建物名</label>
                <p id="confirm-building"></p>
            </div>

            <div class="form-group">
                <label>予約者情報</label>
                <div id="confirm-extra-fields"></div>
            </div>
            <div  class="form-group">
                <label>人数</label>
                <div id="confirm-people"></div>
            </div>
            <div class="form-group">
                <label>部屋数</label>
                <div id="confirm-room"></div>
            </div>
            <div class="form-group">
                <label>アレルギー人数</label>
                <div id="confirm-allergy"></div>
            </div>
            <div class="fee-group">
                <h2>プラン名</h2>
                <p>基本プラン</p>
                <h2>料金</h2>
                <p>19,896円</p>
            </div>
            <div class="button-container">
                <button type="button" id="edit">修正する</button>
                <button type="submit" id="confirm">確定する</button>
            </div>
        </form>
    </div>

    <script>
    // ここで前のページからデータを受け取り、入力内容を表示します。
    document.getElementById('confirm-last-name').innerText = localStorage.getItem('lastName');  // 修正
    document.getElementById('confirm-first-name').innerText = localStorage.getItem('firstName');  // 修正
    document.getElementById('confirm-last-kana').innerText = localStorage.getItem('lastKana');  // 修正
    document.getElementById('confirm-first-kana').innerText = localStorage.getItem('firstKana');  // 修正
    document.getElementById('confirm-email').innerText = localStorage.getItem('email');
    document.getElementById('confirm-postal-code').innerText = localStorage.getItem('postalCode');  // 修正
    document.getElementById('confirm-prefecture').innerText = localStorage.getItem('prefecture');
    document.getElementById('confirm-phone').innerText = localStorage.getItem('phone');
    document.getElementById('confirm-address').innerText = localStorage.getItem('address');
    document.getElementById('confirm-building').innerText = localStorage.getItem('building');
    document.getElementById('confirm-people').innerText = localStorage.getItem('peopleCount');
    document.getElementById('confirm-room').innerText = localStorage.getItem('roomCount');

    // 予約者情報（追加の項目）
    if (localStorage.getItem('bookInstead') === 'yes') {
        document.getElementById('confirm-extra-fields').innerHTML = `
            <p>姓: ${localStorage.getItem('reserverLastName')}</p>  <!-- 修正 -->
            <p>名: ${localStorage.getItem('reserverFirstName')}</p>  <!-- 修正 -->
            <p>せい: ${localStorage.getItem('reserverLastKana')}</p>  <!-- 修正 -->
            <p>めい: ${localStorage.getItem('reserverFirstKana')}</p>  <!-- 修正 -->
            <p>メールアドレス: ${localStorage.getItem('reserverEmail')}</p>  <!-- 修正 -->
            <p>電話番号: ${localStorage.getItem('reserverPhone')}</p>  <!-- 修正 -->
        `;
    }else{
        document.getElementById('confirm-extra-fields').innerHTML = 
        `<p>ご本人様</p>`;
    }

        document.getElementById('confirm-allergy').innerText = localStorage.getItem('allergy');

        // 編集ボタンで前のページに戻る
        document.getElementById('edit').addEventListener('click', function() {
            window.history.back();
        });
    </script>
</body>
</html>
