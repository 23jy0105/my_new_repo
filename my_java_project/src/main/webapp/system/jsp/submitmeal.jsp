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
            <%}else if("1".equals(request.getAttribute("flag"))){%>
            alert("変更に失敗しました。\n(再読み込み後にやり直してください。)");
            <%}else if("3".equals(request.getAttribute("flag"))){%>
            alert("削除しました");
            <%}else if("2".equals(request.getAttribute("flag"))){%>
            alert("追加しました");
            <%}%>
            window.location.href = "../../meallist.jsp";
        };
    </script>
</body>
</html>