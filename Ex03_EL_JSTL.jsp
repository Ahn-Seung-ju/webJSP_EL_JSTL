<%@page import="java.util.HashMap"%>
<%@page import="kr.or.Emp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 외부 lib (JSTL) 사용 -->
<%@ taglib prefix= "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
    
<%
	Emp e = new Emp();

	e.setEmpno(2000);
	e.setEmpname("bituser");
	
	HashMap<String, String> hp = new HashMap<>();
	hp.put("data", "1004");
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>기존방식</h3>
	<%= e %><br>
	<%= e.getEmpno() %>
	<%= e.getEmpname() %>
	
	<h3>EL 출력</h3>
	EL(x): 자바 객체 출력(자바 객체에 대한 직접 접근 불가)  ${e}<br>
	EL(x): ${e.getEmpno()}<br>
	
	<h3>해결</h3>
	1.request 또는 session객체에 담기<br>
	2.JSTL 사용해서 처리 <br>
	
	<h3>JSTL(core): 변수 생성, 제어문: (자바코드 없이....)</h3>
	<c:set var = "m" value = "<%=e %>"/>
	JSTL을 사용해서 변수 m을 생성(그 변수를 출력): ${m}<br>
	
	getter 함수(권장 방버이 아님) : ${m.getEmpno()}<br>
	
	EL 출력(m.memberfield명: 자동으로 getter 호출): ${m.empno}<br>
	EL 출력(m.memberfield명: 자동으로 getter 호출): ${m.empname}<br>
	
<!--  
	EL: 출력 목적 >> 제어구조, 변수 개념 자체가 없다
	JSTL: EL을 도와서 변수, 제어구조를 사용가능...
-->
	<c:set var = "username" value = "${m.empname}"/>
	변수값 출력: ${username}<br>
	<hr>
	<h3>JSTL 변수를 만들고 scope 정의하기</h3>
	<c:set var = "job" value = "농구선수" scope = "request"/>
	당신의 직업은 : ${job}<br>
	만약에 .. include, forward 한 페이지가 있다면 그 페이지에서 EL을 사용해서 job변수가 출력 가능<br>
	<hr>
	<c:set var = "job2" value = "야구선수" scope = "request"/><br>
	값 출력: ${job2}<br>
	
	만든 변수 삭제 기능(잘 쓰지 않는다)<br>
	<c:remove var = "job2"/>
	job2 변수 삭제: ${job2	}<br>
	hp 객체(직접 접근): ${hp}<br>
	<c:set var = "vhp" value = "<%= hp %>"/>
	hp 객체: ${vhp}<br>		<!--  {data=1004} 오버라이딩 -->
	hp 객체: ${vhp.data}<br>
	
	<!--  
		hp.put("color","red");
		JSTL 통해서 가능 하지만 잘 사용하지 않는
	-->
	<c:set target= "${vhp}" property = "color" value = "red"/>
	hp 객체: ${vhp}<br> <!-- {data=1004, color=red} -->
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>