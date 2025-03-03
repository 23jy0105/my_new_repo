<%@page import="java.util.ArrayList"%>
<%@page import="model.LodgmentRoom"%>
<%@page import="java.util.Objects"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%!
public String colorChange(int i){
	if(Objects.isNull(i)){
		return "room empty";
	}
	
	if(i == 1){
		return "room check-in";
	}else if(i == 2){
		return "room check-out";
	}else{
		return "room empty";
	}
}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="../css/lodgment.css" rel="stylesheet" type="text/css">

<title>部屋のステータス</title>

<%
ArrayList<LodgmentRoom> list = (ArrayList<LodgmentRoom>) session.getAttribute("roomList");
%>

</head>
<body>
	<div class="legend">
		<span style="color: green;">緑：チェックイン</span> <span style="color: red;">赤：チェックアウト済み</span>
		<span style="color: gray;">灰：空室</span>
	</div>
	<button class="top-button" onclick="location.href='toppage.jsp'">トップに戻る</button>
<form method="get" action="../../LodgmentInfo">
	<div class="room-container">
		<div class="floor-title">1階</div>
		<div class="rooms">
		
			<button type="submit" value="0" name="no"><div
					class="<%=colorChange(Integer.parseInt(list.get(0).getState()))%>">
					<strong style="font-size: 24px">101</strong><br><%= list.get(0).getReservationNo() %>
				</div></button> <button type="submit" name="no" value="1" name="no"><div class="<%=colorChange(Integer.parseInt(list.get(1).getState())) %>">
					<strong style="font-size: 24px">102</strong><br><%= list.get(1).getReservationNo() %>
				</div></button> <button type="submit" name="no" value="2" name="no"><div class="<%=colorChange(Integer.parseInt(list.get(2).getState())) %>">
					<strong style="font-size: 24px">103</strong><br><%= list.get(2).getReservationNo() %>
				</div></button> <button type="submit" name="no" value="3" name="no"><div class="<%=colorChange(Integer.parseInt(list.get(3).getState())) %>">
					<strong style="font-size: 24px">105</strong><br><%= list.get(3).getReservationNo() %>
				</div></button> <button type="submit" name="no" value="4" name="no"><div class="<%=colorChange(Integer.parseInt(list.get(4).getState())) %>">
					<strong style="font-size: 24px">106</strong><br><%= list.get(4).getReservationNo() %>
				</div></button>
		</div>
		<div class="rooms">
			<button type="submit" value="5" name="no"><div class="<%=colorChange(Integer.parseInt(list.get(5).getState())) %>">
					<strong style="font-size: 24px">107</strong><br><%= list.get(5).getReservationNo() %>
				</div></button> <button type="submit" name="no" value="6"><div class="<%=colorChange(Integer.parseInt(list.get(6).getState())) %>">
					<strong style="font-size: 24px">108</strong><br><%= list.get(6).getReservationNo() %>
				</div></button> <button type="submit" name="no" value="7"><div class="<%=colorChange(Integer.parseInt(list.get(7).getState())) %>">
					<strong style="font-size: 24px">110</strong><br><%= list.get(7).getReservationNo() %>
				</div></button> <button type="submit" name="no" value="8" name="no"><div class="<%=colorChange(Integer.parseInt(list.get(8).getState())) %>">
					<strong style="font-size: 24px">111</strong><br><%= list.get(8).getReservationNo() %>
				</div></button> <button type="submit" name="no" value="9" name="no"><div class="<%=colorChange(Integer.parseInt(list.get(9).getState())) %>">
					<strong style="font-size: 24px">112</strong><br><%= list.get(9).getReservationNo() %>
				</div></button>
		</div>
	</div>

	<div class="room-container">
		<div class="floor-title">2階</div>
		<div class="rooms">
			<button type="submit" name="no" value="10"><div class="<%=colorChange(Integer.parseInt(list.get(10).getState())) %>">
					<strong style="font-size: 24px">201</strong><br><%= list.get(10).getReservationNo() %>
				</div></button> <button type="submit" name="no" value="11"><div class="<%=colorChange(Integer.parseInt(list.get(11).getState())) %>">
					<strong style="font-size: 24px">202</strong><br><%= list.get(11).getReservationNo() %>
				</div></button> <button type="submit" name="no" value="12"><div class="<%=colorChange(Integer.parseInt(list.get(12).getState())) %>">
					<strong style="font-size: 24px">203</strong><br><%= list.get(12).getReservationNo() %>
				</div></button> <button type="submit" name="no" value="13"><div class="<%=colorChange(Integer.parseInt(list.get(13).getState())) %>">
					<strong style="font-size: 24px">205</strong><br><%= list.get(13).getReservationNo() %>
				</div></button> <button type="submit" name="no" value="14"><div class="<%=colorChange(Integer.parseInt(list.get(14).getState())) %>">
					<strong style="font-size: 24px">206</strong><br><%= list.get(14).getReservationNo() %>
				</div></button>
		</div>
		<div class="rooms">
			<button type="submit" name="no" value="15"><div class="<%=colorChange(Integer.parseInt(list.get(15).getState())) %>">
					<strong style="font-size: 24px">207</strong><br><%= list.get(15).getReservationNo() %>
				</div></button> <button type="submit" name="no" value="16"><div class="<%=colorChange(Integer.parseInt(list.get(16).getState())) %>">
					<strong style="font-size: 24px">208</strong><br><%= list.get(16).getReservationNo() %>
				</div></button> <button type="submit" name="no" value="17"><div class="<%=colorChange(Integer.parseInt(list.get(17).getState())) %>">
					<strong style="font-size: 24px">210</strong><br><%= list.get(17).getReservationNo() %>
				</div></button> <button type="submit" name="no" value="18"><div class="<%=colorChange(Integer.parseInt(list.get(18).getState())) %>">
					<strong style="font-size: 24px">211</strong><br><%= list.get(18).getReservationNo() %>
				</div></button> <button type="submit" name="no" value="19"><div class="<%=colorChange(Integer.parseInt(list.get(19).getState())) %>">
					<strong style="font-size: 24px">212</strong><br><%= list.get(19).getReservationNo() %>
				</div></button>

		</div>
	</div>
	</form>
</body>

<script>
setInterval(function() {
	 window.location.href = "../../GetLodgment";
}, 10000);

</script>
</html>