<%@page import="model.Reservation"%>
<%@page import="model.Plan"%>
<%@page import="java.util.Objects"%>
<%@page import= "java.text.ParseException"%>
<%@page import= "java.text.SimpleDateFormat"%>
<%@page import= "java.util.Calendar"%>
<%@page import= "java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Reservation r = (Reservation) session.getAttribute("result");

Date date = r.getLodgmentStartDate();

// Date → Calendar に変換
Calendar calendar = Calendar.getInstance();
calendar.setTime(date);

// 2日追加
calendar.add(Calendar.DATE,r.getLodgmentDays());

// Calendar → Date に変換
Date modifiedDate = calendar.getTime();

// SimpleDateFormat で yyyy-MM-dd にフォーマット
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
String formattedDateStr = sdf.format(modifiedDate);

// フォーマットされた文字列を Date に変換
Date endDate = sdf.parse(formattedDateStr);
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
        <button class="back-button" onclick="location.href='sarchreservation'" type="button">戻る</button>
        <h1>予約情報</h1>
        <div class="info">
            <p><strong>予約番号：</strong><%= r.getReservationNo() %></p>
            <p><strong>ステータス：</strong><span class="status" id="output"></span></p>
            <p><strong>予約プラン：</strong><%= request.getAttribute("planname") %></p>
            <p><strong>宿泊期間：</strong><%= date %>~<%= endDate %></p>
            <p><strong>氏名：</strong><%= r.getCustomerName() %>(<%= r.getCustomerNameKana() %>)</p>
            <p><strong>電話番号：</strong><%= r.getPhoneNumber() %></p>
            <p><strong>郵便番号:</strong><%=r.getPostalCode() %></p>
            <p><strong>住所：</strong><%= r.getAddress()%></p>
        </div>
        
        <%if("0".equals(r.getReservationState())||"3".equals(r.getReservationState())){
        	
        	%><button class="cancel-button" type="button">予約をキャンセルする</button><%
        } %>
        
    </div>
    
    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h1 id="output2"></h1>
            <h3>この操作により、この予約は<span id="output3"></span>に変更されます。</h3>
            <button class="back-button" style="margin: 0px 30px;" onclick="closeModal()" type="button">戻る</button>
            <form method="get" post="../../ReservationCancel">
            <input type="hidden" name="state" value="<%=r.getReservationState()%>">
            <input type="hidden" name="num" value="<%=r.getReservationNo()%>">
            <button class="cancel-button" type="submit">キャンセルする</button></form>
            
        </div>
    </div>
</body>
<script>
        function updateDisplay() {
        	const output = document.getElementById("output");
        	const output2 = document.getElementById("output2");
        	const output3 = document.getElementById("output3");
			const value = <%=r.getReservationState()%>;

            switch (value) {
                case 0:
                    output.innerHTML = "予約済み";
                    output.style.color = "green";
                    output2.innerHTML = "予約をキャンセルしますか?";
                    output3.innerHTML = "キャンセル(未払い)";
                    output3.style.color = "color: #d9534f";
                    break;
                case 1:
                    output.innerHTML = "チェックイン済み";
                    output.style.color = "orange";
                    break;
                case 2:
                    output.innerHTML = "チェックアウト済み";
                    output.style.color = "rgb(0, 174, 255)";
                    break;
                case 3:
                    output.innerHTML = "キャンセル(未払い)";
                    output.style.color = "color: #d9534f";
                    output2.innerHTML = "支払いを取り消しますか?"
                    output3.innerHTML = "キャンセル(支払済み)";
                    output3.style.color = "rgb(116, 116, 116)";
                    break;
                case 4:
                    output.innerHTML = "キャンセル(支払済み)";
                    output.style.color = "rgb(116, 116, 116)";
                    break;
                default:
                    output.innerHTML = "不明";
                    output.style.color = "black";
                    output.style.backgroundColor = "gray";
                    break;
            }
        }


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
</html>