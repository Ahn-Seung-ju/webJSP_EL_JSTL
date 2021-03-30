<%@page import="java.util.Date"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.Emp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>JSTL for</h3>
	<!--  
	
		java 코드
		int sum = 0;
		for(int i = 0; i <= 100;i++){
			sum += i;
		}
		
		for(String s : list){}
	-->
	
	<c:forEach var = "i" begin = "1" end = "10">
		<c:set var = "sum" value = "${sum + i}"></c:set>
		<b>${i}</b><br>
	</c:forEach>
	sum 누적값 : ${sum}<br>
	<c:forEach var = "i" begin = "1" end = "9">
		${i*5}<br>
	</c:forEach>
	<h3>중첩 forEach</h3>
	<table>
		<c:forEach var = "i" begin = "2" end = "9">
		<c:forEach var = "j" begin = "0" end = "9">
			<c:choose>
				<c:when test="${j== 0}">
					<tr bgcolor="gold"><th>${i}단</th></tr>
				</c:when>
				<c:otherwise>
					<tr><th>${i} * ${j} = ${i*j}</th></tr>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</c:forEach>
	</table>
	
	
	<h3>JSTL forEach 사용하기</h3>
	<%
		int[] arr = new int[]{10,20,30,40,50};
		for(int i : arr){
			out.print("출려값: <b><i>" + i + "</i></b><br>");
		}
	%>
	
	<h3>EL java 객체에 직접 접근 불가능: JSTL 통해서 접근</h3>
	arr 객체 배열에 접근 불가 : ${arr}<br>
	
	<c:set var = "intarr" value = "<%=arr %>"/>
	EL 접근 : ${arr}<br>
	<hr>
	<h3>forEach 개선된 for문</h3>
	<c:forEach var = "i" items = "${intarr}">
		배열값: ${i}<br>
	</c:forEach>
	<hr>
	<h3>단순하게</h3>
	<c:forEach var = "i" items = "<%=arr %>">
		배열값2: ${i}<br>
	</c:forEach>
	<hr>
	<h3>재미삼아서</h3>
	<c:forEach var = "i" items = "<%= new int[]{1,2,3,4,5,6} %>">
		배열값3: ${i}<br>
	</c:forEach>
	<hr>
	<h3>forEach 속성활용하기</h3>
	<c:forEach var = "i" items = "${intarr}" varStatus="status">
		index: ${status.index}&nbsp;&nbsp;&nbsp;
		count: ${status.count}&nbsp;&nbsp;&nbsp;
		value: ${i}<br>
	</c:forEach>
	<hr>
	<h3>TODAY POINT(계시판 화면 구성..)</h3>
	<%
		//사원 정보를 담는 테이블DB
		//JAVA코드: List<Emp> getEmpList(){구현코드}
		List<Emp> emplist = new ArrayList<>();
		emplist.add(new Emp(100,"A"));	
		emplist.add(new Emp(100,"B"));
		emplist.add(new Emp(100,"C"));
		
		//return emlist;
		
		//함수의 리턴값을 받아서
		for(Emp e : emplist){
			out.print(e.getEmpno() + " / " + e.getEmpname()	+ "<br>");
		}
		
		//jsp 페이지에서 테이블 태그 결합에서 예쁘게 출력
		request.setAttribute("list", emplist);
		//include, forward 된 페이지에서 ... request.getAttribute
		//EL >> request.list 가능
		
	%>
	
	<h3>계시판 데이터 출력(EL & JSTL)</h3>
	<c:set var = "list" value = "<%= emplist %>"/>
	<table border="1">
		<tr><td>사번</td><td>이름</td></tr>
		<c:forEach var = "emp" items = "${list}">
			<tr><td>${emp.empno}</td><td>${emp.empname}</td></tr>
		</c:forEach>
	</table>
	<hr>
	<h3>계시판 데이터 출력(EL & JSTL)</h3>
	<table border="1">
		<tr><td>사번</td><td>이름</td></tr>
		<c:forEach var = "emp" items = "<%= emplist %>">
			<tr><td>${emp.empno}</td><td>${emp.empname}</td></tr>
		</c:forEach>
	</table>
	<hr>
	<h3>java Map 객체 EL & JSTL 사용해서 출력</h3>
	<%
		Map<String,Object> hm = new HashMap<>();
		hm.put("name" , "hong");
		hm.put("pwd" , "1004");
		hm.put("date" , new Date());
	
	%>
	<c:set var = "hm" value = "<%=hm %>"/>
	<c:forEach var = "obj" items = "${hm}">
		${obj.key} -> ${obj.value}<br>
	</c:forEach>
	<hr>
	key: name : ${hm.name}<br>
	key: pwd : ${hm.pwd}<br>
	key: date : ${hm.date}<br>
	<hr>
	<h3>기타 옵션</h3>
	<h3>JSTL 구분자 기준 처리</h3>
	<c:forTokens var = "token" items="A.B.C.D" delims=".">
		${token}<br>
	</c:forTokens>
	<hr>
	<h3>JSTL 복합구분자 기준 처리</h3>
	<c:forTokens var = "token" items="A-B.C/D" delims="./-">
		${token}<br>
	</c:forTokens>
	<!--  
		forEach step = -1 안됨..
	
	-->
	<hr>
	<c:set var = "nownum" value = "10"/>
	<c:forEach var = "i" begin = "0" end = "${nownum}" step="1"><!-- step >> 증가치 -->
		${nownum - i}<br>
	</c:forEach>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>