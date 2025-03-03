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
        <form action="Reserve3" method="post">
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

    }else{
        document.getElementById('confirm-extra-fields').innerHTML = 
        `<p>ご本人様</p>`;
    }

        // 編集ボタンで前のページに戻る
        document.getElementById('edit').addEventListener('click', function() {
            window.history.back();
        });
    </script>
</body>
</html>
