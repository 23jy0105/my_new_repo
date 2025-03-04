<%@page import="java.util.ArrayList"%>
<%@page import="model.Reservation"%>
<%@page import="java.util.Objects"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    
    ArrayList<Reservation> list = new ArrayList<Reservation>();
    if(Objects.nonNull(session.getAttribute("sarched"))){
    	list = (ArrayList<Reservation>)session.getAttribute("sarched");
    }
    %>
<%!
public String setId(int num){
	if(num==0){
		return "reserved";
	}else if(num==1){
		return "checkined";
	}else if(num==2){
		return "paid";
	}else if(num==3){
		return "cancel";
	}else{
		return "cancel-paid";
	}
}

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>予約情報確認</title>
    <link href="../css/style2.css" rel="stylesheet" type="text/css">
</head>
<body>
    <div class="header">
        <h2>予約情報確認</h2>
        <button class="button" onclick="location.href='./toppage.jsp'">トップに戻る</button>
    </div>
    
    <form method="post" action="../../SarchReservation">
    <div class="search-container">
        <label for="reservation-number">予約番号:</label>
        <input type="text" id="reservation-number" name="reservation-number">
        <input type ="hidden" value ="reserve" name="type">
        <button class="b-button" type="submit">検索</button>
    </div>
    </form>
    <form method="post" action="../../SarchReservation">
    <div class="search-container">
        <label for="reservation-number-2">電話番号:</label>
        <input type="text" id="reservation-number-2" name="phone-number">
        <input type ="hidden" value ="phone" name="type">
        <button class="b-button" type="submit">検索</button>
    </div>
    </form>
    <table>
        <tr>
        	<th></th>
            <th>予約番号</th>
            <th>氏名</th>
            <th>電話番号</th>
            <th>宿泊開始日<br><span class="small-text">YYYY/MM/DD</span></th>
            <th>ステータス</th>
            <th>/</th>
        </tr>
        <%int i = 0;
        if(Objects.nonNull(list)){
        for(Reservation r:list){%>
        <tr>
        	<td><%=i %>.</td>
            <td><%=r.getReservationNo() %></td>
            <td><%=r.getCustomerName() %></td>
            <td><%=r.getPhoneNumber() %></td>
            <td><%=r.getLodgmentStartDate() %></td>
            <td id="<%=setId(r.getReservationState())%>"></td>
            <td><button class="button" onclick="location.href='../../ReservationInfo?no=<%=r.getReservationNo()%>'">詳細</button></td>
        </tr>
        <%}if(list.size()==0&&"1".equals(session.getAttribute("flag"))){
        	%><h1 style="color: red;">一致する予約が見つかりません</h1><%
        }}%>
    </table>
</body>
<script>
        function changeText() {
            document.getElementById("reserved").innerHTML = "予約済み";
            document.getElementById("checkined").innerHTML = "チェックイン済み";
            document.getElementById("paid").innerHTML = "支払済み";
            document.getElementById("cancel").innerHTML = "キャンセル(未払い)";
            document.getElementById("cancel-paid").innerHTML = "キャンセル(支払い済み)";
        }
    </script>
</html>