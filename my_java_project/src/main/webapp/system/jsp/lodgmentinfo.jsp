<%@page import="model.Reservation"%>
<%@page import="model.LodgmentRoom"%>
<%@page import="java.util.Objects"%>
<%@page import= "java.text.ParseException"%>
<%@page import= "java.text.SimpleDateFormat"%>
<%@page import= "java.util.Calendar"%>
<%@page import= "java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Reservation r = (Reservation) request.getAttribute("reserve");
LodgmentRoom lodg = (LodgmentRoom)request.getAttribute("lodgroom");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
Date date = r.getLodgmentStartDate();

// Date → Calendar に変換
Calendar calendar = Calendar.getInstance();
calendar.setTime(date);

// 2日追加
calendar.add(Calendar.DATE,r.getLodgmentDays());

// Calendar → Date に変換
Date modifiedDate = calendar.getTime();
System.out.print(calendar.getTime());
System.out.print(modifiedDate);
// SimpleDateFormat で yyyy-MM-dd にフォーマット

String formattedDateStr = sdf.format(modifiedDate);
System.out.print(formattedDateStr);
// フォーマットされた文字列を Date に変換
Date endDate = sdf.parse(formattedDateStr);


System.out.print(Integer.parseInt(lodg.getState())+"state");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../css/customer_info.css" rel="stylesheet" type="text/css">
    <title>予約情報</title>

</head>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f8f8f8;
    text-align: center;
    padding: 20px;
}

.container {
    background-color: white;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    display: inline-block;
    text-align: left;
}

h1 {
    margin-bottom: 20px;
}

.info p {
    font-size: 26px;
    margin: 5px 0;
    padding-bottom: 5px;
}

.status {
    color: green;
    font-weight: bold;
}

.back-button, .cancel-button {
    padding: 10px 15px;
    font-size: 14px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.back-button {
    padding: 8px 15px;
    margin-right: 5px;
    border: none;
    background-color: #d3d3d3;
    cursor: pointer;
    border-radius: 3px;
}
.back-button:hover {
    background-color: #999;
}

.cancel-button {
    background-color: #f08080;
    color: white;
    margin-top: 20px;
    font-weight: bold;
}

.cancel-button:hover {
    background-color: #d9534f;
}

.modal {
    display: none; /* 最初は非表示 */
    position: fixed;
    z-index: 1; /* 前面に表示 */
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.4); /* 背景色 */
    justify-content: center; /* 横方向の中央揃え */
    align-items: center; /* 縦方向の中央揃え */
}

.modal-content {
    background-color: #fff;
    margin: 15% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 60%;
}

/* 閉じるボタン */
.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}
#stay-start{
    visibility: hidden;
}
</style>
<body>
    <div class="container">
        <button class="back-button" onclick="location.href='GetLodgment'">戻る</button>
        <h1>宿泊情報</h1>
        <div class="info">
            <p><strong>予約番号：</strong><%= r.getReservationNo() %></p>
            <p><strong>ステータス：</strong><span class="status" id="output"></span></p>
            <p><strong>宿泊期間：</strong><%= date %>~<%= formattedDateStr %></p>
            <p><strong>氏名：</strong><%= r.getCustomerName() %>(<%= r.getCustomerNameKana() %>)</p>
            <p><strong>宿泊人数：</strong><%= lodg.getLodgmentCount() %></p>
            <p><strong>食事時間:</strong>朝食<%= (String)request.getAttribute("am") %>夕食<%=(String)request.getAttribute("pm") %></p>
            <p><strong>アレルギー：</strong><% if(Objects.nonNull(request.getAttribute("count"))){out.print(request.getAttribute("count")+"人");}else{out.print("なし");} %></p>
        </div>
        <!--<button class="cancel-button">予約をキャンセルする</button>-->
    </div>
</body>
<script>
        function updateDisplay() {
            const output = document.getElementById("output");
			const value = <%=Integer.parseInt(lodg.getState())%>;

            switch (value) {
                case 1:
                    output.innerHTML = "チェックイン済み";
                    output.style.color = "green";
                    break;
                case 2:
                    output.innerHTML = "チェックアウト済み";
                    output.style.color = "red";
                    break;
                
                default:
                    output.innerHTML = "不明";
                    output.style.color = "black";
                    output.style.backgroundColor = "gray";
                    break;
            }
        }
        window.onload = updateDisplay;
    </script>
</html>