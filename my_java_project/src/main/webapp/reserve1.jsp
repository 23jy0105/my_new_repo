<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.ReservationInfo" %>
<% ReservationInfo searchInfo =(ReservationInfo) session.getAttribute("searchInfo"); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>お客様情報フォーム</title>
	<link rel ="stylesheet" href="./css/reserve1.css">
</head>
<body>
<div class="progress-container">
        <div class="progress-bar">
            <div class="progress-bar-fill"></div>
        </div>
        <div class="progress-step active">
            <div class="circle">1</div>
            <span>お客様情報</span>
        </div>
        <div class="progress-step">
            <div class="circle">2</div>
            <span>入力確認</span>
        </div>
        <div class="progress-step">
            <div class="circle">3</div>
            <span>予約確定</span>
        </div>
    </div>

    <div class="form-container">
        <form id="customer-form" method="post"action="Reserve2">
            <div class="form-group-inline">
                <div class="form-group">
                    <label for="last-name">姓</label>
                    <input type="text" id="last-name" name="lastName" required  pattern="^[^0-9!@#$%^&*()_+=-]*$" maxlength="50" placeholder="漢字、ひらがな、カタカナ、アルファベットを入力してください。">
                </div>
                <div class="form-group">
                    <label for="first-name" style="width: 85px;">名</label>
                    <input type="text" id="first-name" name="firstName" required pattern="^[^0-9!@#$%^&*()_+=-]*$" maxlength="50" placeholder="漢字、ひらがな、カタカナ、アルファベットを入力してください。">
                </div>
            </div>
            <div class="form-group-inline">
                <div class="form-group">
                    <label for="last-kana">せい</label>
                    <input type="text" id="last-kana" name="lastKana"  required pattern="^[^0-9!@#$%^&*()_+=-]*$" maxlength="50" placeholder="ひらがな、アルファベットを入力してください。">
                </div>
                <div class="form-group">
                    <label for="first-kana" style="width: 85px;">めい</label>
                    <input type="text" id="first-kana" name="firstKana" required pattern="^[^0-9!@#$%^&*()_+=-]*$" maxlength="50" placeholder="ひらがな、アルファベットを入力してください。">
                </div>
            </div>
            <div class="form-group">
                <label for="email">メールアドレス</label>
                <input type="email" id="email" name="email" required pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$"　placeholder="メールアドレスを入力してください。">
            </div>
            <div class="form-group">
                <label for="postal-code">郵便番号</label>
                <input type="text" id="postal-code" name="postalCode" required pattern="\d{7}" placeholder="郵便番号を入力してください。(ハイフンなし)">
            </div>
            <div class="form-group">
                <label for="phone">電話番号</label>
                <input type="tel" id="phone" name="phone" required pattern="\d{11,13}" maxlength="13" placeholder="電話番号を入力してください。(半角数字)">
            </div>
            <div class="form-group">
                <label for="prefecture">都道府県</label>
                <select id="prefecture" name="prefecture" required>
                    <option value="">選択</option>
                    <option value="北海道">北海道</option>
                    <option value="青森県">青森県</option>
                    <option value="岩手県">岩手県</option>
                    <option value="宮城県">宮城県</option>
                    <option value="秋田県">秋田県</option>
                    <option value="山形県">山形県</option>
                    <option value="福岡県">福島県</option>
                    <option value="茨城県">茨城県</option>
                    <option value="栃木県">栃木県</option>
                    <option value="群馬県">群馬県</option>
                    <option value="埼玉県">埼玉県</option>
                    <option value="千葉県">千葉県</option>
                    <option value="東京都">東京都</option>
                    <option value="神奈川県">神奈川県</option>
                    <option value="新潟県">新潟県</option>
                    <option value="富山県">富山県</option>
                    <option value="石川県">石川県</option>
                    <option value="福井県">福井県</option>
                    <option value="山梨県">山梨県</option>
                    <option value="長野県">長野県</option>
                    <option value="岐阜県">岐阜県</option>
                    <option value="静岡県">静岡県</option>
                    <option value="愛知県">愛知県</option>
                    <option value="三重県">三重県</option>
                    <option value="滋賀県">滋賀県</option>
                    <option value="京都府">京都府</option>
                    <option value="大阪府">大阪府</option>
                    <option value="兵庫県">兵庫県</option>
                    <option value="奈良県">奈良県</option>
                    <option value="和歌山県">和歌山県</option>
                    <option value="鳥取県">鳥取県</option>
                    <option value="島根県">島根県</option>
                    <option value="岡山県">岡山県</option>
                    <option value="広島県">広島県</option>
                    <option value="山口県">山口県</option>
                    <option value="徳島県">徳島県</option>
                    <option value="香川県">香川県</option>
                    <option value="愛媛県">愛媛県</option>
                    <option value="高知県">高知県</option>
                    <option value="福岡県">福岡県</option>
                    <option value="佐賀県">佐賀県</option>
                    <option value="長崎県">長崎県</option>
                    <option value="熊本県">熊本県</option>
                    <option value="大分県">大分県</option>
                    <option value="宮崎県">宮崎県</option>
                    <option value="鹿児島県">鹿児島県</option>
                    <option value="沖縄県">沖縄県</option>
                </select>
            </div>
            <div class="form-group">
                <label for="address">住所</label>
                <input type="text" id="address" pattern=".{3,70}" required name="address" placeholder="住所を入力してください。">
            </div>
            <div class="form-group">
                <label for="building">建物名</label>
                <input type="text" id="building" pattern=".{0,70}" name = "building" placeholder="">
            </div>
            <p id="caution">
                ＊食事は以下のアレルギー品目を含みます<br>
                卵・乳・小麦・そば・落花生(ピーナッツ)・えび・かに・くるみ
            </p>
            <p id="caution">
                ＊アレルギーの方への食事提供はいたしません。<br>
