<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>checkin</title>
    <link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
    <img class="logo" src="../image/Untitled design.png" width="100" height="100">
    <div id="company_name">
    <h1>千景</h1>
    <br>
    <p>いらっしゃいませ。</p>
    <p>チェックイン用QRコードをかざしてください。</p>
    <form action="../../ReserveInquiry" id="myForm" method="get" autocomplete="off">
    	<input type="text" name="reserveid" style="opacity: 0;" id="hide" maxlength="12" autofocus oninput="checkLength()">
    	
    </form>
    <img src="../image/qr_icon.jpg" width="300" height="300">
    </div>
</body>
<script>
        function checkLength() {
            let inputBox = document.getElementById("hide");
            if (inputBox.value.length === 12) {
                document.getElementById("myForm").submit();
            }
        }
</script>
</html>