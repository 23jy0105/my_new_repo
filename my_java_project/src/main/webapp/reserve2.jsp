<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="model.Plan" %>
    <%ArrayList<String> info = (ArrayList<String>)session.getAttribute("info"); %>
    <%ArrayList<Plan> plan =(ArrayList<Plan>)session.getAttribute("plan");%>
    
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
                <p id="confirm-last-name"><%=info.get(0) %></p>
            </div>
            <div class="form-group">
                <label>名</label>
                <p id="confirm-first-name"><%=info.get(1) %></p>
            </div>
            <div class="form-group">
                <label>せい</label>
                <p id="confirm-last-kana"><%=info.get(2) %></p>
            </div>
            <div class="form-group">
                <label>めい</label>
                <p id="confirm-first-kana"><%=info.get(3) %></p>
            </div>
            <div class="form-group">
                <label>メールアドレス</label>
                <p id="confirm-email"><%=info.get(4) %></p>
            </div>
            <div class="form-group">
                <label>郵便番号</label>
                <p id="confirm-postal-code"><%=info.get(5) %></p>
            </div>
            <div class="form-group">
                <label>都道府県</label>
                <p id="confirm-prefecture"><%=info.get(6) %></p>
            </div>
            <div class="form-group">
                <label>電話番号</label>
                <p id="confirm-phone"><%=info.get(7) %></p>
            </div>
            <div class="form-group">
                <label>住所</label>
                <p id="confirm-address"><%=info.get(8) %></p>
            </div>
            <div class="form-group">
                <label>建物名</label>
                <p id="confirm-building"><%=info.get(9) %></p>
            </div>
            <div  class="form-group">
                <label>人数</label>
                <div id="confirm-people"><%=info.get(10) %></div>
            </div>
            <div class="form-group">
                <label>部屋数</label>
                <div id="confirm-room"><%=info.get(11) %></div>
            </div>
            <div class="form-group">
                <label>アレルギー人数</label>
                <div id="confirm-allergy"><%=info.get(12) %></div>
            </div>
            <div class="fee-group">
                <h2>プラン名</h2>
                <p><%=plan.get(0).getPlanName() %></p>
                <h2>料金</h2>
                <p><%=plan.get(0).getFee() %>円</p>
            </div>
            <div class="button-container">
                <button type="button" id="edit">修正する</button>
                <button type="submit" id="confirm">確定する</button>
            </div>
        </form>
    </div>

    <script>
        // 編集ボタンで前のページに戻る
        document.getElementById('edit').addEventListener('click', function() {
            window.history.back();
        });
    </script>
</body>
</html>
