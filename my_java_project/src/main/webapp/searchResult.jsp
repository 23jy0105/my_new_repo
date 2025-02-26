<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    ArrayList<Plan> plans = (ArrayList<Plan>) request.getAttribute("plans");
%>
<h2>検索結果</h2>
<div class="result">
	<div class="result-item">
		<%
		if (plans != null && !plans.isEmpty()) {
			for(Plan p:plans){
				out.println("<div class=\"result-image\">");
				out.println("<img src=\""+p.getPlanImage()+"\"width=\"100px\"height=\"100px\"alt=\"プラン画像\"></div>");
				out.println("<div class=\"result-details\">");
				out.println("<h2>"+p.getPlanName()+"</h2>");
				out.println("<h3>概要</h3>");
				out.println("<p>料金"+p.getFee()+"</p>");
				out.println("<p>"+p.getPlanOverview()+"</p></div>");
				out.println("<div class=\"result-buttons\"><button class=\"details-button\">詳細</button><button id=\"reserve-button\">予約</button></div>");
			}
		}else{
			out.println("<p>検索結果はありません。</p>");
		}
		%>
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
    </div></div>
    </main>
    <script>
        let currentYear = new Date().getFullYear();
        let currentMonth = new Date().getMonth();

        function createCalendar(year, month) {
        const daysInMonth = new Date(year, month + 1, 0).getDate();
        const firstDay = new Date(year, month, 1).getDay();
        const calendar = document.createElement("table");
        calendar.innerHTML = "<tr><th>Sun</th><th>Mon</th><th>Tue</th><th>Wed</th><th>Thu</th><th>Fri</th><th>Sat</th></tr>";
        
        let row = document.createElement("tr");
        for (let i = 0; i < firstDay; i++) {
            row.appendChild(document.createElement("td"));
        }
        
        for (let day = 1; day <= daysInMonth; day++) {
            const cell = document.createElement("td");
            
            // Create a link for the day
            const link = document.createElement("a");
            link.href = `#`;  // 例えば、"2025-2-5"のように日付をリンクにする
            link.textContent = day;
            link.addEventListener("click", (event) => {
            event.preventDefault();  // デフォルトのリンク動作を防ぐ

                const selectedDate = `${year}-${month + 1}-${day}`;  // YYYY-MM-DD 形式
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
            const container = document.getElementById("calendar");
            container.innerHTML = "";
            document.getElementById("current-month").textContent = `${currentYear}年 ${currentMonth + 1}月`;
            container.appendChild(createCalendar(currentYear, currentMonth));
        }
        document.querySelectorAll(".reserve-button").forEach(button => {button.addEventListener("click", () => {
            document.getElementById("calendar-container").style.display = "block";
            updateCalendar();
        });
    });

        document.getElementById("close-calendar").addEventListener("click", () => {
            document.getElementById("calendar-container").style.display = "none";
        });

        document.getElementById("prev").addEventListener("click", () => {
            currentMonth--;
            if (currentMonth < 0) {
                currentMonth = 11;
                currentYear--;
            }
            updateCalendar();
        });

        document.getElementById("next").addEventListener("click", () => {
            currentMonth++;
            if (currentMonth > 11) {
                currentMonth = 0;
                currentYear++;
            }
            updateCalendar();
        });
        const dateNotSpecified = document.getElementById('date-not-specified');
        const dateSpecified = document.getElementById('date-specified');
        const datePicker = document.getElementById('date-picker');
        const dateStart = document.getElementById('stay-start');

        dateNotSpecified.addEventListener('change', () => {
            datePicker.disabled = true;
            datePicker.style.visibility = "hidden";
            dateStart.style.visibility = "hidden";
        });

        dateSpecified.addEventListener('change', () => {
            datePicker.disabled = false;
            datePicker.style.visibility = "visible";
            dateStart.style.visibility = "visible";
        });
        const modal = document.getElementById("myModal");
        const closeButton = document.getElementsByClassName("close")[0];
        const detailsButtons = document.querySelectorAll(".details-button");

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
        document.querySelectorAll("#reserve-button").forEach(button => {
        button.addEventListener("click", () => {
            const stayDays = document.getElementById("stay-days").value;
            const peopleCount = document.getElementById("people-count").value;
            const roomCount = document.getElementById("room-count").value;
            localStorage.setItem("stayDays",stayDays);
            localStorage.setItem("peopleCount", peopleCount);
            localStorage.setItem("roomCount", roomCount);

            });
        });
    </script>

</body>
</html>