　              金額は変わらないのでご了承ください。
            </p>
            <div class="allergy">
                <label for="allergy">アレルギーの方の人数を選択してください</label>
                <select id="allergy" name="roomAllergy1">
                    <option value="0">0</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
            </div>
 <div id="room-people-container"style="display: flex; gap: 20px; flex-wrap: wrap;">
    <div class="room-people" id="room-1">
        <label for="room-1-people">部屋 1 の人数</label>
                <select id="roomPeople1" name="roomPeople1">
                    <option value="0">0</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
         <label for="room1-allergy">部屋１のアレルギー</label>
         		<select id="roomAllergy1" name="roomAllergy1">
                    <option value="0">0</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
         		</select>
    </div>
    <div class="room-people" id="room-2">
        <label for="room-2-people">部屋 2 の人数</label>
                <select id="roomPeople2" name="roomPeople2">
                    <option value="0">0</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
                  <label for="room2-allergy">部屋2のアレルギー</label>
         		<select id="roomAllergy2" name="roomAllergy2">
                    <option value="0">0</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
         		</select>
    </div>
    <div class="room-people" id="room-3">
        <label for="room-3-people">部屋 3 の人数</label>
                       <select id="roomPeople3" name="roomPeople3">
                    <option value="0">0</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
                         <label for="room3-allergy">部屋3のアレルギー</label>
         		<select id="roomAllergy3" name="roomAllergy3">
                    <option value="0">0</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
         		</select>
    </div>
    <div class="room-people" id="room-4">
        <label for="room-4-people">部屋 4 の人数</label>
                        <select id="roomPeople4" name="roomPeople4">
                    <option value="0">0</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
                         <label for="room4-allergy">部屋4のアレルギー</label>
         		<select id="roomAllergy4" name="roomAllergy4">
                    <option value="0">0</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
         		</select>
    </div>
    <div class="room-people" id="room-5">
        <label for="room-5-people">部屋 5 の人数</label>
                <select id="roomPeople5" name="roomPeople5">
                    <option value="0">0</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
            <label for="room4-allergy">部屋5のアレルギー</label>
         		<select id="roomAllergy5" name="roomAllergy5">
                    <option value="0">0</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
         		</select>
    </div>
</div>
                <!-- hidden fields -->
		    <input type="hidden" name="stayDays" value="<%= searchInfo.getStayDays() %>">
		    <input type="hidden" name="people" value="<%= searchInfo.getPeople() %>">
		    <input type="hidden" name="room" value="<%= searchInfo.getRoom() %>">
		    <input type="hidden" name="planNum" value="<%= searchInfo.getPlanNum() %>">
            
            <input type="submit" id="submit" value="入力">
        </form>
    </div>
<script>
document.addEventListener("DOMContentLoaded", function() {
    const submitButton = document.getElementById("submit");
    if (submitButton) {
        submitButton.style.position = "relative";
        submitButton.style.marginTop = "20px";
        submitButton.style.display = "block";
    }

    const roomCount = parseInt("<%= searchInfo.getRoom() %>", 10);  // JSPから取得した値を変数にセット
    // すべての部屋の `div` を取得
    const rooms = document.querySelectorAll(".room-people");

    // roomCount に応じて表示・非表示を切り替え
    rooms.forEach((room, index) => {
        if (index < roomCount && roomCount > 1) {
            room.style.display = "block";
        } else {
            room.style.display = "none";  // それ以降は非表示
        }
    });

    const allergyDiv = document.querySelector(".allergy");

    if (roomCount > 1) {
        allergyDiv.innerHTML = ``;  // アレルギーの選択肢を非表示
    }
});
</script>
</body>
</html>