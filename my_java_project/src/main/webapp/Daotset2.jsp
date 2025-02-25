<%@page import="model.Reservation"%>
<%@page import="model.LodgmentInformation"%>
<%@page import="model.Announcement"%>
<%@page import="dao.ReservationDao"%>
<%@page import="dao.AnnouncementDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    ReservationDao dao  = new ReservationDao();
    AnnouncementDao dao2  = new AnnouncementDao();
ArrayList<Reservation> mlist = dao.findAllReservation();
ArrayList<LodgmentInformation> m2list = dao.findAllLodgment();
ArrayList<Announcement> m3list = dao2.findAllAnnouncement();
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
	
	for (Reservation m:mlist) {
	%>
	<label><%=m.getReservationNo()%></label>
		
			<label><%=m.getLodgmentStartDate()%></label>
<label><%=m.getLodgmentDays()%></label>
<label><%=m.getPaymentTime()%></label>
<label><%=m.getTotalReservationRoom()%></label>
<label><%=m.getReservationDate()%></label>
<label><%=m.getPlanNo()%></label>
<label><%=m.getCancelDate()%></label>
<label><%=m.getCheckInTime()%></label>
<label><%=m.getCustomerName()%></label>
<label><%=m.getCustomerNameKana()%></label>
<label><%=m.getEmailAddress()%></label>
<label><%=m.getPhoneNumber()%></label>
<label><%=m.getAddress()%></label>
<label><%=m.getPostalCode()%></label>
<label><%=m.getAllergyCount()%></label>
<label><%=m.getPassword()%></label>
<p><%=m.getMealTime()%></p>
			
			
			<%
	
	}for (LodgmentInformation m2:m2list) {
	%>
		
			<label><%=m2.getReservationNo()%></label>
<label><%=m2.getLodgmentNo()%></label>
<label><%=m2.getLodgmentCount()%></label>
<label><%=m2.getRoomNo()%></label>
<p><%=m2.getCheckOutTime()%></p>
			

<%
	
	}for (Announcement m3:m3list) {
	%>
		
			<label><%=m3.getAnnouncementNo()%></label>
<label><%=m3.getTitle()%></label>
<label><%=m3.getBody()%></label>
<label><%=m3.getAnnouncementImage()%></label>
<p><%=m3.getDate()%></p>
			


		
		<%
		}
		dao.connectionClose();
		%>
</body>
</html>