<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//EL 스크립트 언어 (서버쪽 자원에 접근 가능 ) >> <%= 사용하지 않아도 됨
	//EL 사용한다고 해서 JAVA 객체 API를 지원하지 않는다
	
	Date today = new Date();
	request.setAttribute("day1", today);
	session.setAttribute("day2", today);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>EL 화면 출력(객체를 통해서 서버 지원 접근 가능)</h3>
	EL: ${requestScope.day1}<br>
	EL: ${day1}<br><!-- 객체명을 생략 가능 (권장하지 않는다) 객체를 명시해주는 방식을 권장한다 -->
	EL: ${sessionScope.day2}<br>

</body>
</html>