<%@page import="model.Plan"%>
<%@page import="model.Meal"%>
<%@page import="java.util.Objects"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    Plan p = (Plan)session.getAttribute("plan");
    ArrayList<Meal> mlist = (ArrayList<Meal>)session.getAttribute("meallist");
    %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>宿泊プラン登録</title>
    <style>
        body ,form{
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: space-between;
            padding: 20px;
        }
        .form-container {
            width: 60%;
        }
        .side-container {
            width: 35%;
        }
        h2 {
            font-size: 1.5em;
            font-weight: bold;
            margin-bottom: 10px;
        }
        input, textarea, select, button {
            display: block;
            width: 100%;
            margin-bottom: 20px;
            padding: 10px;
            font-size: 1.2em;
        }
        textarea {
            height: 150px;
        }
        button {
            width: 48%;
            display: inline-block;
            padding: 15px;
            font-size: 1.2em;
        }
    </style>
</head>
<body>
<form method="get" post="../../AddPlan">
    <div class="form-container">
        <h2>プラン名:</h2>
        <input type="text" id="plan-name" name="plan-name" ">
        
        <h2>概要:</h2>
        <textarea id="summary" name="summary"></textarea>
        
        <h2>詳細:</h2>
        <textarea id="details" name="details" ></textarea>
        
        <h2>値段:</h2>
        <input type="text" id="price" name="price" ">
    </div>
    
    <div class="side-container">
        <h2>開始期間:</h2>
        <input type="date" id="start-date" name="start-date"">
        
        <h2>終了期間:</h2>
        <input type="date" id="end-date" name="end-date"">
        
        <h2>部屋の種類:</h2>
        <select id="room-type" name="room-type"">
            <option value="0">和室</option>
            <option value="1">洋室</option>
            <option value="2">スイートルーム</option>
            <option value="3">露天風呂付</option>
        </select>
        
        <h2>食事の種類:</h2>
        <select id="meal-type" name="meal-type" onchange="toggleDinnerOptions()">
            <option value="breakfast" selected>朝食のみ</option>
            <option value="dinner">夕食のみ</option>
            <option value="both">朝食・夕食付き</option>
            <option value="none">食事なし</option>
        </select>

        <h2 for="dinner-options" id="dinner-label" style="display: none;">夕食のメニュー：</h2>
    <select id="dinner-options" style="display: none;">
    <%for(Meal m:mlist){ %>
       <%if(Integer.parseInt(m.getMealNo())>100&&i==2&&!"000".equals(m.getMealNo())){ %> <option value="<%=m.getMealNo()%>"><%=m.getMealName()%></option><%} %>
       <%if(Integer.parseInt(m.getMealNo())<100&&i==1&&!"000".equals(m.getMealNo())){ %> <option value="<%=m.getMealNo()%>"><%=m.getMealName()%></option><%} %>
        <%} %>
    </select>
    

    <script>
        function toggleDinnerOptions() {
            let mealPlanSelect = document.getElementById("meal-type");
            let dinnerSelect = document.getElementById("dinner-options");
            let dinnerLabel = document.getElementById("dinner-label");

            if (mealPlanSelect.value === "dinner" || mealPlanSelect.value === "both") {
                dinnerSelect.style.display = "inline-block";
                dinnerLabel.style.display = "inline-block";

            } else {
                dinnerSelect.style.display = "none";
                dinnerLabel.style.display = "none";
            }

            if (mealPlanSelect.value === "dinner" ) {
                <%i=1;%>
            }else if( mealPlanSelect.value === "both"){
            	<%i=2;%>
               }
        }

        document.getElementById('summary').value = '<%= p.getPlanOverview() %>';
        document.getElementById('details').value = '<%= p.getPlanDescription() %>';
    </script>


        <h2>画像ファイル</h2>
        <input type="file">

        
        <button onclick="location.href='planlist'" type="button">戻る</button>
        <button type="submit"">登録</button>
        </form>
    </div>
</body>
</html>
