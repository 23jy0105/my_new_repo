<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.Reservation"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.Objects"%>

<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>予約キャンセル</title>
    <link rel="stylesheet" href="./css/styles.css">
    <link rel="stylesheet" href="./css/modal.css">
    <link rel="stylesheet" href="./css/Reservw_cancel.css">
    <%Reservation reserve = (Reservation)session.getAttribute("reserve"); %>
    
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
                    <li><a href="Information">お知らせ</a></li>
                    <li><a href="Login.jsp">ご予約確認</a></li>
                </ul>
            </nav>
        </div>
    </header>
    <div class="container1">
        <h1>予約をキャンセルする</h1>
        <br>
        <p>予約日時: 2024/12/20〜2024/12/21</p>
        <p>プラン名: 基本プラン朝・夕食付き</p>
        <p>予約人数: 二人</p>
        <p>姓: 田中　名: 太郎</p>
        <p>せい: たなか　めい: たろう</p>
        <h3>キャンセルする場合、キャンセル料が発生する場合があります。</h3>
        <table>
            <tr>
                <th>キャンセル日</th>
                <th>8日前</th>
                <th>7〜4日前</th>
                <th>3日前</th>
                <th>2〜1日前</th>
                <th>当日</th>
            </tr>
            <tr>
                <td>発生料金</td>
                <td>なし</td>
                <td>プラン料金の20%</td>
                <td>プラン料金の50%</td>
                <td>プラン料金の80%</td>
                <td>プラン料金の全額</td>
            </tr>
        </table>
        <p>料金詳細は登録メールアドレスに送信されます。</p>
        <div class="button-container">
            <button class="cancel-button" id="cancel-button">キャンセルする</button>
        </div>
    </div>
    <div id="myModal" class="modal">
        <div class="modal-content" style="text-align: center;">
            <span class="close">&times;</span>
            <h1>予約をキャンセルしますか?</h1>
            <h3>この操作は<span style="color: rgb(219, 71, 71);"> 取り消すことができません</span>。</h3>
            <button class="back-button" style="margin: 0px 30px;" onclick="closeModal()">戻る</button>
            <button class="cancel-button" onclick="location.href='./ReserveCancel'">キャンセルする</button>
            
        </div>
    </div>
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
        function closeModal(){
            modal.style.display = "none";
        }
    </script>
</body>
</html>