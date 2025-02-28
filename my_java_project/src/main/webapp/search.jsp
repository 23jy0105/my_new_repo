<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="model.Plan" %>
	<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>予約フォーム</title>
    <link rel="stylesheet" href="./css/search.css">
</head>
<body>
    <header class="header">
        <div class="container">
            <nav class="nav">
                <ul class="nav-menu-left" id="nav-menu-left">
                    <li><a href="./index.html" style="font-size: 26px; font-weight: bold; margin-left: 50px;">千景</a></li>
                </ul>
                <ul class="nav-menu-right" id="nav-menu-right">
                    <li><a href="./un01_1.html" style="font-weight: bold; margin-right: 50px;">宿泊予約</a></li>
                </ul>
            </nav>
        </div>
    </header>
    <main>
        <div style="margin: 20px 40px;">
        <h1>宿泊予約</h1>
        <div class="form-container">
        <form method="get" action="./SearchResult">
            <div class="form-select-top">
                <div class="form-row">
                    <label for="stay-days">宿泊日数</label>
                    <select id="stay-days" name="stay-days">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                </div>
                <div class="form-row">
                    <label for="people-count">人数</label>
                    <select id="people-count" name="people-count">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                </div>
                <div class="form-row">
                    <label for="room-count">部屋数</label>
                    <select id="room-count" name="room-count">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                </div>
                <button type="submit" id="search-button" class="button">検索</button>

            </div>
            <div class="form-select-bottom">
                <div class="form-row">
                    <div class="radio-group">
                        <input type="radio" id="date-not-specified" name="date" value="not-specified" checked>
                        <label for="date-not-specified" id="date-select">日付未定</label>
                        <input type="radio" id="date-specified" name="date" value="specified">
                        <label for="date-specified" id="date-select">日付を指定する</label>
                        <div id="stay-start">(宿泊開始日)</div>
                        <input type="date" id="date-picker" name="date-picker" disabled>                       
                    </div>

                </div>
                <div class="form-row">
                    <select id="sort-options" name="sort-options">
                        <option value="default">並び替え</option>
                        <option value="price-asc">価格の安い順</option>
                        <option value="price-desc">価格の高い順</option>
                    </select>
                </div>
            </div>

</form>


        </div></div>

<%
    ArrayList<Plan> plans = (ArrayList<Plan>) request.getAttribute("plans");
%>
<h2>検索結果</h2>
<div class="result">
    <%
    if (plans != null && !plans.isEmpty()) {
        for(Plan p : plans){
            %>
            <div class="result-item">
                <div class="result-image">
                    <img src="<%= p.getPlanImage() %>" width="100px" height="100px" alt="プラン画像">
                </div>
                <div class="result-details">
                    <h2><%= p.getPlanName() %></h2>
                    <h3>概要</h3>
                    <p>料金 <%= p.getFee() %></p>
                    <p><%= p.getPlanOverview() %></p>
                </div>
                <div class="detail-button">
                    <button class="details-button" data-name="<%= p.getPlanName() %>" data-fee="<%= p.getFee() %>" data-description="<%= p.getPlanDescription().replaceAll("\"", "&quot;").replaceAll("\n", " ") %>">詳細</button>
                    <button class="reserve-button">予約</button>
                </div>
            </div>
            <%
        }
    } else {
        out.println("<p>検索結果はありません。</p>");
    }
    %>
</div>
    <div id="myModal" class="modal" style="display:none;">
    <div class="modal-content">
        <span class="close">&times;</span>
        
    </div>
</div>
<div id="calendar-container">
    <div class="nav-buttons">
        <button id="prev">◀ 前の月</button>
        <h2 id="current-month"></h2>
        <button id="next">次の月 ▶</button>
    </div>
    <div id="calendar"></div>
    <button id="close-calendar">閉じる</button>        
