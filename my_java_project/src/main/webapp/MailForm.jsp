<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>メールを送信する</title>
</head>
<body>
	<h1>メールの送信</h1>
	<form method="post" action="MailSend">
		<table>
			<tr>
				<td>宛先：</td>
				<td><input type="email" name="to" required></td>
			</tr>
			<tr>
				<td>件名：</td>
				<td><input type="text" name="subject"></td>
			</tr>
			<tr>
				<td>本文：</td>
				<td><textarea name="body" rows="10" cols="80"></textarea></td>
			</tr>
			<tr>
		</table>
		<input type="submit" value="メール送信">
	</form>
</body>
</html>