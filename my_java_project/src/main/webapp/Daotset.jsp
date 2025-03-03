<%@page import="model.Room"%>
<%@page import="model.RoomType"%>
<%@page import="model.RoomRemainingCount"%>
<%@page import="dao.RoomDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    RoomDao dao  = new RoomDao();
ArrayList<Room> mlist = dao.findAllRoom();
ArrayList<RoomType> m2list = dao.roomType();
ArrayList<RoomRemainingCount> m3list = dao.findRoomRemaining();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here?</title>
<h1>aaa</h1>
</head>
<body>
<h1>aaa</h1>

	<%
	
	for (Room m:mlist) {
	%>
		
			<label><%=m.getRoomNo()%></label>
			<label><%=m.getTypeNo()%></label>
			<label><%=m.getRoomState()%></label>
			<label><%=m.getRoomKey()%></label>
			<label><%=m.getEnterRoomTime()%></label>
			<label><%=m.getKeyUpdateTime()%></label>
			<p><%=m.getSiteManagementKey()%></p>
			
			
			<%
	
	}for (RoomType m2:m2list) {
	%>
		
			<label><%=m2.getRoomType()%></label>
			<label><%=m2.getTypeName()%></label>
			<label><%=m2.getMaxAccommodation()%></label>
			<p><%=m2.getTotalRoom()%></p>
			

<%
	
	}for (RoomRemainingCount m3:m3list) {
	%>
		
			<label><%=m3.getDate()%></label>
			<label><%=m3.getRoomType()%></label>>
			<p><%=m3.getReserved()%></p>
			


		
		<%
		}
		dao.connectionClose();
		%>
</body>
</html>