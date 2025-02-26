<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>予約フォーム</title>
    <link rel="stylesheet" href="./css/search.css">
</head>
<body>
    <header class="header">
        <div class="container">
            <nav class="nav">
                <ul class="nav-menu-left" id="nav-menu-left">
                    <li><a href="./index.html" style="font-size: 26px; font-weight: bold; margin-left: 50px;">千景</a></li>
                </ul>
                <ul class="nav-menu-right" id="nav-menu-right">
                    <li><a href="./un01_1.html" style="font-weight: bold; margin-right: 50px;">宿泊予約</a></li>
                </ul>
            </nav>
        </div>
    </header>
    <main>
        <div style="margin: 20px 40px;">
        <h1>宿泊予約</h1>
        <div class="form-container">
            <div class="form-select-top">
                <div class="form-row">
                    <label for="stay-days">宿泊日数</label>
                    <select id="stay-days" name="stay-days">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                </div>
                <div class="form-row">
                    <label for="people-count">人数</label>
                    <select id="people-count" name="people-count">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                </div>
                <div class="form-row">
                    <label for="room-count">部屋数</label>
                    <select id="room-count" name="room-count">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                </div>
                <button type="button" id="search-button" class="button">検索</button>

            </div>
            <div class="form-select-bottom">
                <div class="form-row">
                    <div class="radio-group">
                        <input type="radio" id="date-not-specified" name="date" value="not-specified" checked>
                        <label for="date-not-specified" id="date-select">日付未定</label>
                        <input type="radio" id="date-specified" name="date" value="specified">
                        <label for="date-specified" id="date-select">日付を指定する</label>
                        <div id="stay-start">(宿泊開始日)</div>
                        <input type="date" id="date-picker" name="date-picker" disabled>                       
                    </div>

                </div>
                <div class="form-row">
                    <select id="sort-options" name="sort-options">
                        <option value="default">並び替え</option>
                        <option value="price-asc">価格の安い順</option>
                        <option value="price-desc">価格の高い順</option>
                    </select>
                </div>
            </div>




        </div></div>
    </main>
    <script>
        const dateNotSpecified = document.getElementById('date-not-specified');
        const dateSpecified = document.getElementById('date-specified');
        const datePicker = document.getElementById('date-picker');
        const dateStart = document.getElementById('stay-start');
        const search = document.getElementById('search-button');

        dateNotSpecified.addEventListener('change', () => {
            datePicker.disabled = true;
            datePicker.style.visibility = "hidden";
            dateStart.style.visibility = "hidden";
        });

        dateSpecified.addEventListener('change', () => {
            datePicker.disabled = false;
            datePicker.style.visibility = "visible";
            dateStart.style.visibility = "visible";
        });

        search.addEventListener('click',function(event){
        	event.preventDefault();
        	const day = document.getElementById('stay-days').value;
        	const people = document.getElementById('people-count').value;
        	const roomcount = document.getElementById('room-count').value;
            const date = datePicker.value;  // 宿泊開始日
            const sortOption = document.getElementById('sort-options').value; // 並び順
            
            // クエリパラメータを作成
            let queryParams = `?day=${day}&people=${people}&roomcount=${roomcount}`;
            
            if (dateSpecified.checked && date) {
                queryParams += `&date=${date}`;
            }
            
            if (sortOption !== "default") {
                queryParams += `&sort=${sortOption}`;
            }
            
            // 遷移先のURL（例えば `search-results.jsp` に遷移）
            location.href = `search.jsp${queryParams}`;
        });
         });
        
    </script>
<%@ include file="searchResult.jsp"%>