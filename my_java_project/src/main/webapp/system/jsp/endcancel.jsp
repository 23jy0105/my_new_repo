<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>変更</title>
</head>
<body>
<script>
        window.onload = function() {
            <% if("0".equals(request.getAttribute("flag"))){%>
            alert("変更しました。");
            <%}else{%>
            alert("変更に失敗しました。\n(再読み込み後にやり直してください。)");
            <%}%>
            window.location.href = "reservationinfo";
        };
    </script>
</body>
</html>