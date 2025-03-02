<%@page import="java.util.ArrayList"%>
<%@page import="model.LodgmentRoom"%>
<%@page import="java.util.Objects"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%!
public String colorChange(int i){
	if(Objects.isNull(i)){
		return "room cleaned";
	}
	
	if(i == 3){
		return "room cleaning";
	}else if(i == 2){
		return "room notcleaned";
	}else{
		return "room cleaned";
	}
}


public String textChange(int i){
	if(Objects.isNull(i)){
		return "清掃済";
	}
	
	if(i == 3){
		return "清掃中";
	}else if(i == 2){
		return "未清掃";
	}else{
		return "清掃済";
	}
}

public String urlChange(int i){
	if(Objects.isNull(i)){
		return "#";
	}
	
	if(i == 3){
		return "#";
	}else if(i == 2){
		return "../../CleaningStart";
	}else{
		return "#";
	}
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="../css/lodgment.css" rel="stylesheet" type="text/css">

<title>清掃のステータス</title>

<%
ArrayList<LodgmentRoom> list = (ArrayList<LodgmentRoom>) session.getAttribute("cleaningList");
Boolean flag = (Boolean) request.getAttribute("err");
%>

</head>
<body>
	<div class="legend">
		<span style="color: blue;">青：清掃済み</span> <span style="color: orange;">橙：清掃中</span>
		<span style="color: red;">赤：未清掃</span>
	</div>
	<button class="top-button" onclick="location.href='toppage.html'">トップに戻る</button>

	<div class="room-container">
		<div class="floor-title">1階</div>
		<div class="rooms">
			<a href="<%=urlChange(Integer.parseInt(list.get(0).getState()))%>" data-no="0"><div
					class="<%=colorChange(Integer.parseInt(list.get(0).getState()))%>">
					<strong style="font-size: 24px">101</strong><br><%= textChange(Integer.parseInt(list.get(0).getState())) %>
				</div></a> <a href="<%=urlChange(Integer.parseInt(list.get(1).getState()))%>" data-no="1"><div class="<%=colorChange(Integer.parseInt(list.get(1).getState())) %>">
					<strong style="font-size: 24px">102</strong><br><%= textChange(Integer.parseInt(list.get(1).getState())) %>
				</div></a> <a href="<%=urlChange(Integer.parseInt(list.get(2).getState()))%>" data-no="2"><div class="<%=colorChange(Integer.parseInt(list.get(2).getState())) %>">
					<strong style="font-size: 24px">103</strong><br><%= textChange(Integer.parseInt(list.get(2).getState())) %>
				</div></a> <a href="<%=urlChange(Integer.parseInt(list.get(3).getState()))%>" data-no="3"><div class="<%=colorChange(Integer.parseInt(list.get(3).getState())) %>">
					<strong style="font-size: 24px">105</strong><br><%= textChange(Integer.parseInt(list.get(3).getState())) %>
				</div></a> <a href="<%=urlChange(Integer.parseInt(list.get(4).getState()))%>" data-no="4"><div class="<%=colorChange(Integer.parseInt(list.get(4).getState())) %>">
					<strong style="font-size: 24px">106</strong><br><%= textChange(Integer.parseInt(list.get(4).getState())) %>
				</div></a>
		</div>
		<div class="rooms">
			<a href="<%=urlChange(Integer.parseInt(list.get(5).getState()))%>" data-no="5"><div class="<%=colorChange(Integer.parseInt(list.get(5).getState())) %>">
					<strong style="font-size: 24px">107</strong><br><%= textChange(Integer.parseInt(list.get(5).getState())) %>
				</div></a> <a href="<%=urlChange(Integer.parseInt(list.get(6).getState()))%>" data-no="6"><div class="<%=colorChange(Integer.parseInt(list.get(6).getState())) %>">
					<strong style="font-size: 24px">108</strong><br><%= textChange(Integer.parseInt(list.get(6).getState())) %>
				</div></a> <a href="<%=urlChange(Integer.parseInt(list.get(7).getState()))%>" data-no="7"><div class="<%=colorChange(Integer.parseInt(list.get(7).getState())) %>">
					<strong style="font-size: 24px">110</strong><br><%= textChange(Integer.parseInt(list.get(7).getState())) %>
				</div></a> <a href="<%=urlChange(Integer.parseInt(list.get(8).getState()))%>" data-no="8"><div class="<%=colorChange(Integer.parseInt(list.get(8).getState())) %>">
					<strong style="font-size: 24px">111</strong><br><%= textChange(Integer.parseInt(list.get(8).getState())) %>
				</div></a> <a href="<%=urlChange(Integer.parseInt(list.get(9).getState()))%>" data-no="9"><div class="<%=colorChange(Integer.parseInt(list.get(9).getState())) %>">
					<strong style="font-size: 24px">112</strong><br><%= textChange(Integer.parseInt(list.get(9).getState())) %>
				</div></a>
		</div>
	</div>

	<div class="room-container">
		<div class="floor-title">2階</div>
		<div class="rooms">
			<a href="<%=urlChange(Integer.parseInt(list.get(10).getState()))%>" data-no="10"><div class="<%=colorChange(Integer.parseInt(list.get(10).getState())) %>">
					<strong style="font-size: 24px">201</strong><br><%= textChange(Integer.parseInt(list.get(10).getState())) %>
				</div></a> <a href="<%=urlChange(Integer.parseInt(list.get(11).getState()))%>" data-no="11"><div class="<%=colorChange(Integer.parseInt(list.get(11).getState())) %>">
					<strong style="font-size: 24px">202</strong><br><%= textChange(Integer.parseInt(list.get(11).getState())) %>
				</div></a> <a href="<%=urlChange(Integer.parseInt(list.get(12).getState()))%>" data-no="12"><div class="<%=colorChange(Integer.parseInt(list.get(12).getState())) %>">
					<strong style="font-size: 24px">203</strong><br><%= textChange(Integer.parseInt(list.get(12).getState())) %>
				</div></a> <a href="<%=urlChange(Integer.parseInt(list.get(13).getState()))%>" data-no="13"><div class="<%=colorChange(Integer.parseInt(list.get(13).getState())) %>">
					<strong style="font-size: 24px">205</strong><br><%= textChange(Integer.parseInt(list.get(13).getState())) %>
				</div></a> <a href="<%=urlChange(Integer.parseInt(list.get(14).getState()))%>" data-no="14"><div class="<%=colorChange(Integer.parseInt(list.get(14).getState())) %>">
					<strong style="font-size: 24px">206</strong><br><%= textChange(Integer.parseInt(list.get(14).getState())) %>
				</div></a>
		</div>
		<div class="rooms">
			<a href="<%=urlChange(Integer.parseInt(list.get(15).getState()))%>" data-no="15"><div class="<%=colorChange(Integer.parseInt(list.get(15).getState())) %>">
					<strong style="font-size: 24px">207</strong><br><%= textChange(Integer.parseInt(list.get(15).getState())) %>
				</div></a> <a href="<%=urlChange(Integer.parseInt(list.get(16).getState()))%>" data-no="16"><div class="<%=colorChange(Integer.parseInt(list.get(16).getState())) %>">
					<strong style="font-size: 24px">208</strong><br><%= textChange(Integer.parseInt(list.get(16).getState())) %>
				</div></a> <a href="<%=urlChange(Integer.parseInt(list.get(17).getState()))%>" data-no="17"><div class="<%=colorChange(Integer.parseInt(list.get(17).getState())) %>">
					<strong style="font-size: 24px">210</strong><br><%= textChange(Integer.parseInt(list.get(17).getState())) %>
				</div></a> <a href="<%=urlChange(Integer.parseInt(list.get(18).getState()))%>" data-no="18"><div class="<%=colorChange(Integer.parseInt(list.get(18).getState())) %>">
					<strong style="font-size: 24px">211</strong><br><%= textChange(Integer.parseInt(list.get(18).getState())) %>
				</div></a> <a href="<%=urlChange(Integer.parseInt(list.get(19).getState()))%>" data-no="19"><div class="<%=colorChange(Integer.parseInt(list.get(19).getState())) %>">
					<strong style="font-size: 24px">212</strong><br><%= textChange(Integer.parseInt(list.get(19).getState())) %>
				</div></a>

		</div>
	</div>
</body>

<script>
setInterval(function() {
	 window.location.href = "../../GetCleaning";
}, 10000);

<% if (flag != null && flag) { %>
alert("すでに清掃中です。\n(再読み込み後にやり直してください。)");
<% } %>
</script>
</html>