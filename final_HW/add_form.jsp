<%--컴퓨터학과/20220760/류소연 --%>
<%--최적화 브라우저 크롬 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addr_form.jsp</title>
<style>
	h2,#button{text-align : center;}
	table,td{
        border: 1px solid black;
		height : 30px;
		text-align:left; 
	}
	table {
    	margin-left:auto; 
   	 	margin-right:auto;
	}
</style>
</head>
<body>
	<h2>주소록 등록</h2>
	<hr>
	<form method="post" action="addr_add.jsp">
	<table>
	<tr>
		<td>이름</td>
		<td><input type=text size="25px" name="username"></td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td><input type=text size="25px" name="tel"></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input type=text size="25px" name="email"></td>
	</tr>
	<tr>
		<td>성별</td>
		<td><select name="gender">
            <option value="남" selected>남</option>
            <option value="여" >여</option></select>
        </td>
	</tr>
	<tr>
		<td>그룹</td>
		<td><select name="group">
            <option value="가족" selected>가족</option>
            <option value="친구" >친구</option>
            <option value="직장" >직장</option></select>
        </td>
	</tr>
	<tr>
		<td colspan='2' id="button"> 
			<input type="submit" value="확인">
			<input type="reset" value="취소">
		</td>
	</tr>
	</table>
	</form>
</body>
</html>