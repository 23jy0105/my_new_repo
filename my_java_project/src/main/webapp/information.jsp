<<<<<<< HEAD
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Announcement" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="javax.servlet.http.HttpSession"%>

<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>インフォメーション</title>
    <link rel="stylesheet" href="./css/styles.css">
    <link rel="stylesheet" href="./css/information.css">
</head>
<body class="background">
    <header class="header">
        <div class="container">
            <h1 class="logo">千景</h1>
            <nav class="nav">
                <button class="hamburger" id="hamburger">
                    <span class="bar"></span>
                    <span class="bar"></span>
                    <span class="bar"></span>
                </button>
                <ul class="nav-menu" id="nav-menu">
                    <li><a href="topmain.jsp">ホーム</a></li>
                    <li><a href="Search">宿泊予約</a></li>
                    <li><a href="room.jsp">客室</a></li>
                    <li><a href="Meal.jsp">お食事</a></li>
                    <li><a href="spa.jsp">温泉</a></li>
                    <li><a href="access.jsp">アクセス</a></li>
                    <li><a href="QAndA.jsp">Q&A</a></li>
                    <li><a href="Information">お知らせ</a></li>
                    <li><a href="Login.jsp">ご予約確認</a></li>
                </ul>
            </nav>
        </div>
    </header>
    <div class="center-body" style="display: inline-block; margin: 0 3%;">
        <br>
        <h1>お知らせ</h1>

        <div class="container1">
            <%
                ArrayList<Announcement> announcements = (ArrayList<Announcement>) request.getAttribute("announcements");
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
                if (announcements != null && !announcements.isEmpty()) {
                    for (Announcement a : announcements) {
            %>
            <div class="item">
                <p>
                    <% if (a.getAnnouncementImage() != null && !a.getAnnouncementImage().isEmpty()) { %>
                        <img src="<%= a.getAnnouncementImage() %>" width="200px" height="200px">
                    <% } else { %>
                        <img src="./img/no-image.png" width="200px" height="200px">
                    <% } %>
                </p>
                <h2><%= a.getTitle() %></h2>
                <%request.getSession();
        		session.setAttribute("a", a); %>
                <p>更新日 <%= dateFormat.format(a.getDate()) %></p>
                <p><a href="informationDetail.jsp">詳細</a></p>
            </div>
            <%
                    }
                } else {
            %>
            <p>お知らせはありません。</p>
            <%
                }
            %>
        </div>
    </div>

    <footer>
        <div class="foot">
            <div style="grid-column: 2/3; margin-top: 30px;">
                <h2><u>千景</u></h2>
                <br>
                <p>JR小田原駅から箱根登山線乗り換え<br>小涌谷駅から徒歩10分</p><br>
                <p>チェックイン時刻:15:00~</p>
                <p>チェックアウト時刻:~11:00</p>
                <br>
                <small>注意事項</small>
                <br>
                <strong>○温浴施設のみの利用は受け付けておりません。</strong><br><br>
                <strong>キャンセルポリシー</strong>
                <p>8日前 0%</p>
                <p>7~4日前 20%</p>
                <p>3日前 50%</p>
                <p>2~1日前 80%</p>
                <p>当日 100%</p>
                <p>不泊 100%</p>
            </div>
            <div style=" grid-column: 3/4 70px; margin: 80px 0px;">
                <p>日電旅館　株式会社</p>
                <p>神奈川県足柄下郡箱根町小涌谷503</p>
                <br>
                <p>TEL:03-3363-7761</p>
                <p>FAX:03-3363-7761</p>
                <br>
                <strong>※お問い合わせについて</strong>
                <p>お電話が大変混み合いますので</p>
                <p>メールでのお問い合わせをお願いしております。</p><br>
                <p>メールアドレス:info@tikage.jp</p>
            </div>
        </div>
    </footer>
</body>
<script>
    document.addEventListener('DOMContentLoaded', () => {
        const hamburger = document.getElementById('hamburger');
        const navMenu = document.getElementById('nav-menu');

        hamburger.addEventListener('click', () => {
            navMenu.classList.toggle('active');
        });
    });
</script>
</html>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
>>>>>>> branch 'main' of http://git@github.com/23jy0105/my_new_repo.git
