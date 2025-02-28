<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.ReservationInfo" %>
<% ReservationInfo info =(ReservationInfo) session.getAttribute("info"); 
	int staydays = info.getStayDays();
	int people = info.getPeople();
	int room = info.getRoom();
    String date = info.getStartDate();
%>
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
                    <input type="text" id="last-name" name="lastName"  placeholder="漢字、ひらがな、カタカナ、アルファベットを入力してください。">
                </div>
                <div class="form-group">
                    <label for="first-name" style="width: 85px;">名</label>
                    <input type="text" id="first-name" name="firstName" placeholder="漢字、ひらがな、カタカナ、アルファベットを入力してください。">
                </div>
            </div>
            <div class="form-group-inline">
                <div class="form-group">
                    <label for="last-kana">せい</label>
                    <input type="text" id="last-kana" name="lastKana" placeholder="ひらがな、アルファベットを入力してください。">
                </div>
                <div class="form-group">
                    <label for="first-kana" style="width: 85px;">めい</label>
                    <input type="text" id="first-kana" name="firstKana" placeholder="ひらがな、アルファベットを入力してください。">
                </div>
            </div>
            <div class="form-group">
                <label for="email">メールアドレス</label>
                <input type="email" id="email" name="email" placeholder="メールアドレスを入力してください。">
            </div>
            <div class="form-group">
                <label for="postal-code">郵便番号</label>
                <input type="text" id="postal-code" name="postalCode" pattern="^\d{3}-\d{4}$|^\d{7}$" placeholder="郵便番号を入力してください。">
            </div>
            <div class="form-group">
                <label for="prefecture">都道府県</label>
                <select id="prefecture" name="prefecture">
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
                <label for="phone">電話番号</label>
                <input type="tel" id="phone" name="phone" placeholder="電話番号を入力してください。(半角数字)">
            </div>
            <div class="form-group">
                <label for="address">住所</label>
                <input type="text" id="address" name="address" placeholder="住所を入力してください。">
            </div>
            <div class="form-group">
                <label for="building">建物名</label>
                <input type="text" id="building"name="building" placeholder="">
            </div>
            <div class="form-group2">
                <input type="radio" id="bookInsteadNo" name="bookInstead" value="no" onclick="toggleVisibility(false)" checked>
                <label for="bookInsteadNo">宿泊者本人の予約</label>
                <br>
                <input type="radio" id="bookInsteadYes" name="bookInstead" value="yes" onclick="toggleVisibility(true)">
                <label for="bookInsteadYes">宿泊者本人以外の予約はこちらをチェック</label>
            </div>
            <div id="extra-fields" class="hidden">
                <h3>予約者情報</h3>
                <div class="form-group-inline">
                    <div class="form-group">
                        <label for="reserver-last-name">姓</label>
                        <input type="text" id="reserver-last-name" placeholder="漢字、ひらがな、カタカナ、英語を入力してください。">
                    </div>
                    <div class="form-group">
                        <label for="reserver-first-name"  style="width: 85px;">名</label>
                        <input type="text" id="reserver-first-name" placeholder="漢字、ひらがな、カタカナ、英語を入力してください。">
                    </div>
                </div>
                <div class="form-group-inline">
                    <div class="form-group">
                        <label for="reserver-last-kana">せい</label>
                        <input type="text" id="reserver-last-kana" placeholder="ひらがなを入力してください。">
                    </div>
                    <div class="form-group">
                        <label for="reserver-first-kana"  style="width: 85px;">めい</label>
                        <input type="text" id="reserver-first-kana" placeholder="ひらがなを入力してください。">
                    </div>
                </div>
                <div class="form-group">
                    <label for="reserver-email">メールアドレス</label>
                    <input type="email" id="reserver-email" placeholder="メールアドレスを入力してください。">
                </div>
                <div class="form-group">
                    <label for="reserver-phone">電話番号</label>
                    <input type="tel" id="reserver-phone" placeholder="電話番号を入力してください。(半角数字)">
                </div>
            </div>
            <p id="caution">
                ＊食事は以下のアレルギー品目を含みます<br>
                卵・乳・小麦・そば・落花生(ピーナッツ)・えび・かに・くるみ
            </p>
            <p id="caution">
                ＊アレルギーの方への食事提供はいたしません。<br>
