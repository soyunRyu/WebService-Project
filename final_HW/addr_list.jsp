<%--컴퓨터학과/20220760/류소연 --%>
<%--최적화 브라우저 크롬 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<div><h2>주소록(전체보기)</h2>
	<hr>
	<a href = add_form.jsp>주소추가</a> &nbsp;&nbsp;&nbsp;
	<a href = addr_list_group.jsp>그룹별 목록 보기</a> <p>
	
	<jsp:useBean id= "addrList" class="jspbook.pr32.AddManager" scope="application"/>
	
		<% 
		int rpp = 3;
		int allpage = addrList.getAddrList().size();
		
		String sindex = request.getParameter("sindex");
		int currentPage = 0;
		int start = 0;
		int end = 0;
		if(sindex == null){ //처음화면
			currentPage = 1;
			start = 0;
			if(allpage <= rpp){
				end = allpage;}
			else{
				end = rpp;}
		}
		else{
			currentPage = Integer.parseInt(sindex);
			start = rpp * (currentPage -1);
			if(allpage < (rpp * currentPage)){
				end = allpage;}
			else{
				end = (rpp * currentPage);}
		} %>
		
	<table>
		<tr>
			<td>이름</td>
			<td>전화번호</td>
			<td>이메일</td>
			<td>성별</td>
			<td>그룹</td>
		</tr>
		<% out.println(addrList.printList(start, end));%>
	</table>

	<!-- 페이지 번호 출력 리팩토링 -->
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<c:set var="allpage2" value = "<%= addrList.getAddrList().size()%>"/>
	<c:set var="rpp2" value = "3"/>
	<c:set var="currentPage2" value="<%=currentPage %>" />
	
	<p>
	<c:choose>
    <c:when test="${allpage2 % rpp2 != 0}">
        <c:forEach var="i" begin="1" end="${allpage2 / rpp2 + 1}">
            <c:choose>
                <c:when test="${i == currentPage2}">
                    ${currentPage2} |
                </c:when>
                <c:otherwise>
                    <a href="addr_list.jsp?sindex=${i}">${i}</a> |
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </c:when>
    <c:otherwise>
        <c:forEach var="i" begin="1" end="${allpage2 / rpp2}">
            <c:choose>
                <c:when test="${i == currentPage2}">
                    ${currentPage2} |
                </c:when>
                <c:otherwise>
                    <a href="addr_list.jsp?sindex=${i}">${i}</a> |
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </c:otherwise>
	</c:choose>

</div>
</body>
</html>

<%--
	<% 
		int rpp = 3;
		int allpage = addrList.getAddrList().size();
		
		String sindex = request.getParameter("sindex");
		int currentPage = 0;
		int start = 0;
		int end = 0;
		if(sindex == null){ //처음화면
			currentPage = 1;
			start = 0;
			if(allpage <= rpp){
				end = allpage;}
			else{
				end = rpp;}
		}
		else{
			currentPage = Integer.parseInt(sindex);
			start = rpp * (currentPage -1);
			if(allpage < (rpp * currentPage)){
				end = allpage;}
			else{
				end = (rpp * currentPage);}
		} %>
		
	<table>
		<tr>
			<td>이름</td>
			<td>전화번호</td>
			<td>이메일</td>
			<td>성별</td>
			<td>그룹</td>
		</tr>
		<% out.println(addrList.printList(start, end));%>
	</table>
	
	<%//페이지 번호 출력
		if(allpage % rpp !=  0){ //배수가 아닐때
			for(int i = 1 ; i <= (allpage / rpp + 1) ; i++){
				if(i == currentPage){ out.println(currentPage + " | "); }
				else{out.println("<a href = \"addr_list.jsp?sindex=" + (i)+ "\">" + (i) + "</a> | ");}
			}
		}
		else{
			for(int i = 1 ; i <= (allpage / rpp); i++){
				if(i == currentPage){out.println(currentPage + " | "); }
				else{out.println("<a href = \"addr_list.jsp?sindex=" + (i)+ "\">" + (i) + "</a> | ");}
			}
		}
	%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<c:set var="allpage2" value = "<%= addrList.getAddrList().size()%>"/>
	<c:set var="rpp2" value = "3"/>
	<c:set var="currentPage2" value="<%=currentPage %>" />
	
	<p>
	<c:choose>
    <c:when test="${allpage2 % rpp2 != 0}">
        <c:forEach var="i" begin="1" end="${allpage2 / rpp2 + 1}">
            <c:choose>
                <c:when test="${i == currentPage2}">
                    ${currentPage2} |
                </c:when>
                <c:otherwise>
                    <a href="addr_list.jsp?sindex=${i}">${i}</a> |
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </c:when>
    <c:otherwise>
        <c:forEach var="i" begin="1" end="${allpage2 / rpp2}">
            <c:choose>
                <c:when test="${i == currentPage2}">
                    ${currentPage2} |
                </c:when>
                <c:otherwise>
                    <a href="addr_list.jsp?sindex=${i}">${i}</a> |
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </c:otherwise>
	</c:choose>
	
--%>