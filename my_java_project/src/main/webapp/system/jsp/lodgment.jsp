<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../css/lodgment.css" rel="stylesheet" type="text/css">
    <title>部屋のステータス</title>

</head>
<body>
    <div class="legend">
        <span style="color: green;">緑：チェックイン</span>
        <span style="color: red;">赤：チェックアウト済み</span>
        <span style="color: gray;">灰：空室</span>
    </div>
    <button class="top-button" onclick="location.href='toppage.html'">トップに戻る</button>
    
    <div class="room-container">
        <div class="floor-title">1階</div>
        <div class="rooms">
            <a href="uf04_4.html"><div class="room check-in">101<br>1234567</div></a>
            <a href="../error/cf04_e1.html"><div class="room empty">102<br>―</div></a>
            <a href="uf04_4.html"><div class="room check-out">103<br>2441151</div></a>
            <a href="../error/cf04_e1.html"><div class="room empty">105<br>―</div></a>
            <a href="../error/cf04_e1.html"><div class="room empty">106<br>―</div></a>
        </div>
        <div class="rooms">
            <a href="../error/cf04_e1.html"><div class="room empty">107<br>―</div></a>
            <a href="uf04_4.html"><div class="room check-in">108<br>2384414</div></a>
            <a href="uf04_4.html"><div class="room check-out">110<br>3541145</div></a>
            <a href="uf04_4.html"><div class="room check-in">111<br>3453452</div></a>
            <a href="uf04_4.html"><div class="room check-in">112<br>337745</div></a>
        </div>
    </div>
    
    <div class="room-container">
        <div class="floor-title">2階</div>
        <div class="rooms">
            <a href="uf04_4.html"><div class="room check-in">201<br>4451221</div></a>
            <a href="uf04_4.html"><div class="room check-in">202<br>1122115</div></a>
            <a href="uf04_4.html"><div class="room check-out">203<br>4115121</div></a>
            <a href="uf04_4.html"><div class="room check-out">205<br>3511442</div></a>
            <a href="uf04_4.html"><div class="room check-in">206<br>5411221</div></a>
        </div>
        <div class="rooms">
            <a href="uf04_4.html"><div class="room check-in">207<br>1111111</div></a>
            <a href="uf04_4.html"><div class="room check-out">208<br>4152221</div></a>
            <a href="uf04_4.html"><div class="room check-out">210<br>1222331</div></a>
            <a href="uf04_4.html"><div class="room check-in">211<br>5142210</div></a>
            <a href="../error/cf04_e1.html"><div class="room empty">212<br>―</div></a>
        </div>
    </div>
</body>

<script>
        function fetchData() {
            fetch('GetDataServlet')
                .then(response => response.text())
                .then(data => {
                    document.getElementById("serverData").innerText = data;
                })
                .catch(error => console.error('データ取得エラー:', error));
        }

        window.onload = fetchData; // ページ読み込み時にデータ取得
    </script>
</html>