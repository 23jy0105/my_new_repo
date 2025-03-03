<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>宿泊プラン登録確認</title>
    <style>
        body {
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
    <div class="form-container">
        <h2>プラン名:</h2>
        <a>＜2食付き＞冬の味覚堪能コース</a>
        
        <h2>概要:</h2>
        <a>栗や松茸など冬の味覚を心行くまでお楽しみいただけます。</a>
        
        <h2>詳細:</h2>
        <p>＜プラン内容＞</p>
        ・ご夕食に松葉蟹の特別コースをご提供
        ・割烹月かげ カウンター席にご案内
        ・料理長が目の前で松葉蟹をさばきます
        ・ご夕食開始のお時間は１７：３０
        ・お部屋タイプはデラックスダブルルーム

        <br>◆チェックイン◆ 15:00
        ◆チェックアウト◆ 11:00

        <br>◇ご夕食◇
        ～コース内容～　
        ・食前茶　玉露
        ・先付　　蟹茶碗蒸し
        ・前菜　　旬の山海佳肴
        ・造り　　松葉蟹と旬の鮮魚
        ・煮物　　蟹味噌のしゃぶしゃぶ
        ・焼物　　炭火焼き蟹
        ・鍋　　　松葉蟹鍋
        ・食事　　蟹の釜炊き御飯
        ・甘味　　季節の甘味と水菓子

        ※旬な食材（生きた蟹）を使用致します。天候などの影響でご用意が出来ない場合がございます。
        ※ご用意が出来なかった場合は代替コースのご案内または夕食分のご返金にて対応させていただきます。
        ※ご夕食コース内容には、ドリンクは含まれておりません。
        　ご利用の場合は別途ご注文くださいませ。利き酒師おすすめの日本酒や国産ジュースなどがございます。
        ※ご予約の変更にともなう飲食代のご返金はいたしかねますので、予めご了承くださいませ。

        <br>◇和朝食◇
        ・先付
        ・八寸・前菜
        ・焼物
        ・煮物
        ・ご飯、味噌汁、香の物
        ・果物

        朝食営業時間：7:30～10:30(L/O09:30）
        □お食事場所（朝食、夕食）：割烹 月かげ
        朝食のお時間はチェックインにいらした方から先着順でお選びいただきます。
        時間の事前予約はできませんので予めご了承くださいませ。

        <br>△子供の食事について△
        夕食：天麩羅の盛り合わせと冷たいおうどんまたはそば(低学年向け)
        　　　お子様御膳(高学年向け、オプションのページで選択可能です)
        朝食：サラダ・出し巻き卵・焼き魚・ごはん・味噌汁の5品のご提供をいたします。

        ※大人と同じ夕食・朝食ご希望の場合は事前に電話／メールにてご連絡ください。

        <br>■大浴場のご案内■
        箱根・芦ノ湖温泉の源泉から運ぶ露天風呂は、肌に良いアルカリ性単純温泉。
        女湯にはオリジナルアロマのミストサウナを、男湯にはドライサウナを併設し、
        専用庭を臨む内湯では時間の移ろいにそった音景がくつろぎの湯浴みを演出します。
        
        <h2>値段:</h2>
        <a>80000円</a>
    </div>
    
    <div class="side-container">
        <h2>開始期間:</h2>
        <input type="date" id="start-date" name="start-date" value="2025-12-01">
        
        <h2>終了期間:</h2>
        <input type="date" id="end-date" name="end-date" value="2025-03-10">
        
        <h2>部屋の種類:</h2>
        <select id="room-type" name="room-type">
            <option value="和室">和室</option>
            <option value="洋室">洋室</option>
            <option value="スイートルーム">スイートルーム</option>
            <option value="露天風呂付" selected>露天風呂付</option>
        </select>
        
        <h2>食事の種類:</h2>
        <select id="meal-type" name="meal-type">
            <option value="朝食のみ">朝食のみ</option>
            <option value="夕食のみ">夕食のみ</option>
            <option value="朝食・夕食付き" selected>朝食・夕食付き</option>
            <option value="食事なし">食事なし</option>
        </select>

        <h2>画像ファイル</h2>
        

        <button onclick="location.href='uz01_4.html'">戻る</button>
        <button type="submit" onclick="location.href='uz01_6_1.html'">登録</button>
    </div>
</body>
</html>
