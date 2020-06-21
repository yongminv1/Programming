<%@page import="java.net.URLDecoder"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>쿠키 인코딩</title>
</head>
<body>
<!-- 
JSESSIONID
1. TOMCAT 컨테이너에서 세션을 유지하기 위해 발급 하는 키
2. 브라우저에 최초 접근시 TOMCAT을 Response 헤더에 JSSESSIONID값이 발급된다.
예) Set-Cookie : JSESSIONID: D143E160959E1566560826EFEF57D547
3. 브라우저 재요청시 Response를 통해 받은 JSESSIONID를 Request 헤더의
	쿠키에 값을 넣어 서버에 요청한다.
	쿠키를 통해 JSESSIONID값을 전달 받게 되면
	서버는 새로운 JSESSIONID  값을 Response 헤더에 발급되지 않는다.
4. 클라이언트로부터 전달받은 JSESSIONID값을 기준으로
	서버에서는 세션 메모리 영역에 상태를 유지할 값들을 저장할 수 있게 된다.(HttpSession 등)
5. 동일한 Full 도메인(서브도메인이 다를 경우 쿠키가 유지되지 않음)
	포트번호는 달라도 무관
6. TOMCAT 컨테이너를 2대 이상 사용하게 될 경우 세션을 유지할 수 없다.
	단, 유지하기 위해서는 세션 클러스터링 환경을 구축해야 한다.
	클러스트링 환경 : 논리적으로 다른서버에서 요청이 여러개 들어왔을때 
	클러스트링으로 연결을 해주면 동일한 역할을 하게함( ROBIN , 여러가지)

 -->


<!-- 
쿠키(Cookie)
1. 기본적으로 클라이언트 소유 : 브라우저마다 저장 위치가 다르다.
2. 서버에 요청시 Response 헤더에 자동으로 포함해서 클라이언트에 전송됨
예) Set-Cookie : JSESSIONID: D143E160959E1566560826EFEF57D547
3. 서버단에서 필요에 의해 클라이언트에 생성하도록 지시(Set-Cookie) : JSESSIONID
4. HttpOnly, Secure 속성
	서버 -> 클라이언트로 던져주며, 클라이언트 -> 서버는 값을 주지 않음.
	디버깅 창에서  Response 속성으로만 확인 가능
5. 세션 쿠키, 영구적 쿠키
1) 만료시간을 지정하면 영구적 쿠키, 파일저장
2) 만료시간이 없으면 세션쿠키, 메모리저장, 브라우저 닫으면 삭제됨


 -->
<h2> 쿠키 한글 입력시 인코딩 처리 삽입, 그래도 출력</h2>
<%


	Cookie user = new Cookie("username", URLEncoder.encode("이용민", "EUC-KR"));
	Cookie pass = new Cookie("password", URLEncoder.encode("이용민1234", "EUC-KR"));
	
	//만료시간을 지정해준다.(zero로 설정 시 생성되자마자 삭제된다.)
	//setMaxAge(-1) :
	//setMaxAge(0) :
	//setMaxAge(60*60*24) : 초 * 시간 * 숫자
	//user.setMaxAge(60*60*24);
	//pass.setMaxAge(60*60*24);
	
	//2분
	user.setMaxAge(60*2);
	pass.setMaxAge(60*2);
	response.addCookie(user);
	response.addCookie(pass);
	System.out.println("user >>> " + user);
	System.out.println("pass >>> " + pass);
	
	//HttpOnly 설정 (domain.cookie를 이용해서 누군가가 쿠키에 접속 못하도록 하는 것.)
	//단 브라우저가 HttpOnly 를 지원하는 경우 만.
	//웹페이지에 크로스 사이트 스크립트(XSS) 공격이 가능하면 쿠키값을 가져올 수 있다.
	//서버에 SetCookie 헤더를 보낼때 HttpOnly 옵션을 주어 쿠키 접근 방지
	//web.xml 설정
	//<session-config>
	//<cookie-cofign>
	//<http-only>true</http-only>
	//</cookie-config>
	//</session-config>
	//<server.xml
	//<Context path="" useHttpOnly="true">
	
	String sessionID = request.getSession().getId();
	response.setHeader("SET-COOKIE", "JSESSIONID="+sessionID+";HttpOnly");
	
	Cookie[] ckVal = request.getCookies();
	System.out.println("ckVal >>> " + request.getCookies());
	if (ckVal != null){
		for(Cookie cook: ckVal){
			out.println(cook.getName() + ":");
			out.println(cook.getValue() + "<br>");
			System.out.println("cookie >>> " + cook.getName() + ":");
			System.out.println("cookie >>> " + cook.getValue() + ":");
		}
	}//end of if
%>
<h2> 쿠키 한글로 디코딩하여 출력</h2>
<%
	if(ckVal != null){
		for(Cookie cook: ckVal){
			out.println(cook.getName() + ":");
			out.println(URLDecoder.decode(cook.getValue(), "EUC-KR") + "<br>");
			System.out.println("cookie >>> " + cook.getName() + ": " + URLDecoder.decode(cook.getValue(), "EUC-KR"));
		}
	}//end of if
%>
</body>
</html>