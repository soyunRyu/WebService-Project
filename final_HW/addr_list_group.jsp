<%--컴퓨터학과/20220760/류소연 --%>
<%--최적화 브라우저 크롬 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	div{text-align : center;}
	table,td{
        border: 1px solid black;
		text-align:left; 
		width : 700px;
		text-align : center;
	}
	table {
    	margin-left:auto; 
   	 	margin-right:auto;
	}
</style>
<title>addr_list_group.jsp</title>
</head>
<body>
	<div><h2>주소록(그룹별 보기)</h2>
	<hr>
	<a href = add_form.jsp>주소추가</a> &nbsp;&nbsp;&nbsp;
	<a href = addr_list.jsp>전체 목록 보기</a><p>
	
	<jsp:useBean id= "addrList" class="jspbook.pr32.AddManager" scope="application"/>
	
	<% 
		Set<String> groupNames = addrList.groupIs();
		for(String group : groupNames){
			out.println("<h2>그룹 : " + group + "</h2>");%>
			<table>
			<tr>
				<td>이름</td>
				<td>전화번호</td>
				<td>이메일</td>
				<td>성별</td>
				<td>그룹</td>
			</tr>
			<% out.println(addrList.printByGroup(group));%>
			</table>
	<% 		
		}
	%>
	</div>
</body>
</html>
