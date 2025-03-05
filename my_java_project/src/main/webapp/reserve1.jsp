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
                    <input type="text" id="last-name" name="lastName" required  placeholder="漢字、ひらがな、カタカナ、アルファベットを入力してください。">
                </div>
                <div class="form-group">
                    <label for="first-name" style="width: 85px;">名</label>
                    <input type="text" id="first-name" name="firstName" required placeholder="漢字、ひらがな、カタカナ、アルファベットを入力してください。">
                </div>
            </div>
            <div class="form-group-inline">
                <div class="form-group">
                    <label for="last-kana">せい</label>
                    <input type="text" id="last-kana" name="lastKana"  required placeholder="ひらがな、アルファベットを入力してください。">
                </div>
                <div class="form-group">
                    <label for="first-kana" style="width: 85px;">めい</label>
                    <input type="text" id="first-kana" name="firstKana" required placeholder="ひらがな、アルファベットを入力してください。">
                </div>
            </div>
            <div class="form-group">
                <label for="email">メールアドレス</label>
                <input type="email" id="email" name="email" required placeholder="メールアドレスを入力してください。">
            </div>
            <div class="form-group">
                <label for="postal-code">郵便番号</label>
                <input type="text" id="postal-code" name="postalCode" required pattern="^\d{3}-\d{4}$|^\d{7}$" placeholder="郵便番号を入力してください。">
            </div>
            <div class="form-group">
                <label for="phone">電話番号</label>
                <input type="tel" id="phone" name="phone" required placeholder="電話番号を入力してください。(半角数字)">
            </div>
            <div class="form-group">
                <label for="prefecture">都道府県</label>
                <select id="prefecture" name="prefecture" required>
                    <option value="">選択</option>
                    <option value="hokkaido">北海道</option>
                    <option value="aomori">青森県</option>
                    <option value="iwate">岩手県</option>
                    <option value="miyagi">宮城県</option>
                    <option value="akita">秋田県</option>
                    <option value="yamagata">山形県</option>
                    <option value="fukushima">福島県</option>
                    <option value="ibaraki">茨城県</option>
                    <option value="tochigi">栃木県</option>
                    <option value="gunma">群馬県</option>
                    <option value="saitama">埼玉県</option>
                    <option value="chiba">千葉県</option>
                    <option value="tokyo">東京都</option>
                    <option value="kanagawa">神奈川県</option>
                    <option value="niigata">新潟県</option>
                    <option value="toyama">富山県</option>
                    <option value="ishikawa">石川県</option>
                    <option value="fukui">福井県</option>
                    <option value="yamanashi">山梨県</option>
                    <option value="nagano">長野県</option>
                    <option value="gifu">岐阜県</option>
                    <option value="shizuoka">静岡県</option>
                    <option value="aichi">愛知県</option>
                    <option value="mie">三重県</option>
                    <option value="shiga">滋賀県</option>
                    <option value="kyoto">京都府</option>
                    <option value="osaka">大阪府</option>
                    <option value="hyogo">兵庫県</option>
                    <option value="nara">奈良県</option>
                    <option value="wakayama">和歌山県</option>
                    <option value="tottori">鳥取県</option>
                    <option value="shimane">島根県</option>
                    <option value="okayama">岡山県</option>
                    <option value="hiroshima">広島県</option>
                    <option value="yamaguchi">山口県</option>
                    <option value="tokushima">徳島県</option>
                    <option value="kagawa">香川県</option>
                    <option value="ehime">愛媛県</option>
                    <option value="kochi">高知県</option>
                    <option value="fukuoka">福岡県</option>
                    <option value="saga">佐賀県</option>
                    <option value="nagasaki">長崎県</option>
                    <option value="kumamoto">熊本県</option>
                    <option value="oita">大分県</option>
                    <option value="miyazaki">宮崎県</option>
                    <option value="kagoshima">鹿児島県</option>
                    <option value="okinawa">沖縄県</option>
                </select>
            </div>
            <div class="form-group">
                <label for="address">住所</label>
                <input type="text" id="address" required name="address" placeholder="住所を入力してください。">
            </div>
            <div class="form-group">
                <label for="building">建物名</label>
                <input type="text" id="building" name = "building" placeholder="">
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
                <select id="allergy" name="allergy">
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
         		<select id="roomAllergy1" name="roomArrergy1">
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
         		<select id="roomAllergy2" name="roomArrergy2">
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
         		<select id="roomAllergy3" name="roomArrergy3">
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
         		<select id="roomAllergy4" name="roomArrergy4">
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
         		<select id="roomAllergy5" name="roomArrergy5">
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