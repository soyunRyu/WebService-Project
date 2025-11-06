<%--컴퓨터학과/20220760/류소연 --%>
<%--최적화 브라우저 크롬 --%>
<%--기말과제 주제01 : 만년 달력 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>calendar.jsp</title>
<style>
	table {
    	margin-left:auto; 
   	 	margin-right:auto;
   	 	align : center;
		text-align:center;
	}
	.t2, th,td{
		border-collapse : collapse;
        border: 1px solid black;
		width : 800px;
		height : 60px;
	}
	
	.t1, th{
		width : 1000px;
		height : 60px;
		border:none;
	}
</style>
</head>
<body>
<%!
	public String parseDay(int cnt, String day){
		String s;
	
		if(cnt % 7 == 1){s = "<font color='red'>" + day + "</font>"; }
		else if(cnt % 7 == 0){s = "<font color  = 'blue'>" + day +"</font>"; }
		else {s = "<font color ='black'>"+day + "</font>"; }
	
		return s;
	}
%>
<% request.setCharacterEncoding("UTF-8"); %>	
<%
	out.println("<form method='get' action='calendar.jsp'>");

	Calendar today = Calendar.getInstance(); 
	
	int year = today.get(Calendar.YEAR);
	int Tyear = today.get(Calendar.YEAR);
	int month = today.get(Calendar.MONTH);
	int Tmonth = today.get(Calendar.MONTH);
	int Tdate = today.get(Calendar.DATE);

	//년도 선택
	String sYear = request.getParameter("YEAR");
	if (sYear != null) { year = Integer.parseInt(sYear);}
	
	//월 선택
	String sMonth = request.getParameter("MONTH");
	if(sMonth == null){ //null일때
			if(Tmonth == 0){ month = 0; }
			else if(Tmonth == 11){ month = 11; }
			else{ month = Integer.parseInt(sMonth);}
	}
	else if (0 <= Integer.parseInt(sMonth) && Integer.parseInt(sMonth) <= 11){
		month = Integer.parseInt(sMonth);
	}
	
	out.println("<table class='t1'><tr><th>");
	out.print("<a href=\"calendar.jsp?YEAR=" + (year - 1)); out.println("&MONTH=" + month + "\">" + "◀</a>");
	out.println("<b>" + year + "년");
	out.print("<a href=\"calendar.jsp?YEAR=" + (year + 1)); out.println("&MONTH=" + month + "\">" + "▶</a></th><th>");
	
	if (month == 0) {//1월 일때
		out.print("<a href=\"calendar.jsp?YEAR=" + year); out.println("&MONTH=" + (month) + "\">" + "◀</a>");
		out.println("<b>" + (month+1)+ "월");
		out.print("<a href=\"calendar.jsp?YEAR=" + year); out.println("&MONTH=" + (month+1)+ "\">" + "▶</a> </th><th>");
	}
	else if(month == 11) {//12월 일때
		out.print("<a href=\"calendar.jsp?YEAR=" + year); out.println("&MONTH=" + (month-1) + "\">" + "◀</a>");
		out.println("<b>" + (month+1)+ "월");
		out.print("<a href=\"calendar.jsp?YEAR=" + year); out.println("&MONTH=" + (month)+ "\">" + "▶</a> </th><th>");
	}
	else{
		out.print("<a href=\"calendar.jsp?YEAR=" + year); out.println("&MONTH=" + (month-1) + "\">" + "◀</a>");
		out.println("<b>" + (month+1)+ "월");
		out.print("<a href=\"calendar.jsp?YEAR=" + year); out.println("&MONTH=" + (month+1)+ "\">" + "▶</a> </th><th>");
	}
	
	//고정된 오늘 날짜
	//새로운 기능 : 오늘 날짜 선택했을 때 오늘로 돌아오기(오늘 년도와 해당하는 월로 돌아오고 오늘의 날짜에 표시한다)
	out.println("<a href=\"calendar.jsp?YEAR=" + Tyear+"&MONTH=" + Tmonth + "&CLICK=" + 1 + "\">"
		+ Tyear+"-" + (Tmonth+1)+ "-" +Tdate + "</a></th><table>");
	
	int flag = 0;
	String c = request.getParameter("CLICK");
	if(c == null){
		flag = 0;
	}
	else if(c.equals("1")){
		if(Tyear == year && Tmonth == month){
			flag = 1; //연도와 월이 같으면 칠한다
		}
	}
	 //달력 생성
	Calendar cal = Calendar.getInstance();

	cal.set(year, month, 1);
	
	int start = cal.getMinimum(Calendar.DATE);
	int end = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	int startDay = cal.get(Calendar.DAY_OF_WEEK); //시작 요일
	
	String[] DAY_OF_WEEK = {"일", "월", "화", "수", "목", "금","토"};
	
	//요일 출력
 	out.println("<table class = 't2'>");
	out.println("<tr>");
	for(int i = 0 ; i < 7 ; i++)
		out.println("<td>" + parseDay(i+1,DAY_OF_WEEK[i]) + "</td>");
	out.println("</tr>");
	
	//빈칸 출력
	int blank = 0;
	out.println("<tr>");
	for(int i = 0; i < (startDay-1); i++){
		out.println("<td> " + "&nbsp; &nbsp; &nbsp;"+"</td>");
		blank++;
	}
	
	//날짜 출력
	int day = 1;
	int cnt = blank + 1; 
	int count = blank; //한 주씩 나타내기 위한 변수
	for(int i = 0 ; i < end; i ++){
		if(flag == 1 && day == Tdate){
			out.println("<td style='background-color: #ffe08c'>" + parseDay(cnt + i, Integer.toString(day))+ "</td>");}
		else{
			out.println("<td>" + parseDay(cnt + i, Integer.toString(day))+ "</td>");}
		day++;
		count++;
		
		if(count % 7 == 0)
			out.println("</tr><tr>");
	}
	
	//남은 빈칸 출력
	int endTable = 7 - (count % 7);
	if(endTable != 7){
		for(int i = 0; i < endTable; i++)
			out.println("<td> " + "&nbsp; &nbsp; &nbsp;"+"</td>");
	}
	
	out.println("</tr></table></form>");
%>
</body>
</html>