</div>
</main>
<script>
document.addEventListener("DOMContentLoaded", function() {
    const modal = document.getElementById("myModal");
    const detailsButtons = document.querySelectorAll(".details-button");

    // 詳細ボタンがクリックされたときの処理
    detailsButtons.forEach(button => {
    	button.addEventListener("click", function() {
    	    let planName = button.getAttribute("data-name");
    	    let fee = button.getAttribute("data-fee") ; 
    	    let description = button.getAttribute("data-description");

    	    console.log("Plan Name:", planName);
    	    console.log("Fee:", fee);
    	    console.log("Description:", description);

    	    const modalContent = modal.querySelector(".modal-content");
    	    modalContent.innerHTML = 
    	        "<span class=\"close\">&times;</span>"
    	        +"<h2>"+planName+"</h2>"
    	        +"<p>料金："+fee+"</p>"
    	        +"<p>詳細："+description+"</p>"
    	    ;
            modal.style.display = "block";

            // ここで新しく追加された close ボタンを取得してイベントを設定
            modal.querySelector(".close").addEventListener("click", function() {
                modal.style.display = "none";
            });
        });
    });

    // モーダル外をクリックした場合にモーダルを閉じる
    window.addEventListener("click", function(event) {
        if (event.target === modal) {
            modal.style.display = "none";
        }
    });

    // カレンダーの操作（予約ボタン）
    const reserveButtons = document.querySelectorAll(".reserve-button");
    reserveButtons.forEach(button => {
        button.addEventListener("click", () => {
            document.getElementById("calendar-container").style.display = "block";
        });
    });

    // カレンダーの閉じるボタン
    document.getElementById("close-calendar").addEventListener("click", function() {
        document.getElementById("calendar-container").style.display = "none";
    });

    // 以前・次の月に遷移
    let currentYear = new Date().getFullYear();
    let currentMonth = new Date().getMonth();

    function createCalendar(year, month) {
        const daysInMonth = new Date(year, month + 1, 0).getDate();
        const firstDay = new Date(year, month, 1).getDay();
        const calendar = document.createElement("table");
        calendar.innerHTML = "<tr><th>日</th><th>月</th><th>火</th><th>水</th><th>木</th><th>金</th><th>土</th></tr>";

        let row = document.createElement("tr");
        for (let i = 0; i < firstDay; i++) {
            row.appendChild(document.createElement("td"));
        }

        for (let day = 1; day <= daysInMonth; day++) {
            const cell = document.createElement("td");
            const link = document.createElement("a");
            link.href = "#"+"`"+year+"-"+(month+1)+"-"+day+"`";
            link.textContent = day;
            link.addEventListener("click", function(event) {
                event.preventDefault();  // クリック時にページ遷移を防ぐ

                const stayDays = document.getElementById("stay-days").value;
                const people = document.getElementById("people-count").value;
                const room = document.getElementById("room-count").value;
                const selectedDate ="`"+year+"-"+(month+1)+"-"+day+"`";

                // フォームを作成してPOSTリクエストを送信
                const form = document.createElement("form");
                form.method = "POST";
                form.action = "Reserve1"; // Reserve1 サーブレットに遷移

                // フォームにパラメータを追加
                const inputStayDays = document.createElement("input");
                inputStayDays.type = "hidden";
                inputStayDays.name = "stayDays";
                inputStayDays.value = stayDays;
                form.appendChild(inputStayDays);

                const inputPeople = document.createElement("input");
                inputPeople.type = "hidden";
                inputPeople.name = "people";
                inputPeople.value = people;
                form.appendChild(inputPeople);

                const inputRoom = document.createElement("input");
                inputRoom.type = "hidden";
                inputRoom.name = "room";
                inputRoom.value = room;
                form.appendChild(inputRoom);

                const inputDate = document.createElement("input");
                inputDate.type = "hidden";
                inputDate.name = "date";
                inputDate.value = selectedDate;
                form.appendChild(inputDate);

                // フォームを送信
                document.body.appendChild(form);
                form.submit();
            });

            cell.appendChild(link);
            row.appendChild(cell);

            if ((firstDay + day) % 7 === 0) {
                calendar.appendChild(row);
                row = document.createElement("tr");
            }
        }

        if (row.children.length > 0) {
            calendar.appendChild(row);
        }

        return calendar;
    }

    function updateCalendar() {
        document.getElementById("current-month").textContent = currentYear+"年"+(currentMonth + 1)+"月";
        document.getElementById("calendar").innerHTML = "";
        document.getElementById("calendar").appendChild(createCalendar(currentYear, currentMonth));
    }

    document.getElementById("prev").addEventListener("click", function() {
        currentMonth--;
        if (currentMonth < 0) {
            currentMonth = 11;
            currentYear--;
        }
        updateCalendar();
    });

    document.getElementById("next").addEventListener("click", function() {
        currentMonth++;
        if (currentMonth > 11) {
            currentMonth = 0;
            currentYear++;
        }
        updateCalendar();
    });

    updateCalendar();
});
document.addEventListener("DOMContentLoaded", function() {
    const dateNotSpecified = document.getElementById('date-not-specified');
    const dateSpecified = document.getElementById('date-specified');
    const datePicker = document.getElementById('date-picker');
    const dateStart = document.getElementById('stay-start');

    // "日付未定" が選択されたとき
    dateNotSpecified.addEventListener('change', () => {
        if (dateNotSpecified.checked) {
            datePicker.disabled = true;
            datePicker.style.visibility = "hidden";
            dateStart.style.visibility = "hidden";
        }
    });

    // "日付を指定する" が選択されたとき
    dateSpecified.addEventListener('change', () => {
        if (dateSpecified.checked) {
            datePicker.disabled = false;
            datePicker.style.visibility = "visible";
            dateStart.style.visibility = "visible";
        }
    });
});
</script>

</body>
</html>