　              金額は変わらないのでご了承ください。
            </p>
            <div>
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
            <div id="room-count">

            </div>
            <input type="submit" id="submit" value="入力">
        </form>
    </div>
    <script>
    const roomCountContainer = document.getElementById("room-count");
    if (roomCountContainer) {
        let roomCount = localStorage.getItem("roomCount") ? parseInt(localStorage.getItem("roomCount"), 10) : 0;
        const guestCounts = JSON.parse(localStorage.getItem("guestCounts")) || [];
        roomCountContainer.innerHTML = "";

        if (roomCount >= 2) {
            for (let i = 0; i < roomCount; i++) {
                const roomDiv = document.createElement("div");
                roomDiv.classList.add("form-group");
                roomDiv.style.marginBottom = "10px"; // 部屋ごとの間隔を調整

                const label = document.createElement("label");
                label.textContent = `部屋 ${i + 1} の人数`;

                const select = document.createElement("select");
                select.name = `room-${i + 1}-guests`;
                select.id = `room-${i + 1}-guests`;
                select.style.marginLeft = "10px"; // ラベルとの間隔を調整

                for (let j = 1; j <= 5; j++) {
                    const option = document.createElement("option");
                    option.value = j;
                    option.textContent = j;
                    if (guestCounts[i] && guestCounts[i] == j) {
                        option.selected = true;
                    }
                    select.appendChild(option);
                }

                roomDiv.appendChild(label);
                roomDiv.appendChild(select);
                roomCountContainer.appendChild(roomDiv);
            }
        } else {
            roomCountContainer.style.display = "none";
        }
    }

    // 入力ボタンの位置調整
    document.addEventListener("DOMContentLoaded", function() {
        const submitButton = document.getElementById("submit");
        if (submitButton) {
            submitButton.style.position = "relative";
            submitButton.style.marginTop = "20px";
            submitButton.style.display = "block";
        }
    });
        function toggleVisibility(showExtra) {
            const extraFields = document.getElementById('extra-fields');
            const personalFields = document.getElementById('personal-fields');
            if (showExtra) {
                extraFields.classList.remove('hidden');
            } else {
                extraFields.classList.add('hidden');
            }
            
        }
      document.getElementById('customer-form').addEventListener('submit', function(event) {
    	event.preventDefault();  
        let valid = true;
        
        // フォームの各フィールドの値を取得
        const lastName = document.getElementById('last-name').value;
        const firstName = document.getElementById('first-name').value;
        const lastKana = document.getElementById('last-kana').value;
        const firstKana = document.getElementById('first-kana').value;
        const email = document.getElementById('email').value;
        const postalCode = document.getElementById('postal-code').value;
        const prefecture = document.getElementById('prefecture').value;
        const phone = document.getElementById('phone').value;
        const address = document.getElementById('address').value;
        const building = document.getElementById('building').value;
        const allergy = document.getElementById('allergy').value;
        //姓名どちらも
      if (!lastName.value) {
            valid = false;
            lastName.classList.add('err-input');

        }
      if(!firstName.value){
			valid = false;
			firstName.classList.add('err-input');
          }
      if(!lastKana.value){
          	valid = false;
            lastKana.classList.add('err-input');
          }
      if (!firstKana.value) {
          valid = false;
          firstKana.classList.add('err-input');
      }

        // 予約者情報（宿泊者本人以外の予約の場合）
        const isBookInsteadYes = document.getElementById('bookInsteadYes').checked;
        let reserverLastName = '';
        let reserverFirstName = '';
        let reserverLastKana = '';
        let reserverFirstKana = '';
        let reserverEmail = '';
        let reserverPhone = '';
        
        if (isBookInsteadYes) {
            reserverLastName = document.getElementById('reserver-last-name').value;
            reserverFirstName = document.getElementById('reserver-first-name').value;
            reserverLastKana = document.getElementById('reserver-last-kana').value;
            reserverFirstKana = document.getElementById('reserver-first-kana').value;
            reserverEmail = document.getElementById('reserver-email').value;
            reserverPhone = document.getElementById('reserver-phone').value;
        }
        const form = document.getElementById('customer-form');
        const hiddenLastName = document.createElement('input');
        hiddenLastName.type = 'hidden';
        hiddenLastName.name = 'lastName';
        hiddenLastName.value = lastName;
        form.appendChild(hiddenLastName);

        const hiddenFirstName = document.createElement('input');
        hiddenFirstName.type = 'hidden';
        hiddenFirstName.name = 'firstName';
        hiddenFirstName.value = firstName;
        form.appendChild(hiddenFirstName);
		if(valid){
			this.submit();
		}else{
			alert("エラーがあります");
			}

        });
        let staydays = <%= staydays%>;
        let people =<%= people%>;
        let room =<%= room%>;
        let date = '<%= date%>';
        console.log(staydays);
        console.log(people);
        console.log(room);
        console.log(date);
    </script>
</body>
</html>