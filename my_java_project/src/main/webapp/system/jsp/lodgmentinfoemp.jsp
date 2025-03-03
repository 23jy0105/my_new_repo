
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../css/customer_info.css" rel="stylesheet" type="text/css">
    <title>予約情報</title>

</head>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f8f8f8;
    text-align: center;
    padding: 20px;
}

.container {
    background-color: white;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    display: inline-block;
    text-align: left;
}

h1 {
    margin-bottom: 20px;
}

.info p {
    font-size: 26px;
    margin: 5px 0;
    padding-bottom: 5px;
}

.status {
    color: green;
    font-weight: bold;
}

.back-button, .cancel-button {
    padding: 10px 15px;
    font-size: 14px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.back-button {
    padding: 8px 15px;
    margin-right: 5px;
    border: none;
    background-color: #d3d3d3;
    cursor: pointer;
    border-radius: 3px;
}
.back-button:hover {
    background-color: #999;
}

.cancel-button {
    background-color: #f08080;
    color: white;
    margin-top: 20px;
    font-weight: bold;
}

.cancel-button:hover {
    background-color: #d9534f;
}

.modal {
    display: none; /* 最初は非表示 */
    position: fixed;
    z-index: 1; /* 前面に表示 */
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.4); /* 背景色 */
    justify-content: center; /* 横方向の中央揃え */
    align-items: center; /* 縦方向の中央揃え */
}

.modal-content {
    background-color: #fff;
    margin: 15% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 60%;
}

/* 閉じるボタン */
.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}
#stay-start{
    visibility: hidden;
}
</style>
<body>
    <div class="container">
        <button class="back-button" onclick="location.href='../../GetLodgment'">戻る</button>
        <h1>空室です。</h1>
       
        <!--<button class="cancel-button">予約をキャンセルする</button>-->
    </div>
</body>

</html>