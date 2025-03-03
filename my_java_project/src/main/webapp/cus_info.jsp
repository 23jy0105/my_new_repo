<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.Reservation"%>
<%@page import="model.Plan"%>
<%@page import="model.LodgmentInformation" %>
<%@page import="dao.ReservationDao"%>
<%@page import="dao.PlanDao"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Objects"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList" %>
<%@page import="com.google.zxing.BarcodeFormat"%>
<%@page import="com.google.zxing.EncodeHintType"%>
<%@page import="com.google.zxing.WriterException"%>
<%@page import="com.google.zxing.MultiFormatWriter"%>
<%@page import="com.google.zxing.client.j2se.MatrixToImageWriter"%>
<%@page import="com.google.zxing.common.BitMatrix"%>
<%@page import="com.google.zxing.qrcode.QRCodeWriter" %>
<%@page import="com.google.zxing.qrcode.decoder.ErrorCorrectionLevel"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.io.File"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.concurrent.ConcurrentHashMap"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="javax.servlet.RequestDispatcher"%>
<%@page import="javax.servlet.ServletException" %>
<%@page import="javax.servlet.annotation.WebServlet" %>
<%@page import="javax.servlet.http.HttpServlet" %>
<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpServletResponse" %>
<%@page import="java.io.OutputStream" %>

<%Reservation reserve = (Reservation)session.getAttribute("reserve"); %>
<%Plan plan = (Plan)session.getAttribute("plan"); %>
<%//BitMatrix bitMatrix = (BitMatrix)request.getAttribute("qrcode");%> 
   <% ReservationDao dao  = new ReservationDao(); %>
<% 	int lodgCount=0;
	ArrayList<LodgmentInformation> list = dao.findLodgment(reserve.getReservationNo());
	for(LodgmentInformation lodg:list){
		lodgCount =+ lodg.getLodgmentCount();
	}

%>
<!DOCTYPE html>
<html lang="ja">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ご予約確認ページ</title>
    <link rel="stylesheet" href="./css/styles.css" >
    <link rel="stylesheet" href="./css/modal.css">
	<link rel="stylesheet" href="./css/cus_info"
    </style>
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
                    <li><a href="./index.html">ホーム</a></li>
                    <li><a href="./un01_1.html">宿泊予約</a></li>
                    <li><a href="./room.html">客室</a></li>
                    <li><a href="./meal.html">お食事</a></li>
                    <li><a href="./spa.html">温泉</a></li>
                    <li><a href="./access.html">アクセス</a></li>
                    <li><a href="./Q&A.html">Q&A</a></li>
                    <li><a href="./infomation.html">お知らせ</a></li>
                    <li><a href="./ur02_1.html">ご予約確認</a></li>
                </ul>
            </nav>
        </div>
    </header>
    <main>
        <div class="center-body">
        <div class="container-block" style="width: 85%; max-width: 1100px; vertical-align: top;">
        <h2 style="margin-top: 20px;  text-align: left;">ご予約プラン</h2>
        
        <figure id="blur"  style="margin-left: 0; float: left;">
        <img src="./img/DXroom.png" alt="plan-img" height="200px" id="blur">
        </figure>
        <div>
        <h3 style=" text-align: left;"><%=plan.getPlanName() %></h3>
        </div>
        <div style="padding: 10px; float: left;  text-align: left;">
            <label>予約人数:</label>
            <strong><%=lodgCount %></strong>
            <br>
            <label>宿泊予定日:</label>
            <label><%=reserve.getLodgmentStartDate() %></label>
            <string><%Calendar calendar = Calendar.getInstance();
            calendar.setTime(reserve.getLodgmentStartDate()); 
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        	Date date = new Date();%>
        	~
            <%calendar.add(Calendar.DAY_OF_MONTH,reserve.getLodgmentDays());
            Date d1 = calendar.getTime();%>
            <%=sdf.format(d1) %></string>
            <% %>
        </div>
        <button class="button"  id="cancel-button" style="width: 200px; vertical-align: -200%; margin-left: 100px;">詳細</button>
        <br>
        
    </div>

    <br>

    <div class="container-block" style="vertical-align: top; margin-top: 0;">
        <p>チェックイン用QRコード</p>
        <br>
        <img src="./GenerateQRServlet?data=<%=reserve.getReservationNo() %>" alt="qr">
        <%//QRCodeWriter qrCodeWriter = new QRCodeWriter();
        //BitMatrix bitMatrix = qrCodeWriter.encode(reserve.getReservationNo(), BarcodeFormat.QR_CODE, 300, 300);
        //OutputStream outputStream = response.getOutputStream();
        //MatrixToImageWriter.writeToStream(bitMatrix, "PNG", outputStream);
        //outputStream.close();%>
    </div>
    <div class="container-block" style="margin-top: 0; padding: 30px 50px;">
        <h2 style="margin-bottom: 20px; text-align: left;">お客様情報</h2>
        <div style="text-align: left;">
            <div style="float: left;">
            <label>姓:</label>
            <%String[] sei=reserve.getCustomerName().split(" ");
            String[] mei=reserve.getCustomerNameKana().split(" ");%>
            <strong style="margin-right: 100px;"><%=sei[0] %></strong>
            <br>
            <label>せい:</label>
            <strong style="margin-right: 100px;"><%=mei[0] %></strong>
            </div>
            <div>
            <label>名:</label>
            <strong><%=sei[1] %></strong>
            <br>
            <label>めい:</label>
            <strong><%=mei[1] %></strong>
        </div>
        <br>
        <label>登録メールアドレス:</label>
        <strong><%=reserve.getEmailAddress() %></strong>
        </div>
        <button class="button"  style="width: 300px; margin-top: 50px;" onclick="location.href='./Reserve_cancel'">予約をキャンセルする</button>
</div>
    </div>
    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2>プラン詳細</h2>
            <p><%=plan.getFee() %></p>
            <p><%=plan.getPlanDescription() %></p>
            
        </div>
    </div>
    </main>


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
    const modal = document.getElementById("myModal");
        const closeButton = document.getElementsByClassName("close")[0];
        const detailsButtons = document.querySelectorAll("#cancel-button");

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
    document.addEventListener('DOMContentLoaded', () => {
        const hamburger = document.getElementById('hamburger');
        const navMenu = document.getElementById('nav-menu');

        hamburger.addEventListener('click', () => {
            navMenu.classList.toggle('active');
            
        });
    });
</script>
</html>