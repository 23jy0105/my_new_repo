<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <!-- 詳細情報はJavaScriptで動的に挿入されます -->
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

<script>
document.addEventListener("DOMContentLoaded", function() {
    const modal = document.getElementById("myModal");
    const detailsButtons = document.querySelectorAll(".details-button");

    // 詳細ボタンがクリックされたときの処理
    detailsButtons.forEach(button => {
    	button.addEventListener("click", function() {
    	    const planName = button.getAttribute("data-name");
    	    const fee = button.getAttribute("data-fee") || "0"; // nullを防ぐ
    	    const description = button.getAttribute("data-description") || "説明なし"; // nullを防ぐ

    	    console.log("Plan Name:", planName);
    	    console.log("Fee:", fee);
    	    console.log("Description:", description);

    	    const modalContent = modal.querySelector(".modal-content");
    	    modalContent.innerHTML = `
    	        <span class="close">&times;</span>
    	        <h2>${planName}</h2>
    	        <p>料金：¥${fee}</p>
    	        <p>${description}</p>
    	    `;
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
            link.href = "#";
            link.textContent = day;
            link.addEventListener("click", function(event) {
                event.preventDefault();
                const selectedDate = `${year}-${month + 1}-${day}`;
                window.location.href = `un02_1.html?date=${selectedDate}`;
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
        document.getElementById("current-month").textContent = `${currentYear}年 ${currentMonth + 1}月`;
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

</script>

</body>
</html>
