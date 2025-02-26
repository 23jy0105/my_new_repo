<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<footer>
    <div class="foot">
        <div style="grid-column: 2/3; margin-top: 30px;">
            <h2><u>千景</u></h2>
            <p>JR小田原駅から箱根登山線乗り換え<br>小涌谷駅から徒歩10分</p>
            <p>チェックイン時刻:15:00~</p>
            <p>チェックアウト時刻:~11:00</p>
            <strong>○温浴施設のみの利用は受け付けておりません。</strong><br>
            <strong>キャンセルポリシー</strong>
            <p>8日前 0%</p><p>7~4日前 20%</p><p>3日前 50%</p><p>2~1日前 80%</p>
            <p>当日 100%</p><p>不泊 100%</p>
        </div>
        <div style=" grid-column: 3/4 70px; margin: 80px 0px;">
            <p>日電旅館　株式会社</p>
            <p>神奈川県足柄下郡箱根町小涌谷503</p>
            <p>TEL:03-3363-7761</p>
            <p>メール: info@tikage.jp</p>
        </div>
    </div>
</footer>
<script>
    document.addEventListener('DOMContentLoaded', () => {
        const hamburger = document.getElementById('hamburger');
        const navMenu = document.getElementById('nav-menu');
        hamburger.addEventListener('click', () => {
            navMenu.classList.toggle('active');
        });
    });
</script>
</body>
</html>