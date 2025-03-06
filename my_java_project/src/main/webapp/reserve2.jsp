<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.ArrayList" %>
    <%@page import="model.ReservationInfo" %>
    <%@ page import="model.Plan" %>
    <%ReservationInfo info = (ReservationInfo)session.getAttribute("info"); %>
    <%ArrayList<Plan> plan =(ArrayList<Plan>)session.getAttribute("plan");%>
    <%ArrayList<String> roomCount = (ArrayList<String>)session.getAttribute("roomCount") ;%>
    <%ArrayList<String> allergyCount = (ArrayList<String>)session.getAttribute("allergyCount") ;%>    
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
		    <div class="form-group">
		        <label>姓</label>
		        <p id="confirm-last-name"><%=info.getLastName() %></p>
		    </div>
		    <div class="form-group">
		        <label>名</label>
		        <p id="confirm-first-name"><%=info.getFirstName() %></p>
		    </div>
		    <div class="form-group">
		        <label>せい</label>
		        <p id="confirm-last-kana"><%=info.getLastKana() %></p>
		    </div>
		    <div class="form-group">
		        <label>めい</label>
		        <p id="confirm-first-kana"><%=info.getFirstKana() %></p>
		    </div>
		    <div class="form-group">
		        <label>メールアドレス</label>
		        <p id="confirm-email"><%=info.getEmail() %></p>
		    </div>
		    <div class="form-group">
		        <label>郵便番号</label>
		        <p id="confirm-postal-code"><%=info.getPostalCode() %></p>
		    </div>
		    <div class="form-group">
		        <label>都道府県</label>
		        <p id="confirm-prefecture"><%=info.getPrefecture() %></p>
		    </div>
		    <div class="form-group">
		        <label>電話番号</label>
		        <p id="confirm-phone"><%=info.getPhone() %></p>
		    </div>
		    <div class="form-group">
		        <label>住所</label>
		        <p id="confirm-address"><%=info.getAddress() %></p>
		    </div>
		    <div class="form-group">
		        <label>建物名</label>
		        <p id="confirm-building"><%=info.getBuilding() %></p>
		    </div>
		    <div class="form-group">
		        <label>人数</label>
		        <div id="confirm-people"><%=info.getPeople() %></div>
		    </div>
		    <div class="form-group">
		        <label>部屋数</label>
		        <div id="confirm-room"><%=info.getRoom() %></div>
		    </div>
		        <% for (int i =0; i < roomCount.size(); i++) { %>
                <div class="form-group">
                    <label>部屋 <%= i+1 %> の人数</label>
                    <div id="people-count"><%=roomCount.get(i) %></div>
                </div>
            <% } %>
		    <div class="form-group">
		        <label>アレルギー人数</label>
		        <div id="confirm-allergy">                    
		        <% for (int i = 0; i < roomCount.size(); i++) { %>
                        <div>部屋 <%= i+1 %>の人数<%= allergyCount.get(i) %> </div>
                    <% } %>
                 </div>
		    </div>
		   	<div class="form-group">
		        <label>日数</label>
		        <div id="confirm-room"><%=info.getStayDays() %></div>
		    </div>
		    <div class="fee-group">
		        <h2>プラン名</h2>
		        <p><%=plan.get(0).getPlanName() %></p>
		        <h2>料金</h2>
		        <p><%=plan.get(0).getFee()*info.getPeople()*info.getStayDays() %>円</p>
		    </div>
		    <div class="button-container"> 
		        <button type="button" id="edit">修正する</button>
		        <button type="button" id="confirm">確定する</button>
		    </div>
    </div>

    <script>
        // 編集ボタンで前のページに戻る
        document.getElementById('confirm').addEventListener('click',function(){
				window.location.href='./Reserve3';
            })
        
        document.getElementById('edit').addEventListener('click', function() {
            window.history.back();
        });
        const count =<%= info.getRoom()%>;
        const allergyDiv = document.getElementById("confirm-allergy");
		const allergy = <%=allergyCount.get(0)%>;
        if (count < 2) {
            allergyDiv.innerHTML = `<div>`+allergy+`</div>`;
        }
    </script>
</body>
</html>
