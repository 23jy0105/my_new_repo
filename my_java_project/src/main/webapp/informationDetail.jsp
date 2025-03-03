<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.Announcement" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.ArrayList" %>

<%
	Announcement a =(Announcement) session.getAttribute("announcements");
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");

    if (a == null) {
%>
    <p>指定された情報は存在しません。</p>
<%
    } else {
%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= a.getTitle() %></title>
    <link rel="stylesheet" href="./css/styles.css">
</head>
<body class="background">
    <div class="center-body">
        <h1><%= a.getTitle() %></h1>
        <p>更新日: <%= dateFormat.format(a.getDate()) %></p>
        
        <% if (a.getAnnouncementImage() != null && !a.getAnnouncementImage().isEmpty()) { %>
            <img src="<%= a.getAnnouncementImage() %>" width="500px">
        <% } else { %>
            <img src="./img/no-image.png" width="500px">
        <% } %>

        <a href="Information">お知らせ一覧に戻る</a>
    </div>
</body>
</html>
<%
    }
%>
