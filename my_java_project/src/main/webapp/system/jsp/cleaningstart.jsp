<%@page import="model.LodgmentRoom"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
 LodgmentRoom room = (LodgmentRoom)session.getAttribute("room");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>清掃中</title>
<style>
body {
	margin: 0;
	font-family: Arial, sans-serif;
}

header {
	margin: 10px 20px; /* ヘッダーに余白を追加 */
}

.back-button {
	background-color: #818181;
	border: none;
	padding: 5px 10px;
	cursor: pointer;
	margin: 50px 50px 0 0;
}

.cleaned-button {
	background-color: #818181;
	border: none;
	padding: 5px 10px;
	cursor: pointer;
	margin: 50px 0 0 0; /* 右と下に余白を追加 */
}

.container {
	margin-top: 100px; /* ヘッダーと重ならないようにする */
	margin: 20px;
	background-color: #ccc;
	padding: 20px;
}

#confirmSection {
	display: none; /* 初めは非表示 */
}
</style>
</head>
<body>
	<main>
		<div class="container">
			<div id="initialButton">
				<p>部屋番号 <%= room.getRoomNumber() %> 清掃中</p>
				<p>清掃を開始しました</p>
				<p>清掃後、清掃完了を選択してください</p>
				<p>中断する場合は戻るを選択してください</p>
				<button class="back-button"
					onclick="location.href='../../EndCleaning?state=0'">戻る</button>
				<button class="cleaned-button" onclick="showConfirmButtons()">清掃完了</button>
			</div>
			<div id="confirmSection">
				<p>部屋番号 <%= room.getRoomNumber() %> 清掃中</p>
				<p>清掃を完了しますか？</p>
				<button class="back-button" onclick="goBack()">戻る</button>
				<button class="cleaned-button" onclick="location.href='../../EndCleaning?state=1'">確定</button>

			</div>


		</div>
	</main>
</body>
<script>
	function showConfirmButtons() {
		document.getElementById("initialButton").style.display = "none"; // 最初のボタンを非表示
		document.getElementById("confirmSection").style.display = "block"; // 確定・戻るボタンを表示
	}

	function goBack() {
		document.getElementById("confirmSection").style.display = "none"; // 確定・戻るボタンを非表示
		document.getElementById("initialButton").style.display = "block"; // 最初のボタンを再表示
	}
</script>
</html>