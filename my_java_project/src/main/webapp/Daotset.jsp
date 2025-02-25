<%@page import="model.Meal"%>
<%@page import="dao.MealDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    MealDao dao  = new MealDao();
ArrayList<Meal> mlist = dao.findAll();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	for (Meal m:mlist) {
		%>
		
			<p><%=m.getMealNo()%></p>
			<p><%=m.getMealName()%></p>
			<p><%=m.getAllergen()%></p>
			<p><%=m.getMealImage()%></p>
		
		<%
		}
dao.connectionClose();
		%>
</body>
</html>