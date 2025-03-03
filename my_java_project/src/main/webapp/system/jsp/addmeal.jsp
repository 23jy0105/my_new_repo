<%@page import="model.Plan"%>
<%@page import="model.Meal"%>
<%@page import="java.util.Objects"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
int i = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>食事登録</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f8f8f8;
	text-align: center;
	padding: 20px;
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
	<form method="get" post="../../AddPlan">
		<div class="form-container">
			<h2>食事名:</h2>
        <input type="text" id="meal-name" name="meal-name">
        
        <h2>アレルゲン:</h2>

    <form>
        <label><input type="checkbox" name="allergen" value="egg">卵</label><br>
        <label><input type="checkbox" name="allergen" value="milk"> 乳</label><br>
        <label><input type="checkbox" name="allergen" value="wheat"> 小麦</label><br>
        <label><input type="checkbox" name="allergen" value="soba"> そば</label><br>
        <label><input type="checkbox" name="allergen" value="peanut"> 落花生</label><br>
        <label><input type="checkbox" name="allergen" value="shrimp"> えび</label><br>
        <label><input type="checkbox" name="allergen" value="crab"> かに</label><br>
        <label><input type="checkbox" name="allergen" value="walnut"> くるみ</label><br>
        
        <br>
    
    

        
        <h2>画像ファイル:</h2>
        <input type="file">


			<button onclick="location.href='meallist'" type="button">戻る</button>
			<button type="submit"">登録</button>
	</form>
	</div>

	<button class="cancel-button" type="button">食事を削除する</button>




	<div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<h1 id="output2"></h1>
			<h3>この操作により、この食事は削除されます。</h3>
			<button class="back-button" style="margin: 0px 30px;"
				onclick="closeModal()" type="button">戻る</button>
			<form method="get" post="../../DeleteMeal">
				<input type="hidden" name="state"
					value="<%=Integer.parseInt(p.getMealNo())%>">
				<button class="cancel-button" type="submit" onclick="location.href='../../DeleteMeal'">削除する</button>
			</form>

		</div>
	</div>
</body>
<script>

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
    </script>
</html>
