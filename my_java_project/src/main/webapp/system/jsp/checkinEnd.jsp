<%@page import="model.Room"%>
<%@page import="model.LodgmentInformation"%>
<%@page import="dao.RoomDao"%>
<%@page import="dao.ReservationDao"%>
<%@page import="model.Reservation"%>
<%@page import="model.Plan"%>
<%@page import="java.util.Objects"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
Reservation result = (Reservation) session.getAttribute("reserve");
Plan plan = (Plan) session.getAttribute("plan");
ReservationDao rd = new ReservationDao();
ArrayList<String> list = (ArrayList<String>) session.getAttribute("inroom");
String strPm = null;
String strAm = null;
ArrayList<Integer> allergy = (ArrayList<Integer>) session.getAttribute("allergy");
ArrayList<LodgmentInformation> lodgment = (ArrayList<LodgmentInformation>) session.getAttribute("lodgment");
%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>checked</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<img class="logo" src="../image/Untitled design.png" width="100"
		height="100">
	<div class="div1">
		<h1 class="info"><%=result.getLodgmentStartDate()%>予約
		</h1>
		<h1 class="info"><%=result.getCustomerName()%>様
		</h1>
		<h1 class="info"><%=plan.getPlanName()%></h1>
		<h1 class="info"><%=result.getLodgmentDays()%>泊<%=result.getLodgmentDays() + 1%>日
		</h1>
		<%
		if (0 == Integer.parseInt(plan.getMealNo())) {
		} else {
			System.out.print(Integer.parseInt(plan.getMealNo()) + "mealNo");
		%><a>食事時間:</a>
		<%
		if (100 < Integer.parseInt(plan.getMealNo())) {
			strPm = rd.watchTimePM(result);
			strAm = rd.watchTimeAM(result);
		%><span><a>夕食<%=strPm%>  朝食<%=strAm%></a></span>
		<%
		} else if (100 > Integer.parseInt(plan.getMealNo())) {
		strPm = rd.watchTimePM(result);
		%><a>夕食<%=strPm%></a>
		<%
		} else {
		System.out.println(rd.watchTimeAM(result));
		strAm = rd.watchTimeAM(result);
		%><a>朝食<%=strAm%></a>
		<%
		}
		}
		%>

	</div>
	<div class="div1">


		<h1>
			部屋番号は<u>
				<%
				int i = 1;
				for (String r : list) {
				%><%=r%>
				<%
				if (list.size() > i) {
					out.print(",");
					i++;
				}
				}
				%>
			</u>です。
		</h1>
		<br>

		<%
		int j = 0;

		if (result.getTotalReservationRoom() > 1) {
			System.out.print(lodgment + "ok");
			for (LodgmentInformation li : lodgment) {
		%>
		<h2><%=li.getLodgmentCount()%>名のお客様:<%=li.getRoomNo()%>号室となります。<%
		if (Objects.nonNull(li.getAllergyCount()) && li.getAllergyCount() != 0) {
			out.print("(アレルギー" + allergy.get(j) + "人)");
		}
		%>
		</h2>
		<%
		j++;

		}
		}
		%>
		<h1>ごゆっくりお過ごしください。</h1>
	</div>
</body>
<script>
		setTimeout(function() {
			window.location.href = "checkin.jsp"; // 10秒後に遷移
		}, 10000);
	</script>
</html>