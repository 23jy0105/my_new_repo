<%@page import="model.Plan"%>
<%@page import="model.Meal"%>
<%@page import="java.util.Objects"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
ArrayList<Meal> mlist = (ArrayList<Meal>) session.getAttribute("meallist");
int i = 0;
Plan p = (Plan) session.getAttribute("plan");

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
Date sdate = p.getStartTime();
Date edate = p.getEndTime();

// Date → Calendar に変換
Calendar calendar = Calendar.getInstance();
calendar.setTime(sdate);

// Calendar → Date に変換
Date modifiedDate = calendar.getTime();
System.out.print(calendar.getTime());
System.out.print(modifiedDate);
// SimpleDateFormat で yyyy-MM-dd にフォーマット

String startdate = sdf.format(modifiedDate);

calendar.setTime(edate);

//Calendar → Date に変換
modifiedDate = calendar.getTime();

String enddate = sdf.format(modifiedDate);
String str = "";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>宿泊プラン詳細</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f8f8f8;
	text-align: center;
	padding: 20px;
	display: flex;
}

.form-container {
	width: 60%;
}

.side-container {
	width: 35%;
}

h2 {
	font-size: 1.5em;
	font-weight: bold;
	margin-bottom: 10px;
}

input, textarea, select, button {
	display: block;
	width: 100%;
	margin-bottom: 20px;
	padding: 10px;
	font-size: 1.2em;
}

textarea {
	height: 150px;
}

button {
	width: 48%;
	display: inline-block;
	padding: 15px;
	font-size: 1.2em;
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

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

#stay-start {
	visibility: hidden;
}
</style>
</head>
<body>
	<form method="get" action="checkplan.jsp" enctype="multipart/form-data">
		<div class="form-container">
			<h2>プラン名:</h2>
			<input type="text" id="plan-name" name="plan-name"
				value="<%=p.getPlanName()%>"<%=str %> required>

			<h2>概要:</h2>
			<textarea id="summary" name="summary"<%=str %> required></textarea>

			<h2>詳細:</h2>
			<textarea id="details" name="details"<%=str %> required></textarea>

			<h2>値段:</h2>
			<input type="text" id="price" name="price" value="<%=p.getFee()%>"<%=str %> required>
		</div>

		<div class="side-container">
			<h2>開始期間:</h2>
			<input type="date" id="start-date" name="start-date"
				value="<%=startdate%>"<%=str %> required>

			<h2>終了期間:</h2>
			<input type="date" id="end-date" name="end-date" value="<%=enddate%>"<%=str %> required>

			<h2>部屋の種類:</h2>
			<select id="room-type" name="room-type"<%=str %>>
				<option value="0">和室</option>
				<option value="1">洋室</option>
				<option value="2">スイートルーム</option>
				<option value="3">露天風呂付</option>
			</select>

			<h2>食事の種類:</h2>
			<select id="meal-type" name="meal-type"
				onchange="toggleDinnerOptions()"<%=str %>>
				<option value="breakfast">朝食のみ</option>
				<option value="dinner">夕食のみ</option>
				<option value="both">朝食・夕食付き</option>
				<option value="none">食事なし</option>
			</select>

			<h2 for="dinner-options" id="dinner-label" style="display: none;">夕食のメニュー：</h2>
			<select id="dinner-options" style="display: none;"<%=str %>>
				<%
				for (Meal m : mlist) {
					if (Integer.parseInt(m.getMealNo()) > 100 && i == 2 && !"000".equals(m.getMealNo())) {
				%>
				<option value="<%=m.getMealNo()%>"><%=m.getMealName()%></option>
				<%
				}

				if (Integer.parseInt(m.getMealNo()) < 100 && i == 1 && !"000".equals(m.getMealNo())) {
				%>
				<option value="<%=m.getMealNo()%>"><%=m.getMealName()%></option>
				<%
				}
				}
				%>
			</select>


			<h2>画像ファイル</h2>
			<div id="toggleDiv">
			<input type="file" id="imageInput" name="image" accept="image/*" onchange="previewImage()" required/>


			<button onclick="location.href='./planlist.jsp'" type="button">戻る</button>
			<button type="button" onclick="toggleDiv()">登録</button></div>
			<div id="toggleDiv2" style="display: none;">
			<img id="preview" src="" alt="画像プレビュー" style="display:none;">
			<button onclick="toggleDiv()'" type="button">戻る</button>
			<button type="submit" >登録</button></div>
	</form>
	</div>

	<div id="toggleDiv">
	<button class="cancel-button" type="button">プランを削除する</button>
	</div>



	<div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<h1 id="output2"></h1>
			<h3>この操作により、このプランは削除されます。</h3>
			<button class="back-button" style="margin: 0px 30px;"
				onclick="closeModal()" type="button">戻る</button>
			<form method="get" action="../../DeletePlan">
				<input type="hidden" name="state"
					value="<%=Integer.parseInt(p.getPlanNo())%>">
				<button class="cancel-button" type="submit"
					onclick="location.href='../../DeletePlan'">削除する</button>
			</form>

		</div>
	</div>
</body>
<script>

function previewImage() {
    const file = document.getElementById("imageInput").files[0];
    const reader = new FileReader();
    
    reader.onload = function (e) {
        const preview = document.getElementById("preview");
        preview.src = e.target.result;  // 読み込んだ画像のURLをセット
        preview.style.display = 'block';  // プレビュー画像を表示
    };

    if (file) {
        reader.readAsDataURL(file);  // 画像を読み込む
    }
}

function toggleDiv() {
	var div = document.getElementById("toggleDiv");
	var div2 = document.getElementById("toggleDiv2");
	if (div.style.display === "none") {
		div.style.display = "block"; // 表示
		div2.style.display = "none"; // 表示
		<%str = "";%>
	} else {
		div.style.display = "none"; // 非表示
		div2.style.display = "block"; // 非表示
		<%str = " style="pointer-events: none;";%>
	}
}
		document.getElementById("room-type").value = <%=p.getRoomTypeNo()%>;

        function toggleDinnerOptions() {
            let mealPlanSelect = document.getElementById("meal-type");
            let dinnerSelect = document.getElementById("dinner-options");
            let dinnerLabel = document.getElementById("dinner-label");

            if (mealPlanSelect.value === "dinner" || mealPlanSelect.value === "both") {
                dinnerSelect.style.display = "inline-block";
                dinnerLabel.style.display = "inline-block";

            } else {
                dinnerSelect.style.display = "none";
                dinnerLabel.style.display = "none";
            }

            if (mealPlanSelect.value === "dinner" ) {
                <%i = 1;%>
            }else if( mealPlanSelect.value === "both"){
            	<%i = 2;%>
               }
        }

        document.getElementById('summary').value = '<%=p.getPlanOverview()%>';
        document.getElementById('details').value = '<%=p.getPlanDescription()%>';
        
        const modal = document.getElementById("myModal");
        const closeButton = document.getElementsByClassName("close")[0];
        const detailsButtons = document.querySelectorAll(".cancel-button");

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
        let mealValue = <%=Integer.parseInt(p.getMealNo())%>;
        let selectElement = document.getElementById("meal-type");

        if (mealValue === 100) {
            selectElement.value = "breakfast";
        } else if (mealValue === 0) {
            selectElement.value = "none";
        } else if (mealValue >= 101) {
            selectElement.value = "both";
        } else if (mealValue <= 99) {
            selectElement.value = "dinner";
        }

        let dinner = document.getElementById("meal-type");
        dinner.value = <%=p.getMealNo()%>

        window.onload = toggleDinnerOptions;
    </script>
</html>
