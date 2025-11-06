<%--컴퓨터학과/20220760/류소연 --%>
<%--최적화 브라우저 크롬 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addr_add.jsp</title>
<style>
	h2, p{text-align : center;}
</style>
</head>
<body>
	<h2>등록내용</h2><p>
	<% request.setCharacterEncoding("UTF-8"); %>
	
	이름 : ${param.username}<br><p>
	전화번호 : ${param.tel}<br><p>
	이메일 : ${param.email}<br><p>
	성별 : ${param.gender}<br><p>
	그룹 : ${param.group}<br><p>
	
	<jsp:useBean id= "addr" class="jspbook.pr32.AddrBean" scope="page"/>
	<jsp:setProperty name="addr" property="username"/>	
	<jsp:setProperty name="addr" property="tel"/>	
	<jsp:setProperty name="addr" property="email"/>	
	<jsp:setProperty name="addr" property="gender"/>	
	<jsp:setProperty name="addr" property="group"/>	
	
	<jsp:useBean id= "addrList" class="jspbook.pr32.AddManager" scope="application"/>
	<% addrList.add(addr);	
	   application.setAttribute("addrList", addrList); %>
	
	<hr><p>
	<a href = add_form.jsp>주소 추가</a>	&nbsp;&nbsp;&nbsp;
	<a href = addr_list.jsp>전체 목록 보기</a>&nbsp;&nbsp;&nbsp;
	<a href = addr_list_group.jsp>그룹별 목록 보기</a>
</body>
</